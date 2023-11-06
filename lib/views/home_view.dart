import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:monews_app/components/bottom_nav_components.dart';
import 'package:monews_app/controllers/autenticacao_controller.dart';
import 'package:monews_app/views/acoes/acoes_view.dart';
import 'package:monews_app/views/noticias/noticias_view.dart';
import 'package:monews_app/views/usuario/perfil_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  AutenticacaoController auth = AutenticacaoController();

  Color corSelecionada = Colors.white;
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pc,
            onPageChanged: setPaginaAtual,
            children: paginas(),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 16,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: BottomNavigationBar(
                  selectedItemColor: corSelecionada,
                  currentIndex: paginaAtual,
                  items: iconesPaginas(),
                  onTap: (pagina) {
                    pc.animateToPage(pagina,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.ease);
                  },
                  backgroundColor: const Color.fromARGB(255, 10, 140, 176),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> paginas() {
    return [
      NoticiasView(),
      AcoesView(),
      PerfilView(),
    ];
  }

  List<BottomNavigationBarItem> iconesPaginas() {
    return [
      const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.home,
        ),
        label: 'Notícias',
        backgroundColor: Colors.white,
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.money_dollar_circle,
        ),
        label: 'Ações',
        backgroundColor: Colors.white,
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.person_alt_circle,
        ),
        label: 'Perfil',
        backgroundColor: Colors.white,
      )
    ];
  }
}
