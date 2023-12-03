import 'package:flutter/material.dart';
import 'package:monews_app/components/categorias_components.dart';
import 'package:monews_app/components/list_noticias_components.dart';
import 'package:monews_app/components/loading_components.dart';
import 'package:monews_app/components/search_components.dart';
import 'package:monews_app/controllers/categoria_controller.dart';
import 'package:monews_app/controllers/noticias_controller.dart';
import 'package:monews_app/models/categoria_model.dart';
import 'package:monews_app/models/noticias_model.dart';
import 'package:monews_app/views/noticias/pesquisa_noticias_view.dart';

class NoticiasView extends StatefulWidget {
  const NoticiasView({super.key});

  @override
  State<NoticiasView> createState() => _NoticiasViewtState();
}

class _NoticiasViewtState extends State<NoticiasView> {
  final List<NoticiasModel> _noticias = <NoticiasModel>[];
  List<NoticiasModel> _noticiasDisplay = <NoticiasModel>[];
  List<CategoriaModel> categorias = [];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    categorias = pegarCategorias();
    fetchNoticiasModel().then((value) {
      setState(() {
        _isLoading = false;
        _noticias.addAll(value);
        _noticiasDisplay = _noticias;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromRGBO(38, 50, 56, 1),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "MO",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "NEWS",
                          style: TextStyle(
                            fontSize: 24,
                            color: Color.fromRGBO(34, 211, 238, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: _isLoading
            ? const Center(child: MyLoading())
            : CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 12,
                            top: 18,
                            bottom: 12,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Categorias',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 12),
                          height: 100,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: categorias.length,
                            itemBuilder: (context, index) {
                              return CategoriasTitulo(
                                imagem: categorias[index].image,
                                nomeCategoria: categorias[index].nomeCategoria,
                                nomePtbr: categorias[index].nomePtbr,
                              );
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 12,
                            top: 18,
                            bottom: 12,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Notícias Recomendadas',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return MyListNoticias(
                          noticias: _noticiasDisplay[index],
                        );
                      },
                      childCount: _noticiasDisplay.length,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
