// ignore_for_file: avoid_print

// import 'dart:async';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:frontend/widgets/constants.dart';
import 'package:frontend/widgets/textlineover.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerOrder extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const ContainerOrder({required this.cartItems, super.key});

  @override
  State<ContainerOrder> createState() => _ContainerOrderState();
}

class _ContainerOrderState extends State<ContainerOrder> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width >= 800 ? 700 : 500,
      width: size.width >= 1100 ? 650 : size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: size.width >= 300 ? 70 : 40,
              decoration: const BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  'Pathology tests',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: size.width >= 300 ? 23 : 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            Column(
              children: widget.cartItems.map((item) {
                return CartContainer(
                  testName: item['testName'],
                  actualMoney: item['actualMoney'],
                  discountMoney: item['discountPrice'],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class CartContainer extends StatefulWidget {
  final String testName;
  final String actualMoney;
  final String discountMoney;
  const CartContainer(
      {required this.actualMoney,
      required this.discountMoney,
      required this.testName,
      super.key});

  @override
  State<CartContainer> createState() => _CartContainerState();
}

class _CartContainerState extends State<CartContainer> {
  void removeItemFromDatabase() {
    DatabaseReference cartRef =
        // ignore: deprecated_member_use
        FirebaseDatabase.instance.reference().child('cart');

    cartRef.once().then((DatabaseEvent event) {
      if (event.snapshot.exists) {
        final dynamic snapshotValue = event.snapshot.value;

        if (snapshotValue is Map<dynamic, dynamic>) {
          Map<dynamic, dynamic> data = snapshotValue;

          String? keyToRemove;
          data.forEach((key, value) {
            if (value['testName'] == widget.testName) {
              keyToRemove = key;
              return;
            }
          });

          if (keyToRemove != null) {
            cartRef.child(keyToRemove!).remove().then((_) {
              print("Item removed from database");
              // Notify the Cart page to refresh
              // Navigator.of(context).pop(true);
            }).catchError((error) {
              print("Failed to remove item: $error");
            });
          } else {
            print("Item not found in database");
          }
        } else {
          print("Snapshot value is not a Map");
        }
      } else {
        print("Snapshot does not exist");
      }
    }).catchError((error) {
      print("Error fetching data: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width >= 1000 ? 160 : 220,
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.testName,
                style: GoogleFonts.inter(
                  color: const Color.fromRGBO(15, 23, 42, 1),
                  fontSize: size.width >= 800
                      ? 22
                      : size.width >= 300 && size.width < 800
                          ? 17
                          : 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '\u{20B9} ${widget.discountMoney}/-',
                style: GoogleFonts.inter(
                  color: mainColor,
                  fontSize: size.width >= 800 ? 22 : 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerRight,
            child: TextWithLineOver(text: widget.actualMoney),
          ),
          // const SizedBox(
          //   height: 12,
          // ),
          size.width >= 1000
              ? Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        removeItemFromDatabase();
                      },
                      child: Container(
                        width: size.width >= 800 ? 140 : 160,
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: mainColor, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.delete,
                              color: mainColor,
                              size: 30,
                            ),
                            Text(
                              'Remove',
                              style: GoogleFonts.inter(
                                color: mainColor,
                                fontSize: size.width >= 800 ? 22 : 17,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 50,
                      width: size.width >= 800
                          ? 350
                          : size.width >= 400 && size.width < 800
                              ? 400
                              : 350,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: mainColor, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.upload,
                            color: mainColor,
                            size: size.width >= 400 ? 30 : 20,
                          ),
                          Text(
                            size.width <= 300
                                ? 'Upload prescription'
                                : 'Upload prescription (optional)',
                            style: GoogleFonts.inter(
                              color: mainColor,
                              fontSize: size.width >= 800
                                  ? 18
                                  : size.width >= 400 && size.width < 800
                                      ? 15
                                      : 10,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        removeItemFromDatabase();
                      },
                      child: Container(
                        width: size.width >= 300 ? 200 : 150,
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: mainColor, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.delete,
                              color: mainColor,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Remove',
                              style: GoogleFonts.inter(
                                color: mainColor,
                                fontSize: size.width >= 800 ? 22 : 17,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: 350,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: mainColor, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.upload,
                            color: mainColor,
                            size: size.width >= 500 ? 30 : 20,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            size.width <= 300
                                ? 'Upload prescription'
                                : 'Upload prescription (optional)',
                            style: GoogleFonts.inter(
                              color: mainColor,
                              fontSize: size.width >= 800
                                  ? 18
                                  : size.width >= 500 && size.width < 800
                                      ? 15
                                      : 11,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            color: mainColor,
            height: 2,
          )
        ],
      ),
    );
  }
}
