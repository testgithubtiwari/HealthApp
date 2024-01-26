// import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:frontend/main.dart';
import 'package:frontend/pages/sucess.dart';
import 'package:frontend/widgets/cartappbar.dart';
import 'package:frontend/widgets/cartappbardesktop.dart';
import 'package:frontend/widgets/constants.dart';
import 'package:frontend/widgets/containorder.dart';
import 'package:frontend/widgets/hardcopyreports.dart';
import 'package:frontend/widgets/mobileviewcart.dart';
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

  void showNotification() async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'health-notifications',
      'Health Notification',
      priority: Priority.max,
      importance: Importance.max,
    );

    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    await notificationsPlugin.show(
      0,
      "Simple Notification",
      "this is a Notification",
      notificationDetails,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    int totalActualMoney = 0;
    int totalDiscountMoney = 0;
    // print(size.width);

    for (var item in cartItems) {
      totalActualMoney += int.parse(item['actualMoney']);
      totalDiscountMoney += int.parse(item['discountPrice']);
    }
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => fetchDataFromDatabase(),
        child: Container(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                size.width >= 800
                    ? const CartAppBarDesktop()
                    : const CartAppbar(),
                SizedBox(
                  height: size.width >= 800 ? 20 : 20,
                ),
                // Center(
                //   child: Text(
                //     'Order review',
                //     style: GoogleFonts.inter(
                //       color: mainColor,
                //       fontSize: size.width >= 800 ? 30 : 22,
                //       fontWeight: FontWeight.w600,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: size.width >= 800 ? 30 : 20,
                // ),
                // size.width >=800?
                SingleChildScrollView(
                  child: size.width >= 1100
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ContainerOrder(
                              cartItems: cartItems,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              height: 700,
                              width: 500,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              child: Column(
                                children: [
                                  // const SizedBox(
                                  //   height: 20,
                                  // ),
                                  SelectDate(
                                      onDateTimeSelected: updateDateTime),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Price(
                                    actualMoney: totalActualMoney.toString(),
                                    discountMoney:
                                        totalDiscountMoney.toString(),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const HardCopyReports(),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  GestureDetector(
                                    onTap: showNotification,
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
                            )
                          ],
                        )
                      : MobileViewCart(
                          cartItems: cartItems,
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
