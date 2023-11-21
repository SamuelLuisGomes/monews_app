import 'package:flutter/material.dart';
import 'package:monews_app/components/list_noticias_components.dart';
import 'package:monews_app/components/loading_components.dart';
import 'package:monews_app/controllers/noticias_controller.dart';
import 'package:monews_app/models/noticias_model.dart';

class NoticiasCategoria extends StatefulWidget {
  final String categoria;
  NoticiasCategoria({super.key, required this.categoria});

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
      backgroundColor: const Color.fromRGBO(38, 50, 56, 1),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Padding(
          padding: const EdgeInsets.only(left: 84),
          child: Row(
           // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "MO",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "NEWS",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              // IconButton(
              //   icon: Icon(
              //     Icons.search,
              //     color: Colors.white,
              //   ),
              //   onPressed: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) {
              //       return PesquisaNoticias();
              //     }));
              //   },
              // ),
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: _isLoading
              ? const Center(child: MyLoading())
              : CustomScrollView(
                  slivers: [
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
