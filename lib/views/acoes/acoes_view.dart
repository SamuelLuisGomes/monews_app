import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:monews_app/components/container_acao_components.dart';

class AcoesView extends StatefulWidget {
  @override
  State<AcoesView> createState() => _AcoesViewtState();
}

class _AcoesViewtState extends State<AcoesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: Center(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
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
                          onTap: () {},
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
                          onTap: () {},
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
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ListTile(
                        //title: Text('Sigla da ação: $index'),
                        title: acaoContainer(
                          siglaAcao: 'AAPL34',
                          nomeEmpresa: 'Apple - $index',
                          imagemAcao: 'lib/images/apple.png',
                        ),
                      ),
                    );
                  },
                  childCount: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
