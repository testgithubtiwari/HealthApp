import 'package:flutter/material.dart';
import 'package:frontend/firebaseservice.dart';
import 'package:frontend/widgets/cartprovider.dart';
import 'package:frontend/widgets/constants.dart';
import 'package:frontend/widgets/textlineover.dart';
import 'package:provider/provider.dart';

class CustomTestsContainer extends StatefulWidget {
  final int id;
  final String testName;
  final String testCount;
  final String reportAvailable;
  final String discountPrice;
  final String actualMoney;

  const CustomTestsContainer({
    required this.discountPrice,
    required this.id,
    required this.reportAvailable,
    required this.testCount,
    required this.testName,
    required this.actualMoney,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTestsContainer> createState() => _CustomTestContainerState();
}

class _CustomTestContainerState extends State<CustomTestsContainer> {
  bool alreadyInCart = false;
  bool addedToCart = false;
  late Future<bool> _isItemInCartFuture;

  @override
  void initState() {
    super.initState();
    _updateCartItemCount();
    _isItemInCartFuture = isItemInCart();
  }

  Future<void> _updateCartItemCount() async {
    FirebaseService firebaseService = FirebaseService();
    int itemCount = await firebaseService.getCartItemCount();

    // ignore: use_build_context_synchronously
    Provider.of<CartProvider>(context, listen: false)
        .updateCartItemCount(itemCount);
  }

  Future<bool> isItemInCart() async {
    FirebaseService firebaseService = FirebaseService();
    return firebaseService.isItemInCart(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: 280,
      height: size.width >= 700 ? 330 : 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Column(
        children: [
          Container(
            height: 45,
            decoration: const BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Center(
              child: Text(
                widget.testName,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Include ${widget.testCount} tests',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                      child: Image(
                        image: AssetImage('assets/images/badge.png'),
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
                Text(
                  'Get reports in ${widget.reportAvailable} hours',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      '\u{20B9} ${widget.discountPrice}',
                      style: const TextStyle(
                          color: mainColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    TextWithLineOver(text: widget.actualMoney),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                FutureBuilder<bool>(
                  future: _isItemInCartFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      bool isInCart = snapshot.data ?? false;
                      alreadyInCart = isInCart;
                      return GestureDetector(
                        onTap: () async {
                          await _updateCartItemCount();
                          setState(() {
                            addedToCart = true;
                          });
                          FirebaseService firebaseService = FirebaseService();
                          await firebaseService.addToCart(
                            widget.id,
                            widget.testName,
                            widget.testCount,
                            widget.reportAvailable,
                            widget.discountPrice,
                            widget.actualMoney,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 50,
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: addedToCart
                                ? const Color.fromRGBO(22, 194, 213, 1)
                                : alreadyInCart
                                    ? const Color.fromRGBO(22, 194, 213, 1)
                                    : mainColor,
                          ),
                          child: Center(
                            child: Text(
                              addedToCart
                                  ? 'Added to Cart'
                                  : alreadyInCart
                                      ? 'Already in Cart'
                                      : 'Add to Cart',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  height: 50,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: mainColor, width: 1),
                  ),
                  child: const Center(
                    child: Text(
                      'View Details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: mainColor,
                      ),
                    ),
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
