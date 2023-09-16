import 'package:flutter/material.dart';
import 'package:monews_app/controllers/autenticacao_controllers.dart';
import 'package:monews_app/controllers/formulario_controller.dart';
import 'package:monews_app/views/registro_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  final AutenticacaoController auth = AutenticacaoController();

  final FormularioController controller = FormularioController();

  bool carregando = false;

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                      height: 10,
                    ),
                    TextFormField(
                      /*== Criando o Input e adicionando suas características ==*/
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.blueGrey[800]),
                        prefix: Icon(
                          Icons.email,
                          color: Color.fromARGB(255, 10, 140, 176),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                        )),
                        fillColor: Color.fromARGB(255, 255, 255, 255),
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
                        labelStyle: TextStyle(color: Colors.blueGrey[800]),
                        prefix: Icon(
                          Icons.lock,
                          color: Color.fromARGB(255, 10, 140, 176),
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
                        fillColor: Color.fromARGB(255, 255, 255, 255),
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
                      onTap: () => login(context),
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
                            "Logar",
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
                          'Não Possui conta?',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => RegistroView(),
                              ),
                            );
                          },
                          child: // Adicionando texto
                              const Text(
                            'Faça seu Cadastro',
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

  void login(BuildContext context) async {
    setState(() => carregando = true);
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        await auth.login(
          context,
          controller.emailController.text,
          controller.senhaController.text,
        );
      } on AuthenticationException catch (e) {
        setState(() => carregando = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.mensagem)),
        );
      }
    }
    setState(() => carregando = false);
  }
}
