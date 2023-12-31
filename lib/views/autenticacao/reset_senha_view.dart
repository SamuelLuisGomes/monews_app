import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monews_app/components/alert_dialog_components.dart';
import 'package:monews_app/components/app_bar_components.dart';
import 'package:monews_app/components/app_bar_static_components.dart';
import 'package:monews_app/controllers/autenticacao_controller.dart';
import 'package:monews_app/controllers/formulario_controller.dart';
import 'package:monews_app/views/autenticacao/login_view.dart';

class ResetSenhaView extends StatefulWidget {
  @override
  State<ResetSenhaView> createState() => _ResetSenhaViewtState();
}

class _ResetSenhaViewtState extends State<ResetSenhaView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FormularioController controller = FormularioController();
  AutenticacaoController auth = AutenticacaoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStatic(),
      //backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: SingleChildScrollView(
            child: Form(
          key: formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                // mainAxisAlignment:
                //     MainAxisAlignment.center, // Centraliza verticalmente
                // crossAxisAlignment:
                //     CrossAxisAlignment.center, // Centraliza horizontalmente
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
                    child: Column(
                      children: [
                        const Text(
                          'Esqueceu sua Senha?',
                          style: TextStyle(
                            //color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
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
                          padding: const EdgeInsets.only(top: 16),
                          child: GestureDetector(
                            onTap: () => resetarSenha(context),
                            // Criando um container
                            child: Container(
                              // Adicionando altura a ele
                              padding: const EdgeInsets.all(18),
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
                              child:  Center(
                                // Atribuindo um filho ao centro e o componente text
                                child: Text(
                                  // Adicionando o texto
                                  "Resetar Senha",
                                  //'Inscrever-se',
                                  // Estilizando o texto
                                  style: TextStyle(
                                    // Adicionando cor
                                    color: Theme.of(context).textTheme.displaySmall!.color,
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
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }

  void dispose() {
    controller.emailController.dispose();
    super.dispose();
  }

  void resetarSenha(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      try {
        await auth.resetSenha(
          controller.emailController.text.trim(),
          context,
        );
        showDialog(
          context: context,
          builder: (context) {
            // return AlertDialog(
            //   content: Text('Alteração de senha enviado para seu email!'),
            // );
            return showAlertDialogSucess(
                context, 'Alteração de senha enviado para seu email!');
          },
        );
      } on AuthenticationException catch (e) {
        showDialog(
          context: context,
          builder: (context) {
            // return AlertDialog(
            //   content: Text(e.mensagem.toString()),
            // );
            return showAlertDialogError(context, e.mensagem.toString());
          },
        );
      }
    }
  }
}
