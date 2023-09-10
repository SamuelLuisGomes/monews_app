class Noticias {
  String? titulo;
  String? materia;
  String? portalOrigem;
  DateTime? data;
  String? imagemUrl;

  Noticias(
    this.titulo,
    this.materia,
    this.portalOrigem,
    this.data,
    this.imagemUrl,
  );

  Noticias.fromMap(Map<String, dynamic> map) {
    titulo = map['titulo'];
    materia = map['materia'];
    portalOrigem = map['origem'];
    data = map['data'];
    imagemUrl = map['imagem'];
  }
}
