import 'package:flutter/material.dart';
import 'package:frontend/pages/cart.dart';
import 'package:frontend/widgets/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      // padding: EdgeInsets.all(size.width * 0.01),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Logo',
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(211, 0, 0, 0),
              fontSize: size.width * 0.035,
              fontWeight: FontWeight.w600,
            ),
          ),
          const OtherUtils(),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Cart()));
            },
            child: Container(
              width: size.width * 0.12,
              padding: EdgeInsets.all(size.width * 0.01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1,
                  color: const Color.fromRGBO(16, 33, 125, 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: const Color.fromRGBO(16, 33, 125, 1),
                    size: size.width * 0.02,
                  ),
                  Text(
                    'Cart',
                    style: GoogleFonts.poppins(
                      color: mainColor,
                      fontSize: size.width * 0.024,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OtherUtils extends StatefulWidget {
  const OtherUtils({super.key});

  @override
  State<OtherUtils> createState() => _OtherUtilsState();
}

class _OtherUtilsState extends State<OtherUtils> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.fromLTRB(0, size.width * 0.04, 0, 0),
      width: size.width * 0.50,
      height: size.width * 0.15,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomText(
            text: 'Home',
            isselected: true,
          ),
          CustomText(
            text: 'View tests',
            isselected: false,
          ),
          CustomText(
            text: 'About us',
            isselected: false,
          ),
          CustomText(
            text: 'Contact',
            isselected: false,
          )
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final bool isselected;
  final String text;
  const CustomText({required this.isselected, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          text,
          style: GoogleFonts.poppins(
            color: isselected
                ? const Color.fromARGB(255, 11, 39, 199)
                : Colors.grey,
            fontSize: size.width * 0.02,
            fontWeight: FontWeight.w600,
          ),
        ),
        // isselected
        //     ? Text(
        //         '.',
        //         style: GoogleFonts.poppins(
        //             color: const Color.fromRGBO(16, 33, 125, 1)),
        //       )
        //     : Container(),
      ],
    );
  }
}
