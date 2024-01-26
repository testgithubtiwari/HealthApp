import 'package:flutter/material.dart';
import 'package:frontend/pages/sucess.dart';
import 'package:frontend/widgets/cartappbar.dart';
import 'package:frontend/widgets/constants.dart';
import 'package:frontend/widgets/containorder.dart';
import 'package:frontend/widgets/hardcopyreports.dart';
import 'package:frontend/widgets/price.dart';
import 'package:frontend/widgets/selectdate.dart';
// import 'package:frontend/widgets/textlineover.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
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
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CartAppbar(),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Order review',
                style: GoogleFonts.inter(
                  color: mainColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const ContainerOrder(
                discountMoney: '1000',
                testName: 'Thyroid Profile',
                actualMoney: '1400',
              ),
              const SizedBox(
                height: 20,
              ),
              SelectDate(onDateTimeSelected: updateDateTime),
              const SizedBox(
                height: 20,
              ),
              const Price(actualMoney: '1400', discountMoney: '1000'),
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
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
