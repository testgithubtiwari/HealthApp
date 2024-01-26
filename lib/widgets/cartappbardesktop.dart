import 'package:flutter/material.dart';
import 'package:frontend/widgets/constants.dart';

class CartAppBarDesktop extends StatefulWidget {
  const CartAppBarDesktop({super.key});

  @override
  State<CartAppBarDesktop> createState() => _CartAppBarDesktopState();
}

class _CartAppBarDesktopState extends State<CartAppBarDesktop> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 60,
      child: Text(
        'My Cart',
        style: TextStyle(
          color: mainColor,
          fontSize: 40,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
