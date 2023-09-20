import 'package:flutter/material.dart';
import 'package:monews_app/controllers/formulario_controller.dart';

class ResetSenhaView extends StatefulWidget {
  @override
  State<ResetSenhaView> createState() => _ResetSenhaViewtState();
}

final FormularioController controller = FormularioController();

class _ResetSenhaViewtState extends State<ResetSenhaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        elevation: 0,
      ),
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    children: [
                      Text(
                        'Por favor informe o email para redefinição de senha!',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 12,
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
                            color: Color.fromARGB(255, 10, 140, 176),
                          )),
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          filled: true,
                        ),
                        controller: controller.emailController,
                        validator: (value) =>
                            FormularioController.validarEmail(value!),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                        //onTap: () => login(context),
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
                            color: Color.fromARGB(255, 10, 140, 176),
                            // Definindo a sua borda
                            borderRadius: BorderRadius.circular(8),
                          ),
                          // Definindo seu filho e centralizando
                          child: Center(
                            // Atribuindo um filho ao centro e o componente text

                            child: Text(
                              // Adicionando o texto
                              "Resetar Senha",
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
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
