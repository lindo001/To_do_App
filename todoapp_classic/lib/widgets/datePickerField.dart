import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../utils/colors.dart';

class DatePickerField extends StatelessWidget {
  final TextEditingController inputFieldController;
  final String hintText;
  final Function(String) onDateSelected; // Callback function
  DatePickerField({Key? key, required this.inputFieldController, required this.hintText, required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () async {
        String? date = await _datePicker(context);
        if (date != null) {
          onDateSelected(date); 
        }
      },
      controller: inputFieldController,
      decoration: InputDecoration(
        filled: true,
        fillColor: lightGray,
        suffixIcon: Icon(Icons.calendar_month),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
        hintText: hintText,
      ),
      readOnly: true,
    );
  }

  Future<String?> _datePicker(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      return picked.toString().split(" ")[0];
    }
    return null;
  }
}
