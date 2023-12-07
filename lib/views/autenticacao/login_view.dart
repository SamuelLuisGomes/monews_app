import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monews_app/controllers/autenticacao_controller.dart';
import 'package:monews_app/controllers/formulario_controller.dart';
import 'package:monews_app/views/autenticacao/registro_view.dart';
import 'package:monews_app/views/autenticacao/reset_senha_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();

  final AutenticacaoController auth = AutenticacaoController();

  final FormularioController controller = FormularioController();

  bool carregando = false;

  bool _obscureText = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // dadosUsurio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 120),
                      child: SvgPicture.asset(
                        'lib/images/logoMonews.svg',
                        height: 140,
                        // width: 80,
                        //fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 56),
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
                                    color: Theme.of(context).inputDecorationTheme.hintStyle!.color,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: Theme.of(context).inputDecorationTheme.focusedBorder!.borderSide.color,
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 12),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return ResetSenhaView();
                              },
                            ),
                          );
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Esqueceu sua senha?',
                              style: TextStyle(
                                // color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 28),
                      child: GestureDetector(
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
                            color: Theme.of(context).colorScheme.primary,
                            // color: Color.fromARGB(255, 10, 140, 176),
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
                      padding: const EdgeInsets.only(top: 48),
                      child: Row(
                        // Criando a linha
                        // Centralizando os filhos no centro
                        mainAxisAlignment: MainAxisAlignment.center,
                        // Definindo os filhos da linha
                        children: [
                          // Adicionando texto
                          const Text(
                            'Não possui conta?',
                            //style: Theme.of(context).textTheme.bodyText1,
                            // style: TextStyle(color: Colors.white),
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
                                Text(
                              'Faça seu Cadastro',
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

  void login(BuildContext context) async {
    setState(() => carregando = true);
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
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

  // void dadosUsurio() {
  //   // var controller;
  //   controller.emailController.text = 'samuel.gomes1529@gmail.com';
  //   controller.senhaController.text = 'samuel1234';
  // }
}
