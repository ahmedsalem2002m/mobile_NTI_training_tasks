import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



Future<String?> pickDeadlineDateTime(BuildContext context) async {
  FocusScope.of(context).unfocus();

  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2100),
  );

  if (pickedDate != null) {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      final DateTime fullDateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );

      final formatted = DateFormat('d MMMM, yyyy      h:mm a')
          .format(fullDateTime)
          .toLowerCase();

      return formatted;
    }
  }
  return null;
}

