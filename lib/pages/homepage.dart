import 'package:flutter/material.dart';
import 'package:frontend/data/packagedata.dart';
import 'package:frontend/data/testdata.dart';
import 'package:frontend/models/package_model.dart';
import 'package:frontend/models/test_model.dart';
import 'package:frontend/widgets/cartprovider.dart';
import 'package:frontend/widgets/customappbar.dart';
import 'package:frontend/widgets/customappbarphone.dart';
import 'package:frontend/widgets/custompackagescontaner.dart';
import 'package:frontend/widgets/customtestscontainer.dart';
import 'package:frontend/widgets/footer.dart';
import 'package:frontend/widgets/popularlabtests.dart';
import 'package:frontend/widgets/popularpackages.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Consumer<CartProvider>(
                        builder: (context, cartProvider, _) => Container(
                          child: size.width >= 900
                              ? CustomAppBar(
                                  cartItemCount: cartProvider.cartItemCount,
                                )
                              : CustomPhoneAppBar(
                                  cartItemCount: cartProvider.cartItemCount,
                                ),
                        ),
                      ),
                      // const SizedBox(height: 40),
                      const PopularLabTests(),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 20,
                          children: populatedList.map((test) {
                            return CustomTestsContainer(
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
                      // Your footer widget
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              size.width >= 1100 ? const Footer() : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
