import 'package:flutter/material.dart';
import 'package:frontend/widgets/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPackagesContainer extends StatefulWidget {
  final String packageName;
  final String testCount;
  final String image;
  final String actualMoney;
  final List testList;
  const CustomPackagesContainer(
      {required this.image,
      required this.testList,
      required this.testCount,
      required this.packageName,
      required this.actualMoney,
      super.key});

  @override
  State<CustomPackagesContainer> createState() =>
      _CustomPackagesContainerState();
}

class _CustomPackagesContainerState extends State<CustomPackagesContainer> {
  List test = [];
  @override
  void initState() {
    test = widget.testList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(size.width * 0.03),
      height: size.height * 0.40,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(55),
                  color: fadeMaincolor,
                ),
                child: Image(
                  image: AssetImage(widget.image),
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 30,
                child: Image(
                  image: AssetImage('assets/images/Badge1.png'),
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            widget.packageName,
            style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'Includes ${widget.testCount} tests',
            style: GoogleFonts.inter(
              color: const Color.fromRGBO(108, 135, 174, 1),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            // height: size.width * 0.15,
            padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
            child: ItemTest(itemTests: test),
          ),
          Text(
            'View More',
            style: GoogleFonts.inter(
              color: const Color.fromRGBO(108, 135, 174, 1),
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            width: 65,
            child: Divider(
              color: Color.fromRGBO(108, 135, 174, 1),
              height: 1,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\u{20B9} ${widget.actualMoney}',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(27, 169, 181, 1),
                ),
              ),
              Container(
                width: 150,
                height: 40,
                // padding: EdgeInsets.all(size.width * 0.01),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: mainColor, width: 1),
                ),
                child: Center(
                  child: Text(
                    'Add to cart',
                    style: GoogleFonts.inter(
                      color: mainColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ItemTest extends StatelessWidget {
  final List itemTests;

  const ItemTest({required this.itemTests, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;

    List<Widget> rows = itemTests.map((item) {
      return Row(
        children: [
          Text(
            '.',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: const Color.fromRGBO(108, 135, 174, 1),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            item.toString(),
            style: GoogleFonts.inter(
              fontSize: 10,
              color: const Color.fromRGBO(108, 135, 174, 1),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rows,
    );
  }
}
