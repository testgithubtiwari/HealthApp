import 'package:flutter/material.dart';
import 'package:frontend/widgets/constants.dart';

class TextWithLineBelow extends StatelessWidget {
  final String text;
  final double fontSize;

  const TextWithLineBelow({
    Key? key,
    required this.text,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      height:screenSize.width*0.10,
      child: Stack(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              color: mainColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          Positioned(
            top: screenSize.width * 0.30,
            child: Container(
              width: screenSize.width * 0.17,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: mainColor,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
