import 'package:flutter/material.dart';

class MySearch extends StatefulWidget {
  final void Function(String)? onChanged;
  final String? hintText;
  const MySearch({super.key, this.onChanged, this.hintText});

  @override
  State<MySearch> createState() => _MySearchState();
}

class _MySearchState extends State<MySearch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 12,
        right: 12,
        top: 8,
        bottom: 16,
      ),
      child: TextField(
        style: const TextStyle(
            //color: Colors.white,
            ),
        autofocus: false,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  //color: Colors.white,
                  )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  //color: Colors.white,
                  )),
          prefixIcon: const Icon(
            Icons.search,
            //color: Colors.white,
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            //color: Colors.white,
          ),
        ),
      ),
    );
  }
}
