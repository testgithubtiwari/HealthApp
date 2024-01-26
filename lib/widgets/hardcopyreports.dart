import 'package:flutter/material.dart';
import 'package:frontend/widgets/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class HardCopyReports extends StatefulWidget {
  const HardCopyReports({super.key});

  @override
  State<HardCopyReports> createState() => _HardCopyReportsState();
}

class _HardCopyReportsState extends State<HardCopyReports> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 180,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
                },
                activeColor: mainColor,
              ),
              const Text(
                'Hard Copy Reports',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(45, 0, 5, 0),
            // padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Reports will be delivered within 3-4 working days. Hard copy charges are non-refundable once the reports have been dispatched.',
                  style: GoogleFonts.inter(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '\u{20B9} 150 per person',
                  style: GoogleFonts.inter(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
