import 'package:flutter/material.dart';
import 'package:frontend/widgets/constants.dart';
// import 'package:google_fonts/google_fonts.dart';

class PopularLabTests extends StatefulWidget {
  const PopularLabTests({super.key});

  @override
  State<PopularLabTests> createState() => _PopularLabTestsState();
}

class _PopularLabTestsState extends State<PopularLabTests> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return size.width >= 700
        ? SizedBox(
            height: size.width * 0.15,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Popular Lab Tests',
                  style: TextStyle(
                    color: mainColor,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: size.width * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomLabTests(),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'View more',
                          style: TextStyle(
                            color: mainColor,
                            fontSize: size.width * 0.025,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // SizedBox(
                        //   width: size.width * 0.01,
                        // ),
                        Icon(
                          Icons.arrow_forward,
                          color: mainColor,
                          size: size.width * 0.022,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Lab tests',
                style: TextStyle(
                  color: const Color.fromRGBO(16, 33, 125, 1),
                  fontSize: size.width * 0.045,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'View more',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: size.width * 0.035,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: mainColor,
                        size: size.width * 0.04,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
  }
}

class CustomLabTests extends StatefulWidget {
  const CustomLabTests({super.key});

  @override
  State<CustomLabTests> createState() => _CustomLabTestsState();
}

class _CustomLabTestsState extends State<CustomLabTests> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(size.width * 0.005),
      // height: size.width * 0.14,
      width: size.width * 0.75,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomLabName(isSelected: true, text: 'Popular tests'),
          CustomLabName(isSelected: false, text: 'Fever'),
          CustomLabName(isSelected: false, text: 'Covid 19'),
          CustomLabName(isSelected: false, text: 'Allergy Profiles'),
          CustomLabName(isSelected: false, text: 'Fittness'),
        ],
      ),
    );
  }
}

class CustomLabName extends StatefulWidget {
  final String text;
  final bool isSelected;
  const CustomLabName(
      {required this.isSelected, required this.text, super.key});

  @override
  State<CustomLabName> createState() => _CustomTextNameState();
}

class _CustomTextNameState extends State<CustomLabName> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(size.width * 0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.isSelected ? mainColor : Colors.transparent,
        border: Border.all(
          color: mainColor,
          width: 1,
        ),
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          color: widget.isSelected ? Colors.white : mainColor,
          fontSize: size.width * 0.02,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
