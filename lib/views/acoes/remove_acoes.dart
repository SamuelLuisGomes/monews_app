import 'package:flutter/material.dart';
import 'package:monews_app/components/alert_dialog_components.dart';
import 'package:monews_app/components/app_bar_components.dart';
import 'package:monews_app/components/search_components.dart';
import 'package:monews_app/controllers/acoes_controller.dart';

import '../../components/list_acoes_components.dart';
import '../../components/loading_components.dart';
import '../../controllers/autenticacao_controller.dart';
import '../../models/acoes_model.dart';

class RemoveAcoes extends StatefulWidget {
  const RemoveAcoes({super.key});

  @override
  State<RemoveAcoes> createState() => _RemoveAcoesState();
}

class _RemoveAcoesState extends State<RemoveAcoes> {
  AutenticacaoController auth = AutenticacaoController();
  List<AcoesModel> carteira = <AcoesModel>[];
  List<AcoesModel> carteiraDisplay = <AcoesModel>[];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    pegarCarteira().listen((itens) {
      setState(() {
        _isLoading = false;
        carteira = itens;
        carteiraDisplay = carteira;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: MenuVoltar(),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (!_isLoading) {
              return index == 0
                  ? MySearch(
                      hintText: 'Ex: sigla ou nome da empresa',
                      onChanged: (searchText) {
                        searchText = searchText.toLowerCase();
                        setState(() {
                          carteiraDisplay = carteira.where((u) {
                            var siglaAcaoLowerCase =
                                u.siglaAcao.toString().toLowerCase();
                            var nomeEmpresaLowerCase =
                                u.nomeEmpresa.toString().toLowerCase();
                            return siglaAcaoLowerCase.contains(searchText) ||
                                nomeEmpresaLowerCase.contains(searchText);
                          }).toList();
                        });
                      },
                    )
                  : MyListAcoes(
                      acoes: carteiraDisplay[index - 1],
                      removeCarteira: () {
                        // showAlertDialogaAcoes(context,
                        //     'Tem certeza que deseja excluir a ação: ${carteiraDisplay[index - 1].siglaAcao}');
                        atualizaCarteira(
                          context,
                          carteiraDisplay[index - 1],
                        );
                      },
                    );
            } else {
              return const MyLoading();
            }
          },
          itemCount: carteiraDisplay.length + 1,
        ),
      ),
    );
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
        //return converterSnapshot(carteiraAcoes);
        // final carteira = converterSnapshot(carteiraAcoes);
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
}
