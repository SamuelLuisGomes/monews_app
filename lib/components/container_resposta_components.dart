import 'package:flutter/material.dart';

class ContainerPadrao extends StatelessWidget {
  String? texto;
  ContainerPadrao({
    super.key,
    this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.grey,
            width: 1.5,
          ),
          color: Theme.of(context).primaryColor,
        ),
        child: ListTile(
          leading: Icon(
            Icons.error_outline_outlined,
            color: Theme.of(context).scaffoldBackgroundColor,
            size: 36,
          ),
          title: Text(
            texto!,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).textTheme.displaySmall!.color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
