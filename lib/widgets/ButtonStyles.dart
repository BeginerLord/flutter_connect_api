 import 'package:flutter/material.dart';

class ButtonStyles{
  static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.blue, // Color de fondo
    foregroundColor: Colors.white, // Color del texto
    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    textStyle: TextStyle(fontSize: 16),
    
  );
  static final TextStyle buttonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
 }