import 'package:api_to_connet/widgets/ButtonStyles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;
  const CustomButton({

    required this.onPressed,
    required this.text,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: isLoading ? null : onPressed,
    style: ButtonStyles.elevatedButtonStyle,
     child: isLoading 
     ? CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
     )
     : Text(text, style: ButtonStyles.buttonTextStyle),
     );
  }
}