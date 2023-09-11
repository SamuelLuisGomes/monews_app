class AcoesModel {
  String? sigla;
  String? empresaOrigem;
  double? valor;

  AcoesModel(
    this.sigla,
    this.empresaOrigem,
    this.valor,
  );

  AcoesModel.fromMap(Map<String, dynamic> map) {
    sigla = map['sigla'];
    empresaOrigem = map['empresa'];
    valor = map['cotacao'];
  }
}
