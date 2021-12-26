import 'package:flutter/material.dart';

class ButtonRegularWidget extends StatelessWidget {
  final String text;
  final bool isEnabled;
  final VoidCallback onPressed;

  const ButtonRegularWidget({
    Key? key,
    required this.text,
    this.isEnabled = true,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: isEnabled ? Color(0xFF820ad1) : Colors.black12,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ],
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(20),
        primary: Colors.white,
        textStyle: TextStyle(),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black26,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
