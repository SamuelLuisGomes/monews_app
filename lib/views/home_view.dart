import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:monews_app/components/bottom_nav_components.dart';
import 'package:monews_app/controllers/autenticacao_controllers.dart';
import 'package:monews_app/views/acoes_view.dart';
import 'package:monews_app/views/noticias_view.dart';
import 'package:monews_app/views/perfil_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _formKey = GlobalKey<FormState>();

  AutenticacaoController auth = AutenticacaoController();

  Color corSelecionada = Colors.white;
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    // TODO: implement initState
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
      body: PageView(
        controller: pc,
        children: paginas(),
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.height * 0.1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BottomNavigationBar(
              selectedItemColor: corSelecionada,
              currentIndex: paginaAtual,
              items: iconesPaginas(),
              onTap: (pagina) {
                pc.animateToPage(pagina,
                    duration: Duration(milliseconds: 400), curve: Curves.ease);
              },
              backgroundColor: Color.fromARGB(255, 4, 103, 131),
            ),
          ),
        ),
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
      BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.home,
        ),
        label: 'Notícias',
        backgroundColor: Colors.white,
      ),
      BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.money_dollar_circle,
        ),
        label: 'Ações',
        backgroundColor: Colors.white,
      ),
      BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.person_alt_circle,
        ),
        label: 'Perfil',
        backgroundColor: Colors.white,
      )
    ];
  }
}
