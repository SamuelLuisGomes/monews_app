import 'package:flutter/material.dart';
import 'package:monews_app/controllers/autenticacao_controllers.dart';

class PerfilView extends StatefulWidget {
  @override
  State<PerfilView> createState() => _PerfilViewState();
}

AutenticacaoController auth = AutenticacaoController();

class _PerfilViewState extends State<PerfilView> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bem Vindo ao Perfil !!'),
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
                  style: TextStyle(color: Colors.black),
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
        ),
      )),
    );
  }

  _logout(BuildContext context) {
    auth.logout(context);
  }
}
