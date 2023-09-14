import 'package:flutter/material.dart';

class FormularioControllerException implements Exception {
  String? mensagem;
  FormularioControllerException(this.mensagem);
}

class FormularioController {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  //final TextEditingController nomeController = TextEditingController();

  static validarNome(String nome) {
    if (nome.isEmpty) return 'Nome obrigatório';
    if (nome.length < 4) return 'Nome inválido';
    return true;
  }

  static validarSenha(String senha) {
    if (senha.isEmpty) return 'Senha obrigatório';
    if (senha.length < 6) return 'Senha precisa ter mais de 6 caracteres';
    return true;
  }

  static validarEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regex = RegExp(pattern.toString());
    if (email.isEmpty) return 'Email obrigatório';
    if (!regex.hasMatch(email)) return 'Email inválido';
    return true;
  }
}
