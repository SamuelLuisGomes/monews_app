import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monews_app/components/app_bar_components.dart';
import 'package:monews_app/components/app_bar_static_components.dart';
import 'package:monews_app/components/container_resposta_components.dart';
import '../../models/acoes_model.dart';
import '../../controllers/acoes_controller.dart';
import '../../components/search_components.dart';
import '../../components/list_acoes_components.dart';
import '../../components/loading_components.dart';

class PesquisaAcoesView extends StatefulWidget {
  const PesquisaAcoesView({super.key});

  @override
  State<PesquisaAcoesView> createState() => _PesquisaAcoesViewState();
}

class _PesquisaAcoesViewState extends State<PesquisaAcoesView> {
  final List<AcoesModel> _acoes = <AcoesModel>[];
  List<AcoesModel> _acoesDisplay = <AcoesModel>[];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAcoesModel().then((value) {
      setState(() {
        _isLoading = false;
        _acoes.addAll(value);
        _acoesDisplay = _acoes;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStatic(),
      body: SafeArea(
        child: Center(
          child: _isLoading
              ? const MyLoading()
              : Column(
                  children: [
                    MySearch(
                      hintText: 'Ex: sigla ou nome da empresa',
                      onChanged: (searchText) {
                        searchText = searchText.toLowerCase();
                        setState(
                          () {
                            _acoesDisplay = _acoes.where((u) {
                              var siglaAcaoLowerCase =
                                  u.siglaAcao.toString().toLowerCase();
                              var nomeEmpresaLowerCase =
                                  u.nomeEmpresa.toString().toLowerCase();
                              return siglaAcaoLowerCase.contains(searchText) ||
                                  nomeEmpresaLowerCase.contains(searchText);
                            }).toList();
                          },
                        );
                      },
                    ),
                    if (_acoesDisplay.isEmpty)
                      ContainerPadrao(
                        texto: 'Não encontramos a ação',
                      ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return MyListAcoes(
                            acoes: _acoesDisplay[index],
                            addCarteira: () {
                              addAcoesCarteira(
                                context,
                                _acoesDisplay[index],
                              );
                            },
                          );
                        },
                        itemCount: _acoesDisplay.length,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
