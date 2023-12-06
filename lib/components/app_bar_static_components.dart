import 'package:flutter/material.dart';
import 'package:monews_app/components/logo_components.dart';

class AppBarStatic extends StatelessWidget implements PreferredSizeWidget {
  final double alturaAppBar;
  //IconData? icone;
  String? telaNome;
  AppBarStatic({
    super.key,
    this.telaNome,
    this.alturaAppBar = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(alturaAppBar);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Expanded(
        child: Center(
          child: Logo()
        ),
      ),
    );
    // return AppBar(
    //   backgroundColor: Theme.of(context).primaryColor,
    //   title: Expanded(
    //     child: Center(
    //       child: Container(
    //         width: MediaQuery.of(context).size.width * 0.38,
    //         child: Text(
    //           'Monews',
    //           style: Theme.of(context).textTheme.displaySmall,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
