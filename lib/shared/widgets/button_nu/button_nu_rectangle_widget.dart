import 'package:flutter/material.dart';

class ButtonNuRectangleWidget extends StatelessWidget {
  final String text;
  final bool isEnabled;
  final VoidCallback onPressed;

  const ButtonNuRectangleWidget({
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
              color: isEnabled ? Color(0xFF820ad1) : Colors.black54,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ],
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(20),
        primary: Colors.black87,
        textStyle: TextStyle(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          side: BorderSide(
            color: isEnabled ? Color(0xFF820ad1) : Colors.black54,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
