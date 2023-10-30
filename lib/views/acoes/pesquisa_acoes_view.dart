import 'package:flutter/material.dart';
import 'package:monews_app/components/app_bar_components.dart';
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
      backgroundColor: Colors.blueGrey[900],
      appBar: menuVoltar(context),
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
                          _acoesDisplay = _acoes.where((u) {
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
                      acoes: _acoesDisplay[index - 1],
                      addCarteira: () {
                        addAcoesCarteira(
                          context,
                          _acoesDisplay[index - 1],
                        );
                      },
                    );
            } else {
              return const MyLoading();
            }
          },
          itemCount: _acoesDisplay.length + 1,
        ),
      ),
    );
  }
}
