import 'package:flutter/material.dart';
import 'package:frontend/pages/homepage.dart';
import 'package:frontend/widgets/constants.dart';
import 'package:frontend/widgets/footer.dart';
import 'package:frontend/widgets/sucessappbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Success extends StatefulWidget {
  final DateTime? choosenDate;
  final TimeOfDay? choosenTime;
  const Success(
      {required this.choosenDate, required this.choosenTime, super.key});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    DateFormat dateFormat = DateFormat('dd-MM-yyyy');
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SucessAppBar(),
                    SizedBox(
                      height: size.width >= 1000 ? 40 : 80,
                    ),
                    Container(
                      height: size.width >= 400 ? 500 : 350,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 14,
                          ),
                          Container(
                            padding: const EdgeInsets.all(25),
                            height: size.width >= 400 ? 250 : 150,
                            width: size.width >= 400 ? 250 : 150,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/success.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Lab tests have been scheduled successfully, You will receive a mail of the same. ',
                            style: GoogleFonts.inter(
                              color: const Color.fromARGB(172, 0, 0, 0),
                              fontSize: size.width >= 1000 ? 24 : 15,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Date: ${widget.choosenDate != null ? dateFormat.format(widget.choosenDate!) : 'Not selected'}',
                                style: GoogleFonts.inter(
                                  color: Colors.grey,
                                  fontSize: size.width >= 1000
                                      ? 20
                                      : size.width >= 300 && size.width < 1000
                                          ? 13
                                          : 10,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '|',
                                style: GoogleFonts.inter(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Time: ${widget.choosenTime != null ? widget.choosenTime!.format(context) : 'Not selected'}',
                                style: GoogleFonts.inter(
                                  color: Colors.grey,
                                  fontSize: size.width >= 1000
                                      ? 20
                                      : size.width >= 300 && size.width < 1000
                                          ? 13
                                          : 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      child: Container(
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: mainColor,
                        ),
                        child: Center(
                          child: Text(
                            'Back to Home',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            size.width >= 1100 ? const Footer() : Container(),
          ],
        ),
      ),
    );
  }
}

class ShowDateAndTime extends StatefulWidget {
  const ShowDateAndTime({super.key});

  @override
  State<ShowDateAndTime> createState() => _ShowDateAndTimeState();
}

class _ShowDateAndTimeState extends State<ShowDateAndTime> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [],
    );
  }
}
