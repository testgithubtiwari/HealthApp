import 'package:flutter/material.dart';

class TextWithLineOver extends StatelessWidget {
  final String text;

  const TextWithLineOver({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Text(
          text,
          // ignore: prefer_const_constructors
          style: TextStyle(
            fontSize: 13,
            color: Colors.black,
          ),
        ),
        Positioned(
          top: 12,
          child: Container(
            width: 48,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
