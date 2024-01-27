import 'package:flutter/material.dart';
import 'package:frontend/pages/cart.dart';
import 'package:frontend/widgets/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatefulWidget {
  final int cartItemCount;
  const CustomAppBar({required this.cartItemCount, super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return SizedBox(
      // padding: EdgeInsets.all(size.width * 0.01),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Logo',
            style: GoogleFonts.inter(
              color: mainColor,
              fontSize: 35,
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
              width: 150,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 1,
                  color: const Color.fromRGBO(16, 33, 125, 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      const Icon(
                        Icons.shopping_cart,
                        color: mainColor,
                        size: 30,
                      ),
                      if (widget.cartItemCount > 0)
                        Positioned(
                          right: 0,
                          left: 10,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                            ),
                            child: Text(
                              widget.cartItemCount.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Text(
                    'Cart',
                    style: GoogleFonts.inter(
                      color: mainColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
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
    // final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
      width: 600,
      // height: size.width * 0.15,
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
    // final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          text,
          style: GoogleFonts.inter(
            color: isselected
                ? const Color.fromARGB(255, 11, 39, 199)
                : Colors.grey,
            fontSize: 25,
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
