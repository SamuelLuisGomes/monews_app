import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monews_app/components/app_bar_components.dart';
import 'package:monews_app/components/app_bar_static_components.dart';
import 'package:monews_app/controllers/autenticacao_controller.dart';
import 'package:monews_app/controllers/formulario_controller.dart';
import 'package:monews_app/models/usuario_model.dart';

class EditaUsuarioView extends StatefulWidget {
  @override
  State<EditaUsuarioView> createState() => _EditaUsuarioViewState();
}

class _EditaUsuarioViewState extends State<EditaUsuarioView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FormularioController controller = FormularioController();

  AutenticacaoController auth = AutenticacaoController();
  bool carregando = false;
  bool _obscureText = true;

  String? imagemUsuario;
  XFile? imagem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dadosUsurio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStatic(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 36),
                      child: GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          width: 340,
                          height: 180,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: imagem != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(24),
                                        child: Image.file(
                                          File(imagem!.path),
                                          width: 140,
                                          height: 80,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(24),
                                        child: Image.network(
                                          imagemUsuario!,
                                          width: 180,
                                          height: 120,
                                          fit: BoxFit.cover,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 36,
                      ),
                      child: TextFormField(
                        style: TextStyle(
                          //color: Colors.white,
                        ),
                        /*== Criando o Input e adicionando suas características ==*/
                        decoration: const InputDecoration(
                          hintText: 'Nome',
                          hintStyle: TextStyle(
                           // color: Colors.white,
                          ),
                          labelText: 'Nome',
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
                        controller: controller.nomeController,
                        validator: (value) =>
                            FormularioController.validarNome(value!),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 24,
                      ),
                      child: TextFormField(
                        enabled: false,
                        style: TextStyle(
                         // color: Colors.white,
                        ),
                        /*== Criando o Input e adicionando suas características ==*/
                        decoration: const InputDecoration(
                          hintText: 'email',
                          hintStyle: TextStyle(color: Colors.white),
                          // labelText: 'Email',
                          // labelStyle: TextStyle(
                          //   color: Colors.white,
                          // ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              //color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            //color: Colors.white,
                          )),
                          fillColor: Colors.transparent,
                          filled: true,
                        ),
                        controller: controller.emailController,
                        validator: (value) =>
                            FormularioController.validarEmail(value!),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 22,
                      ),
                      child: GestureDetector(
                        onTap: () => editar(context),
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
                          child: const Center(
                            // Atribuindo um filho ao centro e o componente text
      
                            child: Text(
                              // Adicionando o texto
                              "Editar Dados",
                              //'Inscrever-se',
                              // Estilizando o texto
                              style: TextStyle(
                                // Adicionando cor
                                //color: Colors.white,
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

  void editar(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      setState(() => carregando = true);

      formKey.currentState!.save();
      try {
        String? urlImagem;

        if (imagem != null) {
          urlImagem = await upload(imagem!.path);
          if (urlImagem != null) {
            UsuarioModel model = UsuarioModel(
              nome: controller.nomeController.text.trim(),
              uid: null,
              img: urlImagem,
            );
            await auth.alterar(
              context,
              model,
            );
          }
        } else {
          UsuarioModel model = UsuarioModel(
            nome: controller.nomeController.text.trim(),
            uid: null,
            img: imagemUsuario,
          );
          await auth.alterar(
            context,
            model,
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
  // void editar(BuildContext context) async {
  //   if (formKey.currentState!.validate()) {
  //     setState(() => carregando = true);

  //     formKey.currentState!.save();
  //     try {
  //       UsuarioModel model = UsuarioModel(
  //         nome: controller.nomeController.text.trim(),
  //         uid: null,
  //       );
  //       await auth.alterar(
  //         context,
  //         model,
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

  void dadosUsurio() async {
    if (auth.usuarioLogado() != null) {
      DocumentSnapshot snapshot = await auth.firebase
          .collection('usuario')
          .doc(auth.usuarioLogado().uid)
          .get();
      setState(() {
        imagemUsuario = snapshot['img'];
        controller.nomeController.text = snapshot['nome'];
        controller.emailController.text = auth.usuarioLogado().email;
      });
    }
  }
}
