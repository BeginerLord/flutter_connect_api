 import 'package:flutter/material.dart';

class ButtonStyles{
  static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.blue, // Color de fondo
    foregroundColor: Colors.white, // Color del texto
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    textStyle: const TextStyle(fontSize: 16),
    minimumSize: const Size(300, 50),
    maximumSize: const Size(300, 50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    )
    
  );
  static final TextStyle buttonTextStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
 }