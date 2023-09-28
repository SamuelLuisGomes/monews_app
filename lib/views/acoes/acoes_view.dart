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
              SliverAppBar(
                centerTitle: false,
                expandedHeight: 320, // Aumente a altura do SliverAppBar
                pinned: true,
                floating: false,
                backgroundColor: Color.fromARGB(255, 10, 140, 176),
                flexibleSpace: FlexibleSpaceBar(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 48),
                    child: Text(
                      'Ações',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ),
                  centerTitle: false,
                  titlePadding: EdgeInsets.only(left: 0),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  child: SizedBox(
                    height: 56, // Altura dos botões
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 71, 203, 239),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            height: 40, // Altura dos botões
                            width: 40, // Largura dos botões
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20, // Tamanho do ícone
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
                            height: 40, // Altura dos botões
                            width: 40, // Largura dos botões
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 20, // Tamanho do ícone
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SliverAppBarDelegate({required this.child});

  @override
  double get minExtent => 56.0;

  @override
  double get maxExtent => 56.0;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
