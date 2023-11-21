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
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 42),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.blueGrey,
                    ),
                    width: 380,
                    height: 240,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.asset(
                              'lib/images/person.jpg',
                              width: 160,
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Text(
                          'Samuel Gomes',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'samuelluisgomestech@gmail.com',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 18,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22),
                    child: GestureDetector(
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
                        padding: const EdgeInsets.all(16),
                        // Definindo a margem dele
                        //margin: const EdgeInsets.symmetric(horizontal: 24),
                        // // Estilizando o container
                        decoration: BoxDecoration(
                          // Adicionando preenchimento a ele
                          color: Colors.blueGrey,

                          // Definindo a sua borda
                          borderRadius: BorderRadius.circular(18),
                        ),
                        // Definindo seu filho e centralizando
                        // Atribuindo um filho ao centro e o componente text
                        child: const Row(
                          children: [
                            Icon(
                              CupertinoIcons.person_alt_circle,
                              color: Colors.white,
                              size: 48,
                            ),
                            //SizedBox(width: 18),
                            Padding(
                              padding: EdgeInsets.only(left: 22),
                              child: Text(
                                // Adicionando o texto
                                "Perfil",
                                //'Inscrever-se',
                                // Estilizando o texto
                                style: TextStyle(
                                  // Adicionando cor
                                  color: Colors.white,
                                  // Adicionando espessura da fonte
                                  fontWeight: FontWeight.bold,
                                  // Adicionando o tamanho da fonte
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 150),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22),
                    child: GestureDetector(
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
                        padding: const EdgeInsets.all(16),
                        // Definindo a margem dele
                        //margin: const EdgeInsets.symmetric(horizontal: 24),
                        // // Estilizando o container
                        decoration: BoxDecoration(
                          // Adicionando preenchimento a ele
                         color: Colors.blueGrey,

                          // Definindo a sua borda
                          borderRadius: BorderRadius.circular(18),
                        ),
                        // Definindo seu filho e centralizando
                        // Atribuindo um filho ao centro e o componente text
                        child: const Row(
                          children: [
                            Icon(
                              Icons.settings_applications_sharp,
                              color: Colors.white,
                              size: 48,
                            ),
                            //SizedBox(width: 18),
                            Padding(
                              padding: EdgeInsets.only(left: 22),
                              child: Text(
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
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 62),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22),
                    child: GestureDetector(
                      onTap: () {
                        _logout(context);
                      },
                      // Criando um container
                      child: Container(
                        // Adicionando altura a ele
                        padding: const EdgeInsets.all(16),
                        // Definindo a margem dele
                        //margin: const EdgeInsets.symmetric(horizontal: 24),
                        // // Estilizando o container
                        decoration: BoxDecoration(
                          // Adicionando preenchimento a ele
                         color: Colors.blueGrey,

                          // Definindo a sua borda
                          borderRadius: BorderRadius.circular(18),
                        ),
                        // Definindo seu filho e centralizando
                        // Atribuindo um filho ao centro e o componente text
                        child: const Row(
                          children: [
                            Icon(
                              Icons.login_rounded,
                              color: Colors.white,
                              size: 48,
                            ),
                            //SizedBox(width: 18),
                            Padding(
                              padding: EdgeInsets.only(left: 22),
                              child: Text(
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
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  _logout(BuildContext context) {
    auth.logout(context);
  }
}
