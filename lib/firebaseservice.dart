import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  final DatabaseReference _cartReference =
      // ignore: deprecated_member_use
      FirebaseDatabase.instance.reference().child('cart');

  Future<void> addToCart(int id, String testName, String testCount,
      String reportAvailable, String discountPrice, String actualMoney) async {
    try {
      await _cartReference.push().set({
        'id': id,
        'testName': testName,
        'testCount': testCount,
        'reportAvailable': reportAvailable,
        'discountPrice': discountPrice,
        'actualMoney': actualMoney,
      });
      // ignore: avoid_print
      print('data added');
    } catch (error) {
      // Handle errors, e.g., show a snackbar or log the error
      // ignore: avoid_print
      print('Error adding to cart: $error');
    }
  }
}
