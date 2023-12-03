import 'package:flutter/material.dart';
import 'package:monews_app/views/noticias/noticias_categorias_view.dart';

class CategoriasTitulo extends StatelessWidget {
  final imagem, nomeCategoria, nomePtbr;
  const CategoriasTitulo(
      {super.key, this.imagem, this.nomeCategoria, this.nomePtbr});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                imagem,
                width: 160,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 160,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Center(
                child: Text(
                  nomePtbr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) {
              return NoticiasCategoria(
                categoria: nomeCategoria,
                categoriaNome: nomePtbr,
              );
            }),
          ),
        );
      },
    );
  }
}
