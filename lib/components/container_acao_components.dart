import 'package:flutter/material.dart';

class acaoContainer extends StatelessWidget {
  final String? siglaAcao;
  final String? nomeEmpresa;
  final String? imagemAcao;

  acaoContainer({
    this.siglaAcao,
    this.nomeEmpresa,
    this.imagemAcao,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.fromRGBO(67, 115, 150, 100),
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  //padding: const EdgeInsets.all(12),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(imagemAcao!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Center(
              child: Column(
                children: [
                  Text(
                    nomeEmpresa ?? '', // Nome da Empresa
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    siglaAcao ?? '', // Sigla da Ação
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
