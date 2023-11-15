import 'package:flutter/material.dart';
import 'package:monews_app/components/list_noticias_components.dart';
import 'package:monews_app/components/loading_components.dart';
import 'package:monews_app/controllers/noticias_controller.dart';
import 'package:monews_app/models/noticias_model.dart';

class NoticiasView extends StatefulWidget {
  const NoticiasView({super.key});

  @override
  State<NoticiasView> createState() => _NoticiasViewtState();
}

class _NoticiasViewtState extends State<NoticiasView> {
  final List<NoticiasModel> _noticias = <NoticiasModel>[];
  List<NoticiasModel> _noticiasDisplay = <NoticiasModel>[];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
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
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
          ),
        ),
      ),
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
}
