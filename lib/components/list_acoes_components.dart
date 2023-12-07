import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/acoes_model.dart';

class MyListAcoes extends StatelessWidget {
  final AcoesModel acoes;
  Function()? addCarteira;
  Function()? removeCarteira;
  IconData? icone;
  MyListAcoes(
      {super.key,
      required this.acoes,
      this.addCarteira,
      this.icone,
      this.removeCarteira});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 1.5,
              ),
              color: Theme.of(context).colorScheme.primary,
              // color: const Color.fromRGBO(67, 115, 150, 100),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                //foregroundColor: Colors.white,
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
              // leading: Hero(
              //   tag: acoes.siglaAcao.toString(),
              //   child: CircleAvatar(
              //     backgroundColor: Colors.white,
              //     //foregroundColor: Colors.white,
              //     radius: 32,
              //     child: ClipOval(
              //       child: SvgPicture.network(
              //         acoes.imagemAcao.toString(),
              //         height: 52,
              //         width: 52,
              //       ),
              //     ),
              //     // backgroundImage: NetworkImage(acoes.imagemAcao.toString()),
              //   ),
              // ),
              title: Text(
                acoes.siglaAcao.toString(),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                acoes.nomeEmpresa.toString(),
                style: const TextStyle(color: Colors.white70),
              ),
              trailing: addCarteira != null
                  ? IconButton(
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 32,
                      ),
                      onPressed: () {
                        addCarteira!();
                      },
                    )
                  : removeCarteira != null
                      ? IconButton(
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.white,
                            size: 32,
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text(
                                      'Atenção',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    content: Text(
                                      'Realmente deseja excluir: ${acoes.siglaAcao}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Não'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('Sim'),
                                        onPressed: () {
                                          removeCarteira!();
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                });
                          },
                        )
                      : const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
