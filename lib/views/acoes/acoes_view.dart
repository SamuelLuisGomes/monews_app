import 'package:flutter/material.dart';
import 'package:monews_app/components/alert_dialog_components.dart';
import 'package:monews_app/components/container_acao_components.dart';
import 'package:monews_app/components/list_acoes_components.dart';
import 'package:monews_app/components/loading_components.dart';
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
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: Center(
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                floating: true,
                pinned: true,
                snap: true,
                expandedHeight: 120,
                centerTitle: true,
                backgroundColor: Color.fromARGB(255, 10, 140, 176),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  titlePadding: EdgeInsets.only(left: 38, bottom: 12),
                  title: Text(
                    'Ações',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32),
                  ),
                ),
                elevation: 0,
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 200,
                  color: Color.fromARGB(255, 10, 140, 176),
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
                              color: Color.fromRGBO(67, 115, 150, 100),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            height: 80, // Reduzi a altura dos botões
                            width: 80, // Reduzi a largura dos botões
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
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
                              color: Color.fromRGBO(67, 115, 150, 100),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            height: 80, // Reduzi a altura dos botões
                            width: 80, // Reduzi a largura dos botões
                            child: Icon(Icons.remove,
                                color: Colors.white,
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
                  },
                  childCount: carteira.length,
                ),
              ),
            ],
          ),
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
