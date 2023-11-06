import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:monews_app/components/exceptions.dart';
import 'package:monews_app/main.dart';
import 'package:monews_app/services/http_client.dart';
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
    }
  } on FirebaseAuthException catch (e) {
    throw AuthenticationException(
      e.toString(),
    );
  }
}

atualizaCarteira(BuildContext context, List<AcoesModel> carteira) async {
  try {
    final referenciaUsuario =
        auth.firebase.collection('usuario').doc(auth.usuarioLogado().uid);
    referenciaUsuario.update({'carteira': carteira}).then((_) {
      showDialog(
          context: context,
          builder: (context) {
            return showAlertDialogError(context, 'Carteira Atualizados');
          });
    });
  } on FirebaseAuthException catch (e) {
    throw AuthenticationException(e.toString());
  }
}
