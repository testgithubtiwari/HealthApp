import 'package:flutter/material.dart';
import 'package:frontend/data/packagedata.dart';
import 'package:frontend/data/testdata.dart';
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
  const HomePage({super.key});

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
      body: Container(
        height: size.height,
        padding: EdgeInsets.fromLTRB(
            size.width * 0.05, size.width * 0.06, size.width * 0.05, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              size.width >= 700
                  ? const CustomAppBar()
                  : const CustomPhoneAppBar(),
              const Divider(
                height: 1,
                color: Colors.grey,
              ),
              SizedBox(
                height: size.width * 0.03,
              ),
              const PopularLabTests(),
              SizedBox(
                height: size.width * 0.05,
              ),
              Container(
                padding: EdgeInsets.all(size.width * 0.02),
                child: Wrap(
                  spacing: size.width * 0.035,
                  runSpacing: size.width * 0.025,
                  alignment: populatedList.length == 1
                      ? WrapAlignment.center
                      : WrapAlignment.start,
                  children: populatedList.map((test) {
                    return populatedList.length == 1
                        ? Center(
                            child: CustomTestsContainer(
                              testName: test.testName,
                              testCount: test.testCount,
                              reportAvailable: test.reportAvailable,
                              actualMoney: test.actualMoney,
                              discountPrice: test.discountPrice,
                            ),
                          )
                        : CustomTestsContainer(
                            testName: test.testName,
                            testCount: test.testCount,
                            reportAvailable: test.reportAvailable,
                            actualMoney: test.actualMoney,
                            discountPrice: test.discountPrice,
                          );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: size.width * 0.03,
              ),
              const PopularPackage(),
              SizedBox(
                height: size.width * 0.05,
              ),
              Container(
                padding: EdgeInsets.all(size.width * 0.02),
                child: Wrap(
                  spacing: size.width * 0.035,
                  runSpacing: size.width * 0.025,
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
              SizedBox(
                height: size.width * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTestsContainer extends StatefulWidget {
  final String testName;
  final String testCount;
  final String reportAvailable;
  final String discountPrice;
  final String actualMoney;

  const CustomTestsContainer(
      {required this.discountPrice,
      required this.reportAvailable,
      required this.testCount,
      required this.testName,
      required this.actualMoney,
      super.key});

  @override
  State<CustomTestsContainer> createState() => _CustomTestContainerState();
}

class _CustomTestContainerState extends State<CustomTestsContainer> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      // margin: EdgeInsets.fromLTRB(0, 0, 0, size.width * 0.02),
      width: 250,
      height: size.height * 0.40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Column(
        children: [
          Container(
            // padding: EdgeInsets.all(),
            height: size.height * 0.05,
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
                      width: 35,
                      child: Image(
                        image: AssetImage('assets/images/badge.png'),
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
                // SizedBox(
                //   height: size.width * 0.01,
                // ),
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
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 50,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: mainColor),
                  child: const Center(
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
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
