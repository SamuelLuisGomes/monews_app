import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:monews_app/controllers/autenticacao_controller.dart';

import 'package:monews_app/models/noticias_model.dart';
import 'package:http/http.dart' as http;

const String url =
    "https://newsapi.org/v2/everything?language=pt&q=Agua&apiKey=fc0ae4d053a8431eac1deeb7d667cc27";



AutenticacaoController auth = AutenticacaoController();

List<NoticiasModel> parseNoticiasModel(String responceBody) {
  var data = json.decode(responceBody) as Map<String, dynamic>;
  var list = data['articles'] as List<dynamic>;
  var noticias = list.map((e) => NoticiasModel.fromMap(e)).toList();
  return noticias;
}

Future<List<NoticiasModel>> fetchNoticiasModel() async {
  final http.Response response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return compute(parseNoticiasModel, response.body);
  } else {
    throw Exception(response.statusCode);
  }
}
