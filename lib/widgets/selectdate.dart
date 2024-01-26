import 'package:flutter/material.dart';
import 'package:frontend/widgets/constants.dart';

class SelectDate extends StatefulWidget {
  final void Function(DateTime?, TimeOfDay?) onDateTimeSelected;

  const SelectDate({Key? key, required this.onDateTimeSelected})
      : super(key: key);

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  final TextEditingController _textEditingController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        _textEditingController.text =
            '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
      });

      widget.onDateTimeSelected(
          selectedDate, selectedTime); // Call callback function
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
        if (selectedDate != null) {
          _textEditingController.text +=
              ' ${pickedTime.hour}:${pickedTime.minute}';
        }
      });

      widget.onDateTimeSelected(
          selectedDate, selectedTime); // Call callback function
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => _selectDate(context),
            icon: Icon(
              Icons.calendar_today,
              color: Colors.grey,
              size: size.width >= 800
                  ? 30
                  : size.width >= 400 && size.width < 800
                      ? 20
                      : 16,
            ),
          ),
          IconButton(
            onPressed: () => _selectTime(context),
            icon: Icon(
              Icons.access_time,
              color: Colors.grey,
              size: size.width >= 800
                  ? 30
                  : size.width >= 400 && size.width < 800
                      ? 20
                      : 16,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              style: const TextStyle(
                color: mainColor,
                fontWeight: FontWeight.w800,
              ),
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: size.width >= 300
                    ? 'please select date and time'
                    : 'Date & Time',
                labelStyle: TextStyle(
                  color: mainColor,
                  fontSize: size.width >= 800
                      ? 20
                      : size.width >= 400 && size.width < 800
                          ? 17
                          : 14,
                ),
                border: InputBorder.none,
              ),
              readOnly: true,
            ),
          ),
        ],
      ),
    );
  }
}
