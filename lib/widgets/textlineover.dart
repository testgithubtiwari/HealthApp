import 'package:flutter/material.dart';

class TextWithLineOver extends StatelessWidget {
  final String text;

  const TextWithLineOver({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Text(
          text,
          // ignore: prefer_const_constructors
          style: TextStyle(
            fontSize: size.width >= 800 ? 17 : 13,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        Positioned(
          top: size.width >= 800 ? 12 : 11,
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
