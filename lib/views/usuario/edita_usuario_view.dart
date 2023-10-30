import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:monews_app/components/app_bar_components.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dadosUsurio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: menuVoltar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /*== Logo ==*/
                    // Image.asset(
                    //   'lib/images/logoMonews.png',
                    //   width: 320,
                    //   height: 280,
                    // ),
                    /*== Campos Usuário e Senha ==*/
                    SizedBox(
                      height: 280,
                    ),
                    TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      /*== Criando o Input e adicionando suas características ==*/
                      decoration: const InputDecoration(
                        hintText: 'Nome',
                        hintStyle: TextStyle(color: Colors.white),
                        //labelText: 'Nome',
                        // labelStyle: TextStyle(
                        //   color: Colors.white,
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                        )),
                        fillColor: Colors.transparent,
                        filled: true,
                      ),
                      controller: controller.nomeController,
                      validator: (value) =>
                          FormularioController.validarNome(value!),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      enabled: false,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      /*== Criando o Input e adicionando suas características ==*/
                      decoration: const InputDecoration(
                        hintText: 'email',
                        hintStyle: TextStyle(color: Colors.white),
                        //labelText: 'Nome',
                        // labelStyle: TextStyle(
                        //   color: Colors.white,
                        // ),
                        // labelText: 'Email',
                        // labelStyle: TextStyle(
                        //   color: Colors.white,
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                        )),
                        fillColor: Colors.transparent,
                        filled: true,
                      ),
                      controller: controller.emailController,
                      validator: (value) =>
                          FormularioController.validarEmail(value!),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    GestureDetector(
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
                          color: Color.fromARGB(255, 10, 140, 176),
                          // Definindo a sua borda
                          borderRadius: BorderRadius.circular(8),
                        ),
                        // Definindo seu filho e centralizando
                        child: Center(
                          // Atribuindo um filho ao centro e o componente text

                          child: Text(
                            // Adicionando o texto
                            "Editar Dados",
                            //'Inscrever-se',
                            // Estilizando o texto
                            style: TextStyle(
                              // Adicionando cor
                              color: Colors.white,
                              // Adicionando espessura da fonte
                              fontWeight: FontWeight.bold,
                              // Adicionando o tamanho da fonte
                              fontSize: 16,
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

  void editar(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      setState(() => carregando = true);

      formKey.currentState!.save();
      try {
        UsuarioModel model = UsuarioModel(
          nome: controller.nomeController.text.trim(),
          uid: null,
        );
        await auth.alterar(
          context,
          model,
        );
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

  void dadosUsurio() async {
    if (auth.usuarioLogado() != null) {
      DocumentSnapshot snapshot = await auth.firebase
          .collection('usuario')
          .doc(auth.usuarioLogado().uid)
          .get();
    
      controller.nomeController.text = snapshot['nome'];
      controller.emailController.text = auth.usuarioLogado().email;
    }
  }
}
