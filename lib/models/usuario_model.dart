class UsuarioModel {
  String? nome;
  String? uid;
  String? img;
  List<String>? carteira;
  int? qtdNoticias;

  UsuarioModel({
    this.nome,
    this.uid,
    this.img,
    this.carteira,
    this.qtdNoticias,
  });

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      nome: map['nome'] ?? '',
      uid: map['uid'] ?? '',
      img: map['img'] ?? '',
      carteira: List<String>.from(map['carteira'] ?? []),
      qtdNoticias: map['qtdNoticias'] ?? 0,
    );
  }
}
