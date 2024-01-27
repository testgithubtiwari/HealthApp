import 'package:flutter/material.dart';
import 'package:frontend/widgets/constants.dart';
// import 'package:frontend/widgets/textlinebelow.dart';
// import 'package:google_fonts/google_fonts.dart';

class PopularPackage extends StatefulWidget {
  const PopularPackage({super.key});

  @override
  State<PopularPackage> createState() => _PupularPackageState();
}

class _PupularPackageState extends State<PopularPackage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return size.width >= 1000
        ? SizedBox(
            height: 160,
            width: size.width,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Popular Packages',
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                size.width >= 1100
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomLabTests(),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'View more',
                                style: TextStyle(
                                  color: mainColor,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: mainColor,
                                size: 20,
                              ),
                            ],
                          ),
                        ],
                      )
                    : const CustomLabTests(),
                size.width >= 1100
                    ? Container()
                    : Container(
                        alignment: Alignment.bottomRight,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'View more',
                              style: TextStyle(
                                color: mainColor,
                                fontSize: 23,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: mainColor,
                              size: 20,
                            ),
                          ],
                        ),
                      )
              ],
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Packages',
                style: TextStyle(
                  color: mainColor,
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
    // final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      // height: size.width * 0.14,
      width: 900,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomLabName(isSelected: true, text: 'All Packages'),
          CustomLabName(isSelected: false, text: 'Elderly'),
          CustomLabName(isSelected: false, text: 'Heart'),
          CustomLabName(isSelected: false, text: 'Women Health'),
          CustomLabName(isSelected: false, text: 'Men'),
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
    // final Size size = MediaQuery.of(context).size;
    return Container(
      width: 150,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.isSelected ? mainColor : Colors.transparent,
        border: Border.all(
          color: mainColor,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.isSelected ? Colors.white : mainColor,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
