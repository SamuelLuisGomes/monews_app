import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/acoes_model.dart';

class MyListAcoes extends StatelessWidget {
  final AcoesModel acoes;
  final VoidCallback addCarteira;
  const MyListAcoes(
      {super.key, required this.acoes, required this.addCarteira});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: const Color.fromRGBO(67, 115, 150, 100),
          ),
          child: ListTile(
            leading: Hero(
              tag: acoes.siglaAcao.toString(),
              child: CircleAvatar(
                radius: 32,
                child: ClipOval(
                  child: SvgPicture.network(
                    acoes.imagemAcao.toString(),
                    height: 52,
                    width: 52,
                  ),
                ),
                // backgroundImage: NetworkImage(acoes.imagemAcao.toString()),
              ),
            ),
            title: Text(
              acoes.siglaAcao.toString(),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              acoes.nomeEmpresa.toString(),
              style: const TextStyle(color: Colors.white70),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 32,
              ),
              onPressed: () {
                addCarteira();
              },
            ),
            // Função para página de detalhes da ação selecionada
            //onTap: () {},
          ),
        ),
      ]),
    );
  }
}
