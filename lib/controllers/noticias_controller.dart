import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:monews_app/controllers/acoes_controller.dart';

import 'package:monews_app/models/acoes_model.dart';

import 'package:monews_app/models/noticias_model.dart';
import 'package:http/http.dart' as http;

// == Endpoints - NewsAPI == \\

/* Everything */
// base + /v2/everything \\

/* Top headlines */
// base + /v2/top-headlines \\
const String base = "https://newsapi.org";
const String endEverything = "/v2/everything?";
const String endTop = "/v2/top-headlines?";
//const String apiKey = "fc0ae4d053a8431eac1deeb7d667cc27"; // original
const String apiKey = "e4a2f3983a394159a79436e9fe697e49"; //teste

Future<List<AcoesModel>> pegarCarteiraLista() async {
  Stream<List<AcoesModel>> carteiraStream = pegarCarteira();
  List<AcoesModel> carteiraLista = await carteiraStream.first;
  return carteiraLista;
}

Future<String> formandoUrl() async {
  List<AcoesModel> carteira = await pegarCarteiraLista();
  String url;
  if (carteira.isNotEmpty) {
    List<String?> empresas = carteira.map((acao) => acao.nomeEmpresa).toList();
    print(empresas);
    url = "$base${endEverything}q=${empresas.join(",")}&apiKey=${apiKey}";
  } else {
    url =
        "https://newsapi.org/v2/everything?language=pt&q=agua&apiKey=${apiKey}";
  }
  print(url);
  return url;
}

Future<List<NoticiasModel>> fetchNoticiasModel() async {
  List<AcoesModel> carteira = await pegarCarteiraLista();
  List<NoticiasModel> noticias = [];

  for (AcoesModel acao in carteira) {
    String url = "$base${endEverything}q=${acao.nomeEmpresa}&apiKey=$apiKey";
    final http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      noticias += await compute(parseNoticiasModel, response.body);
    }
  }
  return noticias;
}
// Future<List<NoticiasModel>> fetchNoticiasModel() async {
//   String urlFinal = await formandoUrl();
//   print("URL FINAL: ${urlFinal}");
//   final http.Response response = await http.get(Uri.parse(urlFinal));
//   print("fetchNoticiasModel - Response ${response.body}");
//   if (response.statusCode == 200) {
//     return compute(parseNoticiasModel, response.body);
//   } else {
//     throw Exception(response.statusCode);
//   }
// }

List<NoticiasModel> parseNoticiasModel(String responceBody) {
  var data = json.decode(responceBody) as Map<String, dynamic>;
  var list = data['articles'] as List<dynamic>;
  var noticias = list.map((e) => NoticiasModel.fromMap(e)).toList();
  print(noticias);
  return noticias;
}
