import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class MyToast extends StatelessWidget {
  String mensagem;
  MyToast({super.key, required this.mensagem});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void CustomToast() {
    showToast(
      mensagem,
      backgroundColor: Color.fromARGB(255, 10, 140, 176),
      textStyle: const TextStyle(color: Colors.white),
      borderRadius: BorderRadius.circular(16),
      duration: Duration(seconds: 1),
      position: StyledToastPosition(align: Alignment.topLeft),
      //curve: Cur  
    );
  }
}
