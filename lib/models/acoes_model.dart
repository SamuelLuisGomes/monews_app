import 'package:flutter/foundation.dart';

class AcoesModel {
  String? siglaAcao;
  String? nomeEmpresa;
  String? imagemAcao;
  String? setor;

  AcoesModel({
    required this.siglaAcao,
    required this.nomeEmpresa,
    required this.imagemAcao,
    required this.setor,
  });

  factory AcoesModel.fromMap(Map<String, dynamic> map) {
    return AcoesModel(
      siglaAcao: map['stock'],
      nomeEmpresa: map['name'],
      imagemAcao: map['logo'],
      setor: map['sector'],
    );
  }

  // Map<String, dynamic> toMap() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['stock'] = siglaAcao;
  //   data['name'] = nomeEmpresa;
  //   data['logo'] = imagemAcao;
  //   data['sector'] = setor;
  //   return data;
  // }
}
