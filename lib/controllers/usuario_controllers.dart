import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:monews_app/main.dart';

import 'package:monews_app/models/usuario_model.dart';
import 'package:monews_app/views/home_view.dart';

// Classe responsavel por pegar a resposa de erro Firebase
class AuthenticationException implements Exception {
  String mensagem;
  AuthenticationException(this.mensagem);
}

// Criando classe do usuario e seus metodos
class UsuarioController {
  final auth = FirebaseAuth.instance;
  final firebase = FirebaseFirestore.instance;

  usuarioLogado() {
    return auth.currentUser;
  }

  registro(String email, String senha, UsuarioModel model,
      BuildContext context) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: senha);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw AuthenticationException('Esse email já está cadastrado!');
      }
    }
    print(usuarioLogado());
    firebase.collection('usuario').doc(usuarioLogado().uid).set({
      "nome": model.nome,
      "email": model.email,
      "senha": model.senha,
      "uid": model.uid,
    });
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => HomeView(),
      ),
    );
  }
  // login();
  // logout();
}
