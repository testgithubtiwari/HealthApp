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
            icon: const Icon(
              Icons.calendar_today,
              color: mainColor,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () => _selectTime(context),
            icon: const Icon(
              Icons.access_time,
              color: mainColor,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
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
