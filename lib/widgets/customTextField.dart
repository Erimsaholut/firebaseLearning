import 'package:flutter/material.dart';

import 'customInputDecoration.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.information, required this.email});

  String? email,information;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Bilgileri Eksiksiz Doldurunuz";
        }
        return null;
      },
      onSaved: (value) {
        email = value!;
      },
      style: const TextStyle(color: Colors.white),
      decoration: customInputDecoration(information!),
    );
  }
}
