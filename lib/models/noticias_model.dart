import 'package:flutter/foundation.dart';

class NoticiasModel {
  String? autor;
  String? titulo;
  String? descricao;
  String? data;
  String? urlMateria;
  String? imagemUrl;

  NoticiasModel({
    required this.autor,
    required this.titulo,
    required this.descricao,
    required this.data,
    required this.urlMateria,
    required this.imagemUrl,
  });

  factory NoticiasModel.fromMap(Map<String, dynamic> map) {
    return NoticiasModel(
      autor: map['author'],
      titulo: map['title'],
      descricao: map['materia'],
      data: map['publishedAt'],
      urlMateria: map['url'],
      imagemUrl: map['urlToImage'],
    );
  }
}
