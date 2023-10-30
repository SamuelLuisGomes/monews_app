import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monews_app/controllers/autenticacao_controller.dart';
import 'package:monews_app/views/usuario/edita_usuario_view.dart';

class PerfilView extends StatefulWidget {
  @override
  State<PerfilView> createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutenticacaoController auth = AutenticacaoController();

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
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(
                        //   height: 480,
                        // ),
                        Padding(
                          // Preenchimento a direita do widget
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 32),
                          // Criando um container
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              // Definindo a altura de 40.0
                              height: 180,
                              // Definindo a largura de de 40.0
                              width: 180,
                              // Decorando o container
                              decoration: BoxDecoration(
                                // Arredondando a borda do conteiner
                                borderRadius: BorderRadius.circular(140),
                                color: Colors.grey,

                                // Passando imagem por url
                                // image: DecorationImage(
                                //   image: NetworkImage(
                                //     'https://firebasestorage.googleapis.com/v0/b/fast-app-72ca2.appspot.com/o/imagesUsers%2Fuser.png?alt=media&token=5364d85c-5748-4736-a563-44b909f9dae5&_gl=1*chhtuc*_ga*MTU2MTIzODEwNi4xNjgyNzM1MjE1*_ga_CW55HF8NVT*MTY4NjYxMDM1NS40NC4xLjE2ODY2MTA0MTAuMC4wLjA',
                                //   ),
                                //   fit: BoxFit.cover,
                                // ),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'lib/images/loboWallStreet.png',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => EditaUsuarioView(),
                              ),
                            );
                          },
                          // Criando um container
                          child: Container(
                            // Adicionando altura a ele
                            padding: const EdgeInsets.all(12),
                            // Definindo a margem dele
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            // // Estilizando o container
                            decoration: BoxDecoration(
                              // Adicionando preenchimento a ele
                              color: Color.fromARGB(255, 10, 140, 176),

                              // Definindo a sua borda
                              borderRadius: BorderRadius.circular(32),
                            ),
                            // Definindo seu filho e centralizando
                            // Atribuindo um filho ao centro e o componente text
                            child: const Row(
                              children: [
                                Icon(
                                  CupertinoIcons.person_alt_circle,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 12),
                                Text(
                                  // Adicionando o texto
                                  "Conta",
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
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        GestureDetector(
                          onTap: () {},
                          // Criando um container
                          child: Container(
                            // Adicionando altura a ele
                            padding: const EdgeInsets.all(12),
                            // Definindo a margem dele
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            // // Estilizando o container
                            decoration: BoxDecoration(
                              // Adicionando preenchimento a ele
                              color: Color.fromARGB(255, 10, 140, 176),

                              // Definindo a sua borda
                              borderRadius: BorderRadius.circular(32),
                            ),
                            // Definindo seu filho e centralizando
                            // Atribuindo um filho ao centro e o componente text
                            child: const Row(
                              children: [
                                Icon(
                                  CupertinoIcons.settings,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 12),
                                Text(
                                  // Adicionando o texto
                                  "Configurações",
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
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        GestureDetector(
                          onTap: () {
                            _logout(context);
                          },
                          // Criando um container
                          child: Container(
                            // Adicionando altura a ele
                            padding: const EdgeInsets.all(12),
                            // Definindo a margem dele
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            // // Estilizando o container
                            decoration: BoxDecoration(
                              // Adicionando preenchimento a ele
                              color: Color.fromARGB(255, 10, 140, 176),

                              // Definindo a sua borda
                              borderRadius: BorderRadius.circular(32),
                            ),
                            // Definindo seu filho e centralizando
                            // Atribuindo um filho ao centro e o componente text
                            child: const Row(
                              children: [
                                Icon(
                                  CupertinoIcons.arrow_right_square_fill,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 12),
                                Text(
                                  // Adicionando o texto
                                  "Logout",
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
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ));
  }

  _logout(BuildContext context) {
    auth.logout(context);
  }
}
