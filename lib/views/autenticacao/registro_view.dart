import 'package:flutter/material.dart';
import 'package:monews_app/controllers/autenticacao_controllers.dart';
import 'package:monews_app/controllers/formulario_controller.dart';
import 'package:monews_app/models/usuario_model.dart';
import 'package:monews_app/views/autenticacao/login_view.dart';

class RegistroView extends StatefulWidget {
  @override
  _RegistroViewState createState() => _RegistroViewState();
}

class _RegistroViewState extends State<RegistroView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FormularioController controller = FormularioController();

  AutenticacaoController auth = AutenticacaoController();

  bool carregando = false;

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
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
                      /*== Criando o Input e adicionando suas características ==*/
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
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
                      /*== Criando o Input e adicionando suas características ==*/
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
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
                    TextFormField(
                      obscureText: _obscureText,
                      /*== Criando o Input e adicionando suas características ==*/
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        suffixIcon: IconButton(
                          icon: _obscureText
                              ? Icon(
                                  Icons.visibility_off,
                                  color: Color.fromARGB(255, 10, 140, 176),
                                )
                              : Icon(
                                  Icons.visibility,
                                  color: Color.fromARGB(255, 10, 140, 176),
                                ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
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
                      controller: controller.senhaController,
                      validator: (value) =>
                          FormularioController.validarSenha(value!),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    GestureDetector(
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
                          color: Color.fromARGB(255, 10, 140, 176),
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
                    const SizedBox(height: 50),
                    Row(
                      // Criando a linha
                      // Centralizando os filhos no centro
                      mainAxisAlignment: MainAxisAlignment.center,
                      // Definindo os filhos da linha
                      children: [
                        // Adicionando texto
                        Text(
                          'Já possui conta?',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LoginView(),
                              ),
                            );
                          },
                          child: // Adicionando texto
                              const Text(
                            'Faça o login',
                            // Estilizando ele
                            style: TextStyle(
                              // Adicionando cor
                              color: Color.fromARGB(255, 10, 140, 176),
                              // Adicionando espesura da letra
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
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

  void registro(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      setState(() => carregando = true);

      formKey.currentState!.save();
      try {
        UsuarioModel model = UsuarioModel(
          nome: controller.nomeController.text.trim(),
          uid: null,
        );

        await auth.cadastro(
          controller.emailController!.text.trim(),
          controller.senhaController!.text.trim(),
          model,
          context,
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
}
