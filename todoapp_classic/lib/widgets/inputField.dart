

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/colors.dart';

class inputField extends StatelessWidget {
  final inputFieldController;
  final hintText;
  inputField({super.key,required TextEditingController this.inputFieldController, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      controller: inputFieldController,
      decoration: InputDecoration(
        filled: true,
        fillColor: lightGray,
        suffixIcon: Icon(Icons.calendar_month),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: Colors.transparent)),
        hintText: hintText
      ),
    );
  }
}