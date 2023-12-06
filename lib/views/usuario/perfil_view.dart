import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:monews_app/components/loading_components.dart';
import 'package:monews_app/controllers/autenticacao_controller.dart';
import 'package:monews_app/views/app.dart';
import 'package:monews_app/views/usuario/configuracoes_view.dart';
import 'package:monews_app/views/usuario/edita_usuario_view.dart';

class PerfilView extends StatefulWidget {
  @override
  State<PerfilView> createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutenticacaoController auth = AutenticacaoController();
  late Stream usuario;
  @override
  void initState() {
    super.initState();
    usuario = auth.pegarUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: usuario,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MyLoading();
        } else if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error}');
        } else {
          final dados = snapshot.data;
          final img = dados?['img'];
          final nome = dados?['nome'];
          String? email;

          if (auth.usuarioLogado() != null) {
            email = auth.usuarioLogado().email;
          }

          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 42),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        width: 380,
                        height: 240,
                        child: Column(
                          children: [
                            Padding(
                              //padding: const EdgeInsets.only(top: 24, bottom: ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 16),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.network(
                                  img,
                                  width: 160,
                                  height: 140,
                                  fit: BoxFit.cover,
                                ),
                                // Image.asset(
                                //   'lib/images/person.jpg',
                                //   width: 160,
                                //   height: 140,
                                //   fit: BoxFit.cover,
                                // ),
                              ),
                            ),
                            Text(
                              // 'Samuel Gomes',
                              nome,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              // 'samuelluisgomestech@gmail.com',
                              email!,
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
                                builder: (context) {
                                  return EditaUsuarioView();
                                },
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
                              color: Theme.of(context).colorScheme.primary,
                              border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 1.5),
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
                                builder: (context) {
                                  return  ConfiguracoesView();
                                },
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
                              color: Theme.of(context).colorScheme.primary,
                              border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 1.5),
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
                              color: Theme.of(context).colorScheme.primary,
                              border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 1.5),
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
            ),
          );
        }
      },
    );
  }

  // Stream pegarUsuario() {
  //   if (auth.usuarioLogado() != null) {
  //     final refUsuario =
  //         auth.firebase.collection('usuario').doc(auth.usuarioLogado().uid);
  //     return refUsuario.snapshots().map((snapshot) {
  //       final dados = snapshot.data();
  //       print('Dados do usuário: $dados');
  //       return dados;
  //     });
  //   } else {
  //     return Stream.empty();
  //   }
  // }

  _logout(BuildContext context) {
    auth.logout(context);
  }
}
