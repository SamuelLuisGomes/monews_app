import 'package:flutter/material.dart';
import 'package:monews_app/views/registro_view.dart';

class NoticiasView extends StatefulWidget {
  @override
  State<NoticiasView> createState() => _NoticiasViewtState();
}

class _NoticiasViewtState extends State<NoticiasView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            Text('Bem Vindo as Notícias !!'),
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
          ],
        )),
      ),
    );
  }
}
