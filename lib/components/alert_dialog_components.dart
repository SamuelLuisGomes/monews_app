import 'dart:async';

import 'package:flutter/material.dart';
import 'package:monews_app/views/autenticacao/login_view.dart';

AlertDialog showAlertDialogSucess(BuildContext context, String mensagem) {
  Future.delayed(const Duration(seconds: 2), () {
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return LoginView();
      }),
    );
  });

  return AlertDialog(
    title: const Text(
      'Atenção',
      style: TextStyle(fontSize: 18),
    ),
    content: Text(
      mensagem,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

AlertDialog showAlertDialogError(BuildContext context, String mensagem) {
  return AlertDialog(
    title: const Text(
      'Atenção',
      style: TextStyle(fontSize: 18),
    ),
    content: Text(
      mensagem,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: <Widget>[
      TextButton(
        child: const Text('OK'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      )
    ],
  );
}

AlertDialog showAlertDialogaAcoes(
    BuildContext context, String mensagem) {
  return AlertDialog(
    backgroundColor: Color.fromARGB(255, 10, 140, 176),
    title: const Text(
      'Atenção',
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
    ),
    content: Text(
      mensagem,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions:[
      TextButton(
        child: const Text('Não'),
        onPressed: () {
          Navigator.of(context).pop(false);
        },
      ),
      TextButton(
        child: const Text('Sim'),
        onPressed: () {
         Navigator.of(context).pop(true);
        },
      )
    ],
  );
}
