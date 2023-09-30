import 'dart:isolate';

import 'package:flutter/material.dart';

class AcoesView extends StatefulWidget {
  @override
  State<AcoesView> createState() => _AcoesViewtState();
}

class _AcoesViewtState extends State<AcoesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CustomScrollView(
            slivers: [
              // SliverAppBar(
              //   pinned: false,
              //   floating: true,
              //   snap: true,
              //   expandedHeight: 320,
              //   flexibleSpace: FlexibleSpaceBar(
              //     title: Text('Ações'),
              //     titlePadding: EdgeInsets.only(left: 24, bottom: 24),
              //   ),
              //   centerTitle: false,
              // ),
              SliverAppBar(
                centerTitle: false,
                pinned: false,
                floating: true,
                snap: true,
                expandedHeight: 320,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  titlePadding: EdgeInsets.only(left: 24),
                  title: Text('Ações'),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 71, 203, 239),
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
                            color: Color.fromARGB(255, 71, 203, 239),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          height: 80, // Reduzi a altura dos botões
                          width: 80, // Reduzi a largura dos botões
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 32, // Aumentei o tamanho do ícone
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: ListTile(
                        title: Text('Sigla da ação: $index'),
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
