import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.fromLTRB(10, 7, 10, 0),
      decoration: const BoxDecoration(
        color: Color.fromARGB(200, 0, 0, 0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(30, 35, 10, 15),
            width: 250,
            padding: const EdgeInsets.all(10),
            // decoration: BoxDecoration(
            //   border: Border.all(width: 1, color: Colors.white),
            // ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Logo',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Join us',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIcon(
                      iconData: Icons.facebook,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomIcon(
                      iconData: Icons.facebook,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomIcon(
                      iconData: Icons.facebook,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomIcon(
                      iconData: Icons.facebook,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomIcon(
                      iconData: Icons.facebook,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 35, 10, 15),
            padding: const EdgeInsets.all(10),
            width: 450,
            // height: 200,
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     width: 1,
            //     color: Colors.white,
            //   ),
            // ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ignore: avoid_unnecessary_containers
                    Container(
                      height: 180,
                      width: 150,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            isBold: true,
                            text: 'Company',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            isBold: false,
                            text: 'About us',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            isBold: false,
                            text: 'Contact us',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            isBold: false,
                            text: 'Terms & conditions',
                          ),
                          CustomText(
                            isBold: false,
                            text: 'Pricing',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            isBold: false,
                            text: 'Testimonials',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 180,
                      width: 150,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            isBold: true,
                            text: 'Support',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            isBold: false,
                            text: 'Help center',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            isBold: false,
                            text: 'Legal',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            isBold: false,
                            text: 'Terms of service',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            isBold: false,
                            text: 'Privacy policy',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            isBold: false,
                            text: 'Status',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Health @2023 All rights reserved.',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
          Container(
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     width: 1,
            //     color: Colors.white,
            //   ),
            // ),
            width: 280,
            margin: const EdgeInsets.fromLTRB(20, 35, 10, 15),
            padding: const EdgeInsets.all(10),
            // height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomText(isBold: true, text: 'Stay up to date'),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 40,
                  width: 210,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      'Enter your email address',
                      style: GoogleFonts.inter(
                          color: const Color.fromARGB(181, 0, 0, 0),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomIcon extends StatefulWidget {
  final IconData iconData;
  final double size;
  final Color color;

  const CustomIcon({
    required this.iconData,
    required this.size,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomIcon> createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      widget.iconData,
      size: widget.size,
      color: widget.color,
    );
  }
}

class CustomText extends StatefulWidget {
  final String text;
  final bool isBold;
  const CustomText({required this.isBold, required this.text, super.key});

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: GoogleFonts.inter(
        color: Colors.white,
        fontWeight: widget.isBold ? FontWeight.w800 : FontWeight.w400,
        fontSize: 16,
      ),
    );
  }
}
