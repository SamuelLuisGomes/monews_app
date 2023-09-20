import 'dart:async';

import 'package:flutter/material.dart';
import 'package:monews_app/views/login_view.dart';

AlertDialog showAlertDialogSucess(BuildContext context, String mensagem) {
  Future.delayed(Duration(seconds: 2), () {
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return LoginView();
      }),
    );
  });

  return AlertDialog(
    title: Text(
      'Atenção',
      style: TextStyle(fontSize: 18),
    ),
    content: Text(
      mensagem,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

AlertDialog showAlertDialogError(BuildContext context, String mensagem) {
  return AlertDialog(
    title: Text(
      'Atenção',
      style: TextStyle(fontSize: 18),
    ),
    content: Text(
      mensagem,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: <Widget>[
      TextButton(
        child: Text('OK'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      )
    ],
  );
}
