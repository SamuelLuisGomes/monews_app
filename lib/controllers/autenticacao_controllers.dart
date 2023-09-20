import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:monews_app/main.dart';

import 'package:monews_app/models/usuario_model.dart';
import 'package:monews_app/views/home_view.dart';
import 'package:monews_app/views/login_view.dart';

// Classe responsavel por pegar a resposa de erro Firebase
class AuthenticationException implements Exception {
  String mensagem;
  AuthenticationException(this.mensagem);
}

// Criando classe do usuario e seus metodos
class AutenticacaoController {
  /* ==Criando variáveis para acessar o Firebase ==*/
  final auth = FirebaseAuth.instance;
  final firebase = FirebaseFirestore.instance;

  usuarioLogado() {
    return auth.currentUser;
  }

  cadastro(String email, String senha, UsuarioModel model,
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
      "uid": model.uid,
    });
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginView(),
      ),
    );
  }

  login(BuildContext context, String email, String senha) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email.toString().trim(),
        password: senha.toString().trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthenticationException('Usuário não encontrado!');
      }
      if (e.code == 'wrong-password') {
        throw AuthenticationException('Senha incorreta. Tente novamente!');
      }
    }
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (__) => HomeView(),
      ),
    );
  }

  logout(BuildContext context) async {
    await auth.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (__) => LoginView(),
      ),
    );
  }

  resetSenha(String email, BuildContext context) async {
    try {
      var metodosLogin = await auth.fetchSignInMethodsForEmail(email);
      if (metodosLogin.isEmpty) {
        throw AuthenticationException('Email não cadastrado!');
      } else {
        auth.sendPasswordResetEmail(email: email.toString().trim());
      }
    } on FirebaseAuthException catch (e) {
      throw AuthenticationException(e.toString());
    }
  }
}
