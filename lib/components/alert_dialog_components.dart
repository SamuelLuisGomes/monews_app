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
