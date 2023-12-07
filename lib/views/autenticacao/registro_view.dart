import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monews_app/controllers/acoes_controller.dart';
import 'package:monews_app/controllers/autenticacao_controller.dart';
import 'package:monews_app/controllers/formulario_controller.dart';
import 'package:monews_app/models/usuario_model.dart';
import 'package:monews_app/views/autenticacao/login_view.dart';

class RegistroView extends StatefulWidget {
  @override
  _RegistroViewState createState() => _RegistroViewState();
}

class _RegistroViewState extends State<RegistroView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final imagemBase =
      'https://firebasestorage.googleapis.com/v0/b/monews-9db1b.appspot.com/o/imagens%2Fperfil%2Fperfil%2Fperfil.jpg?alt=media&token=6ba0f70f-10ba-4fcd-abec-91da044a641c';

  XFile? imagem;

  FormularioController controller = FormularioController();

  AutenticacaoController auth = AutenticacaoController();

  bool carregando = false;

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 42,top: 60),
                      child: GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Theme.of(context).colorScheme.primary,
                            //border: Border.all(color: Colors.white, width: 2),
                          ),
                          width: 320,
                          height: 180,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: imagem != null
                                    ? Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24)),
                                        child: SizedBox(
                                          width: 180,
                                          height: 120,
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                                child: Image.file(
                                                  File(imagem!.path),
                                                  width: 180,
                                                  height: 120,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                right: 0,
                                                child: Container(
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(
                                                    Icons.edit,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24)),
                                        child: SizedBox(
                                          width: 180,
                                          height: 120,
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                                child: Image.network(
                                                  imagemBase,
                                                  width: 180,
                                                  height: 120,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                right: 0,
                                                child: Container(
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(
                                                    Icons.edit,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          pegarFoto();
                        },
                      ),
                      // child: GestureDetector(
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(24),
                      //       color: Theme.of(context).colorScheme.primary,
                      //     ),
                      //     width: 320,
                      //     height: 180,
                      //     child: Column(
                      //       children: [
                      //         Padding(
                      //           padding: const EdgeInsets.only(top: 24),
                      //           child: imagem != null
                      //               ? ClipRRect(
                      //                   borderRadius: BorderRadius.circular(24),
                      //                   child: Image.file(
                      //                     File(imagem!.path),
                      //                     width: 140,
                      //                     height: 80,
                      //                     fit: BoxFit.cover,
                      //                   ),
                      //                 )
                      //               : ClipRRect(
                      //                   borderRadius: BorderRadius.circular(24),
                      //                   child: Image.network(
                      //                     imagemBase,
                      //                     width: 180,
                      //                     height: 120,
                      //                     fit: BoxFit.cover,
                      //                   ),
                      //                 ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      //   onTap: () {
                      //     pegarFoto();
                      //   },
                      // ),
                    ),
                    /*== Campos Usuário e Senha ==*/
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: TextFormField(
                        /*== Criando o Input e adicionando suas características ==*/
                        decoration: const InputDecoration(
                          hintText: 'Nome',
                        ),
                        controller: controller.nomeController,
                        validator: (value) =>
                            FormularioController.validarNome(value!),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Email',
                        ),
                        controller: controller.emailController,
                        validator: (value) =>
                            FormularioController.validarEmail(value!),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: TextFormField(
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          hintText: 'Senha',
                          suffixIcon: IconButton(
                            icon: _obscureText
                                ? Icon(
                                    Icons.visibility_off,
                                    color: Theme.of(context)
                                        .inputDecorationTheme
                                        .hintStyle!
                                        .color,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: Theme.of(context)
                                        .inputDecorationTheme
                                        .focusedBorder!
                                        .borderSide
                                        .color,
                                  ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                        controller: controller.senhaController,
                        validator: (value) =>
                            FormularioController.validarSenha(value!),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 36),
                      child: GestureDetector(
                        onTap: () => registro(context),
                        // Criando um container
                        child: Container(
                          // Adicionando altura a ele
                          padding: const EdgeInsets.all(25),
                          // Definindo a margem dele
                          // margin:
                          //     const EdgeInsets.symmetric(horizontal: 25.0),
                          // Estilizando o container
                          decoration: BoxDecoration(
                            // Adicionando preenchimento a ele
                            color: Theme.of(context).colorScheme.primary,
                            // Definindo a sua borda
                            borderRadius: BorderRadius.circular(8),
                          ),
                          // Definindo seu filho e centralizando
                          child: Center(
                            // Atribuindo um filho ao centro e o componente text
                    
                            child: Text(
                              // Adicionando o texto
                              "Registrar",
                              //'Inscrever-se',
                              // Estilizando o texto
                              style: TextStyle(
                                // Adicionando cor
                                color: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .color,
                                // Adicionando espessura da fonte
                                fontWeight: FontWeight.bold,
                                // Adicionando o tamanho da fonte
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 36),
                      child: Row(
                        // Criando a linha
                        // Centralizando os filhos no centro
                        mainAxisAlignment: MainAxisAlignment.center,
                        // Definindo os filhos da linha
                        children: [
                          // Adicionando texto
                          Text(
                            'Já possui conta?',
                            // style: TextStyle(
                            //   color:
                            //       Theme.of(context).textTheme.displaySmall!.color,
                            // ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) => LoginView(),
                              //   ),
                              // );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return LoginView();
                                  },
                                ),
                              );
                            },
                            child: // Adicionando texto
                                Text(
                              'Faça o login',
                              // Estilizando ele
                              style: TextStyle(
                                // Adicionando cor
                                color: Theme.of(context).colorScheme.secondary,
                                // Adicionando espesura da letra
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void pegarFoto() async {
    final ImagePicker picker = ImagePicker();

    XFile? imagemTemp = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      imagem = imagemTemp;
    });
  }

  Future<String?> upload(String caminho) async {
    File arquivo = File(caminho);
    try {
      String imgNome = 'img-${DateTime.now().toString()}.jpg';
      String refImagem = 'imagens/perfil/$imgNome';
      Reference ref = auth.storage.ref(refImagem);
      await ref.putFile(arquivo);

      return ref.getDownloadURL();
    } on FirebaseAuthException catch (e) {
      print('Erro ao fazer o upload: $e');
      return null;
    }
  }
  // Future<UploadTask> upload(String caminho) async {
  //   File arquivo = File(caminho);
  //   try {
  //     String imgNome = 'img-${DateTime.now().toString()}.jpg';
  //     String refImagem = 'imagens/perfil/$imgNome';
  //     return auth.storage.ref(refImagem).putFile(arquivo);
  //   } on FirebaseAuthException catch (e) {
  //     throw AuthenticationException(
  //       e.toString(),
  //     );
  //   }
  // }

  void registro(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      setState(() => carregando = true);

      formKey.currentState!.save();
      try {
        //XFile? arquivo = await pegarFoto();
        String? urlImagem;

        if (imagem != null) {
          urlImagem = await upload(imagem!.path);
          if (urlImagem != null) {
            UsuarioModel model = UsuarioModel(
              nome: controller.nomeController.text.trim(),
              uid: null,
              img: urlImagem,
            );
            await auth.cadastro(
              controller.emailController.text.trim(),
              controller.senhaController.text.trim(),
              model,
              context,
            );
          }
        } else {
          UsuarioModel model = UsuarioModel(
            nome: controller.nomeController.text.trim(),
            uid: null,
            img: imagemBase,
          );
          await auth.cadastro(
            controller.emailController.text.trim(),
            controller.senhaController.text.trim(),
            model,
            context,
          );
        }
      } on AuthenticationException catch (e) {
        setState(() => carregando = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.mensagem)),
        );
      }
    } else {
      setState(() => carregando = false);
    }
  }
  // void registro(BuildContext context) async {
  //   if (formKey.currentState!.validate()) {
  //     setState(() => carregando = true);

  //     formKey.currentState!.save();
  //     try {
  //       UsuarioModel model = UsuarioModel(
  //         nome: controller.nomeController.text.trim(),
  //         uid: null,
  //         img: pegarFoto().toString(),
  //       );
  //       await auth.cadastro(
  //         controller.emailController!.text.trim(),
  //         controller.senhaController!.text.trim(),
  //         model,
  //         context,
  //       );
  //     } on AuthenticationException catch (e) {
  //       setState(() => carregando = false);
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text(e.mensagem)),
  //       );
  //     }
  //   } else {
  //     setState(() => carregando = false);
  //   }
  // }
}
