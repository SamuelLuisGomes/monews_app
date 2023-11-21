import 'package:flutter/material.dart';
import 'package:monews_app/models/noticias_model.dart';
import 'package:monews_app/views/noticias/pagina_noticias_view.dart';

class MyListNoticias extends StatelessWidget {
  final NoticiasModel noticias;
  const MyListNoticias({super.key, required this.noticias});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: GestureDetector(
        child: noticias.imagemUrl != null
            ? Column(
                children: [
                  ClipRRect(
                    // borderRadius: BorderRadius.circular(12),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.network(
                      noticias.imagemUrl.toString(),
                      fit: BoxFit.cover,
                      height: 180,
                      width: 420,
                    ),
                  ),
                  Container(
                    //padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      color: Colors.blueGrey[600],
                    ),
                    child: ListTile(
                      title: Text(
                        noticias.titulo.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Fonte: ${noticias.autor.toString()}',
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ),
                  )
                ],
              )
            : Column(
                children: [
                  Container(
                    //padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius:  BorderRadius.circular(12),
                      color: Colors.blueGrey[600],
                    ),
                    child: ListTile(
                      title: Text(
                        noticias.titulo.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Fonte: ${noticias.autor.toString()}',
                        style: const TextStyle(color: Colors.white70),
                      ),
                      isThreeLine: true,
                    ),
                  )
                ],
              ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return PaginaNoticiasView(
                  url: noticias.urlMateria.toString(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
