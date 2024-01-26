// import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/sucess.dart';
import 'package:frontend/widgets/cartappbar.dart';
import 'package:frontend/widgets/cartappbardesktop.dart';
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
  List<Map<String, dynamic>> cartItems = [];
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  void updateDateTime(DateTime? date, TimeOfDay? time) {
    setState(() {
      selectedDate = date;
      selectedTime = time;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchDataFromDatabase();
  }

  Future<void> fetchDataFromDatabase() async {
    DatabaseReference cartRef =
        // ignore: deprecated_member_use
        FirebaseDatabase.instance.reference().child('cart');
    DataSnapshot snapshot = (await cartRef.once()).snapshot;

    setState(() {
      cartItems.clear();
      if (snapshot.value != null) {
        Map<dynamic, dynamic>? data = snapshot.value as Map<dynamic, dynamic>?;

        if (data != null) {
          data.forEach((key, value) {
            Map<String, dynamic> itemData = Map.from(value);
            itemData['id'] = key;
            cartItems.add(itemData);
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    int totalActualMoney = 0;
    int totalDiscountMoney = 0;

    for (var item in cartItems) {
      totalActualMoney += int.parse(item['actualMoney']);
      totalDiscountMoney += int.parse(item['discountPrice']);
    }
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => fetchDataFromDatabase(),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                size.width >= 800
                    ? const CartAppBarDesktop()
                    : const CartAppbar(),
                SizedBox(
                  height: size.width >= 800 ? 20 : 20,
                ),
                Text(
                  'Order review',
                  style: GoogleFonts.inter(
                    color: mainColor,
                    fontSize: size.width >= 800 ? 30 : 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: size.width >= 800 ? 30 : 20,
                ),
                Wrap(
                  spacing: 30,
                  runSpacing: 20,
                  children: cartItems.map((test) {
                    return ContainerOrder(
                      testName: test['testName'],
                      discountMoney: test['discountPrice'],
                      actualMoney: test['actualMoney'],
                      // onItemRemoved: () => fetchDataFromDatabase(),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 20,
                ),
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
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
