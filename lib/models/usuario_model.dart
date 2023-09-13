class UsuarioModel {
  String? nome;
  // String? email;
  // String? senha;
  String? uid;

  UsuarioModel({
    this.nome,
    // this.email,
    // this.senha,
    this.uid,
  });

  UsuarioModel.fromMap(Map<String, dynamic> map) {
    nome = map['nome'];
    // email = map['email'];
    // senha = map['senha'];
    uid = map['uid'];
  }
}
