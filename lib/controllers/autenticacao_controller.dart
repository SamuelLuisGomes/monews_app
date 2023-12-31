import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:monews_app/components/alert_dialog_components.dart';

import 'package:monews_app/models/usuario_model.dart';
import 'package:monews_app/views/home_view.dart';
import 'package:monews_app/views/autenticacao/login_view.dart';
import 'package:monews_app/views/usuario/configuracoes_view.dart';
import 'package:monews_app/views/usuario/perfil_view.dart';

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
  final storage = FirebaseStorage.instance;

  usuarioLogado() {
    return auth.currentUser;
  }

  cadastro(String email, String senha, UsuarioModel model,
      BuildContext context) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: senha);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw AuthenticationException(
          'Esse email já está cadastrado!',
        );
      }
    }
    print(usuarioLogado());
    firebase.collection('usuario').doc(usuarioLogado().uid).set({
      'nome': model.nome,
      'uid': model.uid,
      'img': model.img,
      'carteira': [],
      'qtdNoticias': 10,
    });
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (context) => LoginView(),
    //   ),
    // );
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => LoginView(),
    //   ),
    // );
    showDialog(
      context: context,
      builder: (context) {
        // return AlertDialog(
        //   content: Text('Alteração de senha enviado para seu email!'),
        // );
        return showAlertDialogSucess(context, 'Cadatro realizado com Sucesso');
      },
    );
  }

  alterar(BuildContext context, UsuarioModel model) async {
    try {
      final dadosUsuarios =
          firebase.collection('usuario').doc(usuarioLogado().uid);
      await dadosUsuarios.update({
        'nome': model.nome,
        'img': model.img,
        //'senha': senha,
      });
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => PerfilView(),
      //   ),
      // );
      // showDialog(
      //   context: context,
      //   builder: (context) {
      //     // return AlertDialog(
      //     //   content: Text('Alteração de senha enviado para seu email!'),
      //     // );
      //     showAlertDialogEditaSucess(context, 'Perfil alterado com sucesso');
      //   },
      // );
      await showAlertDialogEditaSucess(context, 'Perfil alterado com sucesso');
    } on FirebaseAuthException catch (e) {
      throw AuthenticationException(
        e.toString(),
      );
    }
  }

  alterarQtdNoticias(BuildContext context, int qtd) async {
    try {
      final dadosUsuarios =
          firebase.collection('usuario').doc(usuarioLogado().uid);
      await dadosUsuarios.update({
        'qtdNoticias': qtd,
        //'senha': senha,
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ConfiguracoesView(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      throw AuthenticationException(
        e.toString(),
      );
    }
  }

  login(BuildContext context, String email, String senha) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email.toString().trim(),
        password: senha.toString().trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthenticationException(
          'Usuário não encontrado!',
        );
      }
      if (e.code == 'wrong-password') {
        throw AuthenticationException(
          'Senha incorreta. Tente novamente!',
        );
      }
    }
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (__) => HomeView(),
    //   ),
    // );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeView(),
      ),
    );
  }

  Stream<dynamic> pegarUsuario() {
    if (usuarioLogado() != null) {
      final refUsuario =
          firebase.collection('usuario').doc(usuarioLogado().uid);
      return refUsuario.snapshots().map((snapshot) {
        final dados = snapshot.data();
        print('Dados do usuário: $dados');
        return dados;
      });
    } else {
      return Stream.empty();
    }
  }

  Future<int> converterUsuarioParaLista() async {
    final dados = await pegarUsuario().first;
    if (dados != null && dados['qtdNoticias'] != null) {
      return int.tryParse(dados['qtdNoticias'].toString()) ?? 10;
    }
    return 10;
  }

  logout(BuildContext context) async {
    await auth.signOut();
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (__) => LoginView(),
    //   ),
    // );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginView(),
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
      throw AuthenticationException(
        e.toString(),
      );
    }
  }
}
