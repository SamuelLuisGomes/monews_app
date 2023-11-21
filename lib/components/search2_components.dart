import 'package:flutter/material.dart';

class Pesquisa extends StatelessWidget implements PreferredSizeWidget {
  final double alturaAppBar;
  final String? hintText;
  final void Function(String)? onChanged;

  const Pesquisa({
    Key? key,
    this.hintText,
    this.alturaAppBar = 100, this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 64, right: 8),
      child: Container(
        //alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: Colors.blueGrey[900],
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 26,
              ),
            ),
            Expanded(
              child: TextField(
                style: const TextStyle(color: Colors.black),
                autofocus: false,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 20,
                  ),
                  hintText: hintText,
                  hintStyle: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(alturaAppBar);
}
