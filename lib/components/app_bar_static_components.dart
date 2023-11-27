import 'package:flutter/material.dart';

class AppBarStatic extends StatelessWidget implements PreferredSizeWidget {
  final double alturaAppBar;
  //IconData? icone;
  String telaNome;
  AppBarStatic({
    super.key,
    required this.telaNome,
    this.alturaAppBar = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(alturaAppBar);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Expanded(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.38,
            child: Text(
              telaNome,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ),
      ),
    );
  }
}
