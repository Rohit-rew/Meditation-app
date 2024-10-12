import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For input formatters

class PhoneInputField extends StatelessWidget {
  final TextEditingController controller;
  const PhoneInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
          labelText: 'Phone Number',
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, // Allow digits only
          LengthLimitingTextInputFormatter(10), // Limit to 10 digits
        ],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your phone number';
          } else if (value.length != 10) {
            return 'Phone number must be exactly 10 digits';
          }
          return null;
        },
      ),
    );
  }
}
