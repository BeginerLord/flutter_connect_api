import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;

//constructor 
  const CustomTextField({super.key, 
    required this.controller,
    required this.labelText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
   return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.blueGrey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.red),
      ),
    ),
    obscureText: obscureText,
   );
  }
}
