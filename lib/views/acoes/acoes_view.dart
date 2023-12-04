import 'package:flutter/material.dart';
import 'package:monews_app/components/alert_dialog_components.dart';
import 'package:monews_app/components/container_acao_components.dart';
import 'package:monews_app/components/container_resposta_components.dart';
import 'package:monews_app/components/list_acoes_components.dart';
import 'package:monews_app/components/loading_components.dart';
import 'package:monews_app/controllers/acoes_controller.dart';
import 'package:monews_app/controllers/autenticacao_controller.dart';
import 'package:monews_app/models/acoes_model.dart';
import 'package:monews_app/views/acoes/pesquisa_acoes_view.dart';
import 'package:monews_app/views/acoes/remove_acoes.dart';

class AcoesView extends StatefulWidget {
  @override
  State<AcoesView> createState() => _AcoesViewState();
}

class _AcoesViewState extends State<AcoesView> {
  AutenticacaoController auth = AutenticacaoController();
  List<AcoesModel> carteira = <AcoesModel>[];

  @override
  void initState() {
    super.initState();
    pegarCarteira().listen((itens) {
      setState(() {
        carteira = itens;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                floating: true,
                pinned: true,
                snap: true,
                expandedHeight: 120,
                centerTitle: true,
                backgroundColor: Theme.of(context).primaryColor,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  titlePadding: EdgeInsets.only(left: 38, bottom: 12),
                  title: Text(
                    'Ações',
                    style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 32),
                  ),
                ),
                elevation: 0,
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 200,
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 64),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const PesquisaAcoesView();
                                },
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 1),
                            ),
                            height: 80, // Reduzi a altura dos botões
                            width: 80, // Reduzi a largura dos botões
                            child: const Icon(
                              Icons.add,
                              // color: Theme.of(context).colorScheme.primary,
                              size: 32, // Aumentei o tamanho do ícone
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const RemoveAcoes();
                            }));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 1),
                            ),
                            height: 80, // Reduzi a altura dos botões
                            width: 80, // Reduzi a largura dos botões
                            child: const Icon(Icons.remove,
                                // color:Theme.of(context).colorScheme.primary,
                                size: 32 // Aumentei o tamanho do ícone
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    if (carteira.isEmpty) {
                      return ContainerPadrao(
                        texto: 'Não encontramos ações na carteira!',
                      );
                    } else {
                      return StreamBuilder<List<AcoesModel>>(
                        stream: pegarCarteira(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const MyLoading();
                          } else if (snapshot.hasError) {
                            return Text('Erro: ${snapshot.error}');
                          } else {
                            final acoes = snapshot.data;
                            // final acoesCarteira = converterSnapshot(acoes);
                            if (acoes != null && index <= acoes.length) {
                              print('Acoes Snapshot: ${acoes}');
                              print(
                                  '=================================================');
                              return MyListAcoes(acoes: acoes[index]);
                            } else {
                              return const SizedBox();
                            }
                          }
                        },
                      );
                    }
                  },
                  childCount: carteira.isEmpty ? 1 : carteira.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
