import 'package:flutter/material.dart';
import 'package:monews_app/components/app_bar_components.dart';
import 'package:monews_app/components/list_noticias_components.dart';
import 'package:monews_app/components/loading_components.dart';
import 'package:monews_app/components/search2_components.dart';
import 'package:monews_app/components/search_components.dart';
import 'package:monews_app/controllers/noticias_controller.dart';
import 'package:monews_app/models/noticias_model.dart';

class PesquisaNoticias extends StatefulWidget {
  const PesquisaNoticias({super.key});

  @override
  State<PesquisaNoticias> createState() => _PesquisaNoticiasState();
}

class _PesquisaNoticiasState extends State<PesquisaNoticias> {
  final List<NoticiasModel> _noticias = <NoticiasModel>[];
  List<NoticiasModel> _noticiasDisplay = <NoticiasModel>[];
  /// String txt = "";
  bool _isLoading = true;

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: MenuVoltar(),
      body: SafeArea(
          child: ListView.builder(
            itemBuilder: (context, index) {
              if (!_isLoading) {
                return MyListNoticias(
                  noticias: _noticiasDisplay[index],
                );
              } else {
                return const MyLoading();
              }
            },
            itemCount: _noticiasDisplay.length,
            shrinkWrap: true,
          )),
    );
  }

  // void atualizaPesquisa(String searchText) {
  //   setState(() {
  //     //_isLoading = true;
  //     txt = searchText;
  //   });
  //   fetchNoticiasPesquisa(txt).then((value) {
  //     setState(() {
  //       _isLoading = false;
  //       _noticias.addAll(value);
  //       _noticiasDisplay = _noticias;
  //     });
  //   });
  // }
}
