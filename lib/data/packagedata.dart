import 'package:frontend/models/package_model.dart';

final List<Package> packageList = [
  Package(
    testList: [
      'Blood Glucose Fasting',
      'Liver function test',
    ],
    packageName: 'Full Body checkup',
    testCount: '92',
    image: 'assets/images/012-medicine.png',
    // reportAvailable: '24',
    actualMoney: '2000',
    // discountPrice: '1200',
  ),
  Package(
    testList: [
      'Troponin',
      'Cholestrol',
    ],
    image: 'assets/images/017-heart.png',
    packageName: 'Heart Care',
    testCount: '10',
    // reportAvailable: '24',
    actualMoney: '1500',
    // discountPrice: '1200',
  ),
  Package(
    testList: [
      'Blood Glucose Fasting',
      'Lipid profile',
    ],
    image: 'assets/images/005-syringe.png',
    packageName: 'Diabetics Care',
    testCount: '20',
    // reportAvailable: '24',
    actualMoney: '999',
    // discountPrice: '1200',
  ),
];
