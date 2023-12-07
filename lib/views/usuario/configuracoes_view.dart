import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monews_app/components/alert_dialog_components.dart';
import 'package:monews_app/components/app_bar_static_components.dart';
import 'package:monews_app/components/loading_components.dart';
import 'package:monews_app/controllers/autenticacao_controller.dart';
import 'package:monews_app/controllers/formulario_controller.dart';
import 'package:monews_app/models/usuario_model.dart';
import 'package:provider/provider.dart';
import 'package:monews_app/themes/theme_provider.dart';

class ConfiguracoesView extends StatefulWidget {
  ConfiguracoesView({super.key});

  @override
  State<ConfiguracoesView> createState() => _ConfiguracoesViewState();
}

class _ConfiguracoesViewState extends State<ConfiguracoesView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FormularioController controller = FormularioController();

  AutenticacaoController auth = AutenticacaoController();

  //String? qtdNoticia;
  late Stream usuario;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // dadosUsurio();
    usuario = auth.pegarUsuario();
    // usuario.listen((snapshot) {
    //   final dados = snapshot.data;
    //   final qtdNoticias = dados['qtdNoticias'].toString();
    //   setState(() {
    //     controller.qtdNoticiasController.text = qtdNoticias;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStatic(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      Text(
                        'Configurações',
                        style: TextStyle(
                            // color:
                            //     Theme.of(context).textTheme.displaySmall!.color,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Text(
                          'Gerais',
                          style: TextStyle(
                            //color: Theme.of(context).textTheme.displaySmall!.color,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        //color: Colors.white,
                        thickness: 0.8,
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tema escuro',
                        style: TextStyle(
                          //color: Theme.of(context).textTheme.displaySmall!.color,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Consumer<ThemeProvider>(
                        builder: (context, themeProvider, _) {
                          return Switch(
                            value: themeProvider.isDarkMode,
                            onChanged: (value) {
                              themeProvider.toggleTheme();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Text(
                          'Notícias',
                          style: TextStyle(
                            //color: Theme.of(context).textTheme.displaySmall!.color,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        //color: Colors.white,
                        thickness: 0.8,
                      ))
                    ],
                  ),
                ),
                StreamBuilder(
                    stream: usuario,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const MyLoading();
                      } else if (snapshot.hasError) {
                        return Text('Erro: ${snapshot.error}');
                      } else {
                        final dados = snapshot.data;
                        final qtdNoticia = dados['qtdNoticias'].toString();
                        controller.qtdNoticiasController.text = qtdNoticia;
                        // setState(() {
                        //   controller.qtdNoticiasController.text = qtdNoticia;
                        // });
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Notícias por ação: $qtdNoticia',
                                style: TextStyle(
                                  //color: Theme.of(context).textTheme.displaySmall!.color,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.edit, size: 24),
                                onPressed: () {
                                  editarQtdNoticia(context);
                                },
                              )
                            ],
                          ),
                        );
                      }
                    }),
                // Form(
                //   key: formKey,
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //       top: 36,
                //     ),
                //     child: Column(
                //       children: [
                //         TextFormField(
                //           style: TextStyle(
                //               //color: Colors.white,
                //               ),
                //           /*== Criando o Input e adicionando suas características ==*/
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
                //           controller: controller.nomeController,
                //           validator: (value) =>
                //               FormularioController.validarNome(value!),
                //         ),
                //         TextFormField(
                //           style: TextStyle(
                //               //color: Colors.white,
                //               ),
                //           /*== Criando o Input e adicionando suas características ==*/
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
                //           validator: (value) =>
                //               FormularioController.validaQrtNoticias(value!),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void editarQtdNoticia(BuildContext context) async {
    await showDialog(
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
              // hintStyle: TextStyle(
              //     // color: Colors.white,
              //     ),
              // labelText: 'Quantidade',
              // labelStyle: TextStyle(
              //     //color: Colors.white,
              //     ),
              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(
              //       //color: Colors.white,
              //       ),
              // ),
              // focusedBorder: OutlineInputBorder(
              //     borderSide: BorderSide(
              //         // color: Colors.white,
              //         )),
              // fillColor: Colors.transparent,
              // filled: true,
            ),
            controller: controller.qtdNoticiasController,
            validator: (value) =>
                FormularioController.validaQrtNoticias(value!),
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
                if (controller.qtdNoticiasController.text.isNotEmpty) {
                  // UsuarioModel model = UsuarioModel(
                  //   qtdNoticias: int.parse(
                  //     controller.qtdNoticiasController.text.trim(),
                  //   ),
                  // );
                  final qtd = int.parse(
                    controller.qtdNoticiasController.text.trim(),
                  );
                  auth.alterarQtdNoticias(context, qtd);
                }
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  // void dadosUsurio() async {
  //   if (auth.usuarioLogado() != null) {
  //     DocumentSnapshot snapshot = await auth.firebase
  //         .collection('usuario')
  //         .doc(auth.usuarioLogado().uid)
  //         .get();
  //     setState(() {
  //       qtdNoticia = snapshot['qtdNoticias'].toString();
  //       controller.nomeController.text = snapshot['nome'];
  //       controller.qtdNoticiasController.text =
  //           snapshot['qtdNoticias'].toString();
  //     });
  //   }
  // }
}
