// import 'dart:ffi';

class Package {
  final String packageName;
  final String testCount;
  final String image;
  final List testList;
  // final String reportAvailable;
  // final String discountPrice;
  final String actualMoney;

  Package({
    required this.testList,
    required this.image,
    required this.testCount,
    required this.packageName,
    // required this.reportAvailable,
    required this.actualMoney,
    // required this.discountPrice,
  });
}
