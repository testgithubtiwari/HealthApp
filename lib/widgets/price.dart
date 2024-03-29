import 'package:flutter/material.dart';
import 'package:frontend/widgets/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Price extends StatefulWidget {
  final String actualMoney;
  final String discountMoney;
  const Price(
      {required this.actualMoney, required this.discountMoney, super.key});

  @override
  State<Price> createState() => _PriceState();
}

class _PriceState extends State<Price> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    int discountcal =
        int.parse(widget.actualMoney) - int.parse(widget.discountMoney);
    return Container(
      height: 200,
      // width: 600,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'M.R.P Total',
                style: GoogleFonts.inter(
                  color: Colors.grey,
                  fontSize: size.width >= 300 ? 13 : 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                widget.actualMoney,
                style: GoogleFonts.inter(
                  color: Colors.grey,
                  fontSize: size.width >= 300 ? 13 : 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discount',
                style: GoogleFonts.inter(
                  color: Colors.grey,
                  fontSize: size.width >= 300 ? 13 : 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                discountcal.toString(),
                style: GoogleFonts.inter(
                  color: Colors.grey,
                  fontSize: size.width >= 300 ? 13 : 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                size.width >= 300 ? 'Amount to be paid' : 'Amount total',
                style: GoogleFonts.inter(
                  color: mainColor,
                  fontSize: size.width >= 400
                      ? 18
                      : size.width >= 300 && size.width < 800
                          ? 13
                          : 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '\u{20B9} ${widget.discountMoney}/-',
                style: GoogleFonts.inter(
                  color: mainColor,
                  fontSize: size.width >= 400
                      ? 18
                      : size.width >= 300 && size.width < 800
                          ? 13
                          : 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total savings',
                style: GoogleFonts.inter(
                  color: mainColor,
                  fontSize: size.width >= 400
                      ? 18
                      : size.width >= 300 && size.width < 800
                          ? 13
                          : 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                '\u{20B9} ${discountcal.toString()}/-',
                style: GoogleFonts.inter(
                  color: mainColor,
                  fontSize: size.width >= 400
                      ? 18
                      : size.width >= 300 && size.width < 800
                          ? 13
                          : 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
