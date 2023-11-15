import 'package:flutter/material.dart';
import 'package:monews_app/models/noticias_model.dart';
import 'package:monews_app/views/noticias/pagina_noticias_view.dart';

class MyListNoticias extends StatelessWidget {
  final NoticiasModel noticias;
  const MyListNoticias({super.key, required this.noticias});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blueGrey[600],
              ),
              child: ListTile(

                // leading: Hero(
                //   tag: noticias.titulo.toString(),
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(8),
                //     child: Image.network(
                //       noticias.imagemUrl.toString(),
                //       height: 42,
                //       width: 66,
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                // leading: Container(
                //   //height: 100,
                //   width: 56,
                //   decoration:
                //       BoxDecoration(borderRadius: BorderRadius.circular(8)),
                //   child: Image.network(
                //     noticias.imagemUrl.toString(),
                //     fit: BoxFit.cover,
                //   ),
                // ),
                // leading: Container(
                //   height: 180,
                //   width: 100,
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(8),
                //     child: Image.network(
                //       noticias.imagemUrl.toString(),
                //       // height: 120,
                //       // width: 80,
                //       fit: BoxFit.contain,
                //     ),
                //   ),
                // ),
                title: Text(
                  noticias.titulo.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  noticias.autor.toString(),
                  style: const TextStyle(color: Colors.white70),
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const PaginaNoticiasView();
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
