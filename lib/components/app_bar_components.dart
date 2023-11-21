import 'package:flutter/material.dart';
class MenuVoltar extends StatelessWidget implements PreferredSizeWidget {
  IconData? icone;
  final double alturaAppBar;
  Function()? removeCarteira;
  MenuVoltar({
    super.key,
    this.icone,
    this.alturaAppBar = kToolbarHeight,
    this.removeCarteira,
  });

  @override
  Size get preferredSize => Size.fromHeight(alturaAppBar);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 46, right: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[900],
        ),
        child: icone != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      icone,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
