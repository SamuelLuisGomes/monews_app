import 'dart:convert';

import 'package:monews_app/components/exceptions.dart';
import 'package:monews_app/models/acoes_model.dart';
import 'package:monews_app/services/http_client.dart';

const String url = "https://brapi.dev/api/quote/list";

class AcoesController {
  final HttpClient client;

  AcoesController({required this.client});

  Future<List<AcoesModel>> getAcoes() async {
    final response = await client.get(url: url);

    if (response.statusCode == 200) {
      final List<AcoesModel> acoes = [];

      final body = jsonDecode(response.body);

      body['stocks'].map((item) {
        final AcoesModel acao = AcoesModel.fromMap(item);
        acoes.add(acao);
      }).toList();

      return acoes;
    } else if (response.statusCode == 404) {
      throw NotFoundException('a url informada não é valida!');
    } else {
      throw Exception('Não foi posssível carregar as acoes');
    }
  }
}
