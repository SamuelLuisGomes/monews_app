class UsuarioModel {
  String? nome;
  String? email;
  String? senha;

  UsuarioModel({
    this.nome,
    this.email,
    this.senha,
  });

  UsuarioModel.fromMap(Map<String, dynamic> map) {
    nome = map['nome'];
    email = map['email'];
    senha = map['senha'];
  }
}
