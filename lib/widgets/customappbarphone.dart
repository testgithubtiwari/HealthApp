import 'package:flutter/material.dart';
import 'package:frontend/pages/cart.dart';
import 'package:frontend/widgets/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPhoneAppBar extends StatefulWidget {
  const CustomPhoneAppBar({super.key});

  @override
  State<CustomPhoneAppBar> createState() => _CustomPhoneAppBarState();
}

class _CustomPhoneAppBarState extends State<CustomPhoneAppBar> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(size.width * 0.015),
      height: size.width * 0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Logo',
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(211, 0, 0, 0),
              fontSize: size.width * 0.065,
              fontWeight: FontWeight.w600,
            ),
          ),
          // Spacer(), // This will push the following widget to the right end
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Cart()));
            },
            child: Icon(
              Icons.shopping_cart,
              color: mainColor,
              size: size.width * 0.06,
            ),
          ),
        ],
      ),
    );
  }
}
