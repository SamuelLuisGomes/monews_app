import 'package:flutter/material.dart';
import 'package:monews_app/components/loading_components.dart';
import 'package:monews_app/models/noticias_model.dart';

class MyListNoticias extends StatelessWidget {
  final NoticiasModel noticias;
  const MyListNoticias({super.key, required this.noticias});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.blueGrey[600],
            ),
            child: ListTile(
              leading: Hero(
                tag: noticias.titulo.toString(),
                child: CircleAvatar(
                  radius: 16,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      noticias.imagemUrl.toString(),
                      height: 52,
                      width: 52,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
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
          )
        ],
      ),
    );
  }
}
