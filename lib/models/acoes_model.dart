class AcoesModel {
  String? siglaAcao;
  String? nomeEmpresa;
  String? imagemAcao;

  AcoesModel(
    this.siglaAcao,
    this.nomeEmpresa,
    this.imagemAcao,
  );

  AcoesModel.fromMap(Map<String, dynamic> map) {
    siglaAcao = map['sigla'];
    nomeEmpresa = map['empresa'];
    imagemAcao = map['imagem'];
  }
}
