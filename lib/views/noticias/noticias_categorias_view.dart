import 'package:flutter/material.dart';
import 'package:monews_app/components/app_bar_static_components.dart';
import 'package:monews_app/components/container_resposta_components.dart';
import 'package:monews_app/components/list_noticias_components.dart';
import 'package:monews_app/components/loading_components.dart';
import 'package:monews_app/controllers/noticias_controller.dart';
import 'package:monews_app/models/noticias_model.dart';
import 'package:monews_app/themes/theme.dart';

class NoticiasCategoria extends StatefulWidget {
  final String categoria;
  final String categoriaNome;
  NoticiasCategoria(
      {super.key, required this.categoria, required this.categoriaNome});

  @override
  State<NoticiasCategoria> createState() => _NoticiasCategoriaState();
}

class _NoticiasCategoriaState extends State<NoticiasCategoria> {
  final List<NoticiasModel> _noticias = <NoticiasModel>[];
  List<NoticiasModel> _noticiasDisplay = <NoticiasModel>[];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNoticiasCategorias(widget.categoria).then((value) {
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
      //backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBarStatic(),
      body: SafeArea(
          child: _isLoading
              ? const Center(child: MyLoading())
              : CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          if (_noticiasDisplay.isEmpty) {
                            return ContainerPadrao(
                              texto:
                                  'Não encontramos as notícias dessa categoria',
                            );
                          } else {
                            return MyListNoticias(
                              noticias: _noticiasDisplay[index],
                            );
                          }
                        },
                        childCount: _noticiasDisplay.isEmpty
                            ? 1
                            : _noticiasDisplay.length,
                      ),
                    ),
                  ],
                )
          // :ListView.builder(
          //   itemBuilder: (context, index) {
          //     if (!_isLoading) {
          //       return MyListNoticias(
          //         noticias: _noticiasDisplay[index],
          //       );
          //     } else {
          //       return const MyLoading();
          //     }
          //   },
          //   itemCount: _noticiasDisplay.length,
          //   shrinkWrap: true,
          // ),
          ),
    );
  }
}
