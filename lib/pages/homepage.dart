import 'package:flutter/material.dart';
import 'package:frontend/data/packagedata.dart';
import 'package:frontend/data/testdata.dart';
import 'package:frontend/firebaseservice.dart';
import 'package:frontend/models/package_model.dart';
import 'package:frontend/models/test_model.dart';
import 'package:frontend/widgets/constants.dart';
import 'package:frontend/widgets/customappbar.dart';
import 'package:frontend/widgets/customappbarphone.dart';
import 'package:frontend/widgets/custompackagescontaner.dart';
import 'package:frontend/widgets/popularlabtests.dart';
import 'package:frontend/widgets/popularpackages.dart';
import 'package:frontend/widgets/textlineover.dart';
// import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Tests> populatedList = [];
  List<Package> populatedPackage = [];

  @override
  void initState() {
    populatedList = testsList;
    populatedPackage = packageList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                20,
                30,
                20,
                0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 90),
                  const PopularLabTests(),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 20,
                      children: populatedList.map((test) {
                        return CustomTestsContainer(
                          isInCart: true,
                          id: test.id,
                          testName: test.testName,
                          testCount: test.testCount,
                          reportAvailable: test.reportAvailable,
                          actualMoney: test.actualMoney,
                          discountPrice: test.discountPrice,
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const PopularPackage(),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 20,
                      children: populatedPackage.map((test) {
                        return CustomPackagesContainer(
                          image: test.image,
                          testList: test.testList,
                          packageName: test.packageName,
                          testCount: test.testCount,
                          actualMoney: test.actualMoney,
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                20,
                30,
                20,
                0,
              ),
              child: size.width >= 700
                  ? const CustomAppBar()
                  : const CustomPhoneAppBar(),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTestsContainer extends StatefulWidget {
  final bool isInCart;
  final int id;
  final String testName;
  final String testCount;
  final String reportAvailable;
  final String discountPrice;
  final String actualMoney;

  const CustomTestsContainer(
      {required this.discountPrice,
      required this.isInCart,
      required this.id,
      required this.reportAvailable,
      required this.testCount,
      required this.testName,
      required this.actualMoney,
      super.key});

  @override
  State<CustomTestsContainer> createState() => _CustomTestContainerState();
}

class _CustomTestContainerState extends State<CustomTestsContainer> {
  bool addedToCart = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      // margin: EdgeInsets.fromLTRB(0, 0, 0, size.width * 0.02),
      width: 280,
      height: size.width >= 700 ? 330 : 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Column(
        children: [
          Container(
            // padding: EdgeInsets.all(),
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
                GestureDetector(
                  onTap: () async {
                    FirebaseService firebaseService = FirebaseService();
                    await firebaseService.addToCart(
                      widget.id,
                      widget.testName,
                      widget.testCount,
                      widget.reportAvailable,
                      widget.discountPrice,
                      widget.actualMoney,
                    );
                    setState(() {
                      addedToCart = true;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 50,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: addedToCart
                          ? const Color.fromRGBO(22, 194, 213, 1)
                          : mainColor,
                    ),
                    child: Center(
                      child: Text(
                        addedToCart ? 'Added to Cart' : 'Add to Cart',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
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
                      border: Border.all(color: mainColor, width: 1)
                      // color: mainColor,
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
