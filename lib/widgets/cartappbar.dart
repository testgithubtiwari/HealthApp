import 'package:flutter/material.dart';
import 'package:frontend/widgets/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CartAppbar extends StatefulWidget {
  const CartAppbar({super.key});

  @override
  State<CartAppbar> createState() => _CartAppbarState();
}

class _CartAppbarState extends State<CartAppbar> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomNew(),
        Icon(
          Icons.menu,
          color: mainColor,
          size: 25,
        )
      ],
    );
  }
}

class CustomNew extends StatelessWidget {
  const CustomNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),
        const SizedBox(
          width: 40,
        ),
        Text(
          'My cart',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
