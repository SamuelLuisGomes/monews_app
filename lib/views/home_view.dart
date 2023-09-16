import 'package:flutter/material.dart';
import 'package:monews_app/views/registro_view.dart';
import 'package:monews_app/controllers/autenticacao_controllers.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _formKey = GlobalKey<FormState>();

  AutenticacaoController auth = AutenticacaoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            Text('Bem Vindo a HOME!!'),
            SizedBox(
              height: 15,
            ),
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
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              // Criando a linha
              // Centralizando os filhos no centro
              mainAxisAlignment: MainAxisAlignment.center,
              // Definindo os filhos da linha
              children: [
                // Adicionando texto
                Text(
                  'Deseja realizar logout?',
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    _logout(context);
                  },
                  child: // Adicionando texto
                      const Text(
                    'logout',
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
            ),
          ],
        )),
      ),
    );
  }

  _logout(BuildContext context) {
    auth.logout(context);
  }
}
