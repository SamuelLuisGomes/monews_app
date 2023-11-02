// 'import 'package:flutter/material.dart';
// import 'package:monews_app/components/alert_dialog_components.dart';
// import 'package:monews_app/components/container_acao_components.dart';
// import 'package:monews_app/components/list_acoes_components.dart';
// import 'package:monews_app/components/loading_components.dart';
// import 'package:monews_app/controllers/autenticacao_controller.dart';
// import 'package:monews_app/models/acoes_model.dart';
// import 'package:monews_app/views/acoes/pesquisa_acoes_view.dart';

// class AcoesView extends StatefulWidget {
//   @override
//   State<AcoesView> createState() => _AcoesViewState();
// }

// AutenticacaoController auth = AutenticacaoController();
// List<AcoesModel> carteira = [];

// class _AcoesViewState extends State<AcoesView> {
//   @override
//   void initState() {
//     super.initState();
//     pegarCarteira().listen((itens) {
//       setState(() {
//         carteira = itens;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey[900],
//       body: SafeArea(
//         child: Center(
//           child: CustomScrollView(
//             slivers: [
//               const SliverAppBar(
//                 floating: true,
//                 pinned: true,
//                 snap: true,
//                 expandedHeight: 120,
//                 centerTitle: true,
//                 backgroundColor: Color.fromARGB(255, 10, 140, 176),
//                 flexibleSpace: FlexibleSpaceBar(
//                   centerTitle: false,
//                   titlePadding: EdgeInsets.only(left: 38, bottom: 12),
//                   title: Text(
//                     'Ações',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 32),
//                   ),
//                 ),
//                 elevation: 0,
//               ),
//               SliverToBoxAdapter(
//                 child: Container(
//                   height: 200,
//                   color: Color.fromARGB(255, 10, 140, 176),
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 64),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (context) {
//                                   return PesquisaAcoesView();
//                                 },
//                               ),
//                             );
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Color.fromRGBO(67, 115, 150, 100),
//                               borderRadius: BorderRadius.circular(16),
//                             ),
//                             height: 80, // Reduzi a altura dos botões
//                             width: 80, // Reduzi a largura dos botões
//                             child: Icon(
//                               Icons.add,
//                               color: Colors.white,
//                               size: 32, // Aumentei o tamanho do ícone
//                             ),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {},
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Color.fromRGBO(67, 115, 150, 100),
//                               borderRadius: BorderRadius.circular(16),
//                             ),
//                             height: 80, // Reduzi a altura dos botões
//                             width: 80, // Reduzi a largura dos botões
//                             child: Icon(Icons.remove,
//                                 color: Colors.white,
//                                 size: 32 // Aumentei o tamanho do ícone
//                                 ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               SliverList(
//                 delegate: SliverChildBuilderDelegate(
//                   (BuildContext context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: StreamBuilder<List<AcoesModel>>(
//                         stream: pegarCarteira(),
//                         builder: (context, snapshot) {
//                           if (snapshot.connectionState ==
//                               ConnectionState.waiting) {
//                             return const MyLoading();
//                           } else if (snapshot.hasError) {
//                             return Text('Erro: ${snapshot.error}');
//                           } else {
//                             return MyListAcoes(acoes: carteira);
//                           }
//                         },
//                       ),
//                     );
//                   },
//                   childCount: carteira.length,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Stream<List<AcoesModel>> pegarCarteira() {
//     if (auth.usuarioLogado()) {
//       final referenciaUsuario =
//           auth.firebase.collection('usuario').doc(auth.usuarioLogado().uid);
//       return referenciaUsuario.snapshots().map((snapshot) {
//         final dados = snapshot.data();
//         final carteira = dados?['carteira'] ?? [];
//         return List<AcoesModel>.from(carteira);
//       });
//     } else {
//       return const Stream.empty();
//     }
//   }
// }
