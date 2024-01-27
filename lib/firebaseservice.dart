import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  final DatabaseReference _cartReference =
      // ignore: deprecated_member_use
      FirebaseDatabase.instance.reference().child('cart');

  Future<int> getCartItemCount() async {
    try {
      // Fetch the database event
      DatabaseEvent event = await _cartReference.once();

      // Extract DataSnapshot from DatabaseEvent
      DataSnapshot snapshot = event.snapshot;

      // Extract the value from the DataSnapshot
      Map<dynamic, dynamic>? cartItems =
          snapshot.value as Map<dynamic, dynamic>?;

      if (cartItems != null) {
        // print(cartItems.length);
        return cartItems.length;
      } else {
        return 0;
      }
    } catch (error) {
      // Handle error
      // ignore: avoid_print
      print('Error getting cart item count: $error');
      return 0;
    }
  }

  Future<bool> isItemInCart(int id) async {
    try {
      DatabaseEvent event = await _cartReference
          .orderByChild('id')
          .equalTo(id)
          .limitToFirst(1) // Limit the query to first result
          .once();

      // Extract DataSnapshot from DatabaseEvent
      DataSnapshot snapshot = event.snapshot;

      return snapshot.value != null;
    } catch (error) {
      // ignore: avoid_print
      print('Error checking item in cart: $error');
      return false; // Return false in case of any error
    }
  }

  Future<void> addToCart(int id, String testName, String testCount,
      String reportAvailable, String discountPrice, String actualMoney) async {
    try {
      // Check if the item already exists in the cart
      DataSnapshot snapshot =
          (await _cartReference.orderByChild('id').equalTo(id).once()).snapshot;

      if (snapshot.value != null) {
        // Item with the same ID already exists in the cart
        // Handle the situation, e.g., show a message to the user
        // ignore: avoid_print
        print('Item with ID $id already exists in the cart.');
      } else {
        // Item doesn't exist, so add it to the cart

        await _cartReference.push().set({
          'id': id,
          'testName': testName,
          'testCount': testCount,
          'reportAvailable': reportAvailable,
          'discountPrice': discountPrice,
          'actualMoney': actualMoney,
        });

        // ignore: avoid_print
        print('Data added to cart.');
      }
    } catch (error) {
      // Handle errors, e.g., show a snackbar or log the error
      // ignore: avoid_print
      print('Error adding to cart: $error');
    }
  }
}
