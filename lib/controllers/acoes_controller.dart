import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:monews_app/components/snackbar_components.dart';
import 'package:monews_app/controllers/autenticacao_controller.dart';
import 'package:monews_app/components/alert_dialog_components.dart';

import '../models/acoes_model.dart';
import 'package:http/http.dart' as http;

const String url = "https://brapi.dev/api/quote/list";

AutenticacaoController auth = AutenticacaoController();

List<AcoesModel> parseAcoesModel(String responseBody) {
  var data = json.decode(responseBody) as Map<String, dynamic>;
  var list = data['stocks'] as List<dynamic>;
  var acoes = list.map((e) => AcoesModel.fromMap(e)).toList();
  return acoes;
}

Future<List<AcoesModel>> fetchAcoesModel() async {
  final http.Response response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return compute(parseAcoesModel, response.body);
  } else {
    throw Exception(response.statusCode);
  }
}

addAcoesCarteira(BuildContext context, AcoesModel acao) async {
  try {
    final referenciaUsuario =
        auth.firebase.collection('usuario').doc(auth.usuarioLogado().uid);
    final dadosUsuario = await referenciaUsuario.get();
    final carteira = dadosUsuario.data()?['carteira'] ?? [];

    bool acaoNaCarteira = false;
    int index = -1;
    for (var i = 0; i < carteira.length; i++) {
      if (carteira[i]['siglaAcao'] == acao.siglaAcao) {
        acaoNaCarteira = true;
        index = i;
        break;
      }
    }
    if (acaoNaCarteira) {
      showDialog(
          context: context,
          builder: (context) {
            return showAlertDialogError(context, 'Acão já está na carteira');
          });
    } else {
      carteira.add({
        'siglaAcao': acao.siglaAcao,
        'nomeEmpresa': acao.nomeEmpresa,
        'imagemAcao': acao.imagemAcao,
        'setor': acao.setor,
      });
      referenciaUsuario.update({'carteira': carteira});
      snackBarCustom(context, '${acao.siglaAcao} adicionada a carteira!');
    }
  } on FirebaseAuthException catch (e) {
    throw AuthenticationException(
      e.toString(),
    );
  }
}

atualizaCarteira(BuildContext context, AcoesModel removerAcoes) async {
  try {
    final referenciaUsuario =
        auth.firebase.collection('usuario').doc(auth.usuarioLogado().uid);
    final dadosUsuario = await referenciaUsuario.get();
    final carteira = dadosUsuario.data()?['carteira'] ?? [];
    print('Carteira atual: ${carteira}');
    print('================================================================');

    // final confirmacao = showAlertDialogaAcoes(
    //     context, 'Realmente deseja excluir a ação: ${removerAcoes.siglaAcao}');
    carteira.removeWhere((acao) => acao['siglaAcao'] == removerAcoes.siglaAcao);
    await referenciaUsuario.update({
      'carteira': carteira,
    });
    print('Carteira Atualizada: ${carteira}');
    snackBarCustom(context, '${removerAcoes.siglaAcao} removida com sucesso');

    // if (confirmacao == true) {
    // }
  } on FirebaseAuthException catch (e) {
    throw AuthenticationException(
      e.toString(),
    );
  }
}

Stream<List<AcoesModel>> pegarCarteira() {
  if (auth.usuarioLogado() != null) {
    final refUsuario =
        auth.firebase.collection('usuario').doc(auth.usuarioLogado().uid);
    return refUsuario.snapshots().map((snapshot) {
      final dados = snapshot.data();
      var carteiraAcoes = dados?['carteira'] ?? <dynamic>[];
      print("Carteira na Função: ${carteiraAcoes}");
      final carteira = converterSnapshot(carteiraAcoes);
      return carteira;
    });
  } else {
    return const Stream.empty();
  }
}
  List<AcoesModel> converterSnapshot(List<dynamic> acoes) {
    if (acoes != null) {
      final listaFinal = acoes
          .map((item) => AcoesModel(
              siglaAcao: item['siglaAcao'],
              nomeEmpresa: item['nomeEmpresa'],
              imagemAcao: item['imagemAcao'],
              setor: item['setor']))
          .toList();
      return listaFinal;
    } else {
      return [];
    }
  }

