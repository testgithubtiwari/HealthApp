import 'package:flutter/material.dart';
// import 'package:frontend/firebaseservice.dart';
import 'package:frontend/pages/cart.dart';
import 'package:frontend/widgets/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPhoneAppBar extends StatefulWidget {
  final int cartItemCount;
  const CustomPhoneAppBar({required this.cartItemCount, Key? key})
      : super(key: key);

  @override
  State<CustomPhoneAppBar> createState() => _CustomPhoneAppBarState();
}

class _CustomPhoneAppBarState extends State<CustomPhoneAppBar> {
  // ignore: prefer_final_fields

  @override
  Widget build(BuildContext context) {
    // print('Item in the cart is:${widget.cartItemCount}');
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(5),
      height: 90,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Logo',
                style: GoogleFonts.poppins(
                  color: mainColor,
                  fontSize: size.width * 0.065,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Cart()));
                },
                child: Stack(
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: mainColor,
                      size: size.width >= 700 ? 44 : 34,
                    ),
                    if (widget.cartItemCount > 0)
                      Positioned(
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          constraints: BoxConstraints(
                            minWidth: size.width >= 700 ? 20 : 16,
                            minHeight: size.width >= 700 ? 20 : 16,
                          ),
                          child: Text(
                            widget.cartItemCount.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width >= 700 ? 18 : 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            height: 1.5,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
