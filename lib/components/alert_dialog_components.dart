import 'dart:async';

import 'package:flutter/material.dart';
import 'package:monews_app/controllers/formulario_controller.dart';
import 'package:monews_app/views/autenticacao/login_view.dart';
import 'package:monews_app/views/usuario/perfil_view.dart';

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
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    title: Text(
      'Atenção',
      style: TextStyle(
        color: Theme.of(context).textTheme.displaySmall!.color,
        fontSize: 18,
      ),
    ),
    content: Text(
      mensagem,
      style: TextStyle(
        fontSize: 16,
        color: Theme.of(context).textTheme.displaySmall!.color,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

// Future<void> showAlertDialogEditaSucess(BuildContext context, String mensagem) async {
// Future.delayed(const Duration(seconds: 2), () {
//   Navigator.of(context).pop();
//   Navigator.of(context).push(
//     MaterialPageRoute(builder: (context) {
//       return PerfilView();
//     }),
//   );
// });
// showDialog(context: context, barrierDismissible: false, builder: (BuildContext context) {
//     return AlertDialog(
//     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//     title: Text(
//       'Atenção',
//       style: TextStyle(
//         color: Theme.of(context).textTheme.displaySmall!.color,
//         fontSize: 18,
//       ),
//     ),
//     content: Text(
//       mensagem,
//       style: TextStyle(
//         fontSize: 16,
//         color: Theme.of(context).textTheme.displaySmall!.color,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//   );
// }
// );
Future<void> showAlertDialogEditaSucess(
    BuildContext context, String mensagem) async {
  showDialog(
    context: context,
    barrierDismissible:
        false, // Impede que o usuário feche o AlertDialog clicando fora dele
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Atenção',
          style: TextStyle(
            color: Theme.of(context).textTheme.displaySmall!.color,
            fontSize: 18,
          ),
        ),
        content: Text(
          mensagem,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).textTheme.displaySmall!.color,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    },
  );

  await Future.delayed(Duration(seconds: 2)); // Aguarda por 2 segundos
  Navigator.of(context).pop(); // Fecha o AlertDialog
  Navigator.of(context).pop();

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

showAlertDialogNoticias(BuildContext context, FormularioController controller) {
  //FormularioController controller = FormularioController();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Quantidade de notícias por ação',
          style: TextStyle(fontSize: 18),
        ),
        content: TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'Quantidade',
            hintStyle: TextStyle(
                // color: Colors.white,
                ),
            labelText: 'Quantidade',
            labelStyle: TextStyle(
                //color: Colors.white,
                ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  //color: Colors.white,
                  ),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    // color: Colors.white,
                    )),
            fillColor: Colors.transparent,
            filled: true,
          ),
          controller: controller.qtdNoticiasController,
          validator: (value) => FormularioController.validaQrtNoticias(value!),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Salvar'),
            onPressed: () {
              if (controller.qtdNoticiasController.text.isNotEmpty) {}
              Navigator.of(context).pop();
            },
          )
        ],
      );
    },
  );
}
// showAlertDialogNoticias(BuildContext context, FormularioController controller) {
//   //FormularioController controller = FormularioController();
//   return showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text(
//           'Quantidade de notícias por ação',
//           style: TextStyle(fontSize: 18),
//         ),
//         content: TextFormField(
//           keyboardType: TextInputType.number,
//           decoration: const InputDecoration(
//             hintText: 'Quantidade',
//             hintStyle: TextStyle(
//                 // color: Colors.white,
//                 ),
//             labelText: 'Quantidade',
//             labelStyle: TextStyle(
//                 //color: Colors.white,
//                 ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                   //color: Colors.white,
//                   ),
//             ),
//             focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                     // color: Colors.white,
//                     )),
//             fillColor: Colors.transparent,
//             filled: true,
//           ),
//           controller: controller.qtdNoticiasController,
//           validator: (value) => FormularioController.validaQrtNoticias(value!),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('Cancelar'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           TextButton(
//             child: const Text('Salvar'),
//             onPressed: () {
//               // String novaQuantidade = controller.text;
//               // if (novaQuantidade.isNotEmpty) {
//               //   int novaQuantidadeInt = int.tryParse(novaQuantidade) ?? 0;
//               // }
//               Navigator.of(context).pop();
//             },
//           )
//         ],
//       );
//     },
//   );
// }
