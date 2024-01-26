// ignore_for_file: avoid_print

// import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:frontend/widgets/constants.dart';
import 'package:frontend/widgets/textlineover.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerOrder extends StatefulWidget {
  final String testName;
  final String actualMoney;
  final String discountMoney;
  // final VoidCallback? onItemRemoved;

  const ContainerOrder(
      {required this.discountMoney,
      // this.onItemRemoved,
      required this.testName,
      required this.actualMoney,
      super.key});

  @override
  State<ContainerOrder> createState() => _ContainerOrderState();
}

class _ContainerOrderState extends State<ContainerOrder> {
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
      height: 300,
      width: size.width >= 700 ? 400 : 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 50,
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
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
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
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '\u{20B9} ${widget.discountMoney}/-',
                      style: GoogleFonts.inter(
                        color: mainColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextWithLineOver(text: widget.actualMoney),
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {
                    removeItemFromDatabase();
                  },
                  child: Container(
                    width: 170,
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
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  height: 50,
                  width: 400,
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
                          fontSize: size.width >= 300 ? 16 : 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
