import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:frontend/pages/sucess.dart';
import 'package:frontend/widgets/constants.dart';
import 'package:frontend/widgets/containorder.dart';
import 'package:frontend/widgets/hardcopyreports.dart';
import 'package:frontend/widgets/price.dart';
import 'package:frontend/widgets/selectdate.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MobileViewCart extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const MobileViewCart({required this.cartItems, super.key});

  @override
  State<MobileViewCart> createState() => _MobileViewCartState();
}

class _MobileViewCartState extends State<MobileViewCart> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  void updateDateTime(DateTime? date, TimeOfDay? time) {
    setState(() {
      selectedDate = date;
      selectedTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalActualMoney = 0;
    int totalDiscountMoney = 0;

    for (var item in widget.cartItems) {
      totalActualMoney += int.parse(item['actualMoney']);
      totalDiscountMoney += int.parse(item['discountPrice']);
    }
    return Column(
      children: [
        widget.cartItems.isEmpty
            ? const Center(
                child: SpinKitFadingCube(
                  color: mainColor,
                  size: 60,
                  duration: Duration(milliseconds: 2000),
                ),
              )
            : ContainerOrder(
                cartItems: widget.cartItems,
              ),
        const SizedBox(
          height: 40,
        ),
        Container(
          padding: const EdgeInsets.all(15),
          height: 630,
          // width: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: Column(
            children: [
              SelectDate(onDateTimeSelected: updateDateTime),
              const SizedBox(
                height: 20,
              ),
              Price(
                actualMoney: totalActualMoney.toString(),
                discountMoney: totalDiscountMoney.toString(),
              ),
              const SizedBox(
                height: 20,
              ),
              const HardCopyReports(),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Success(
                        choosenDate: selectedDate,
                        choosenTime: selectedTime,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: mainColor,
                  ),
                  child: Center(
                    child: Text(
                      'Schedule',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
