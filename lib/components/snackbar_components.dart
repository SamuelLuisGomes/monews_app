import 'package:flutter/material.dart';

void snackBarCustom(BuildContext context, String mensagem) {
  final snack = SnackBar(
    content: Text(mensagem,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        )),
    backgroundColor: Theme.of(context).colorScheme.secondary,
    padding: const EdgeInsets.all(12),
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 1),
    margin: const EdgeInsets.only(
      right: 12,
      left: 12,
      //top: 48
      bottom: 48,
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snack);
}




// class MySnack extends StatelessWidget {
//   MySnack({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(
//         right: 12,
//         top: 12,
//       ),
//       child: ScaffoldMessenger.of(context).showSnackBar(),
//     );
//     //ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }

//   void snackBar(BuildContext context, String mensagem) {
//     final snackBar = SnackBar(
//       content: Text(mensagem!,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           )),
//       backgroundColor: const Color.fromARGB(255, 10, 140, 176),
//       padding: const EdgeInsets.all(20),
//       behavior: SnackBarBehavior.floating,
//       margin: const EdgeInsets.only(
//         right: 12,
//         top: 50,
//       ),
//     );
//    ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
// }
