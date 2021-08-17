import 'package:flutter/material.dart';

class InputSearchWidget extends StatelessWidget {
  final String title;
  final VoidCallback? suffixIconOnPressed;
  final VoidCallback? prefixIconOnPressed;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final void Function(String value)? onSubmitted;

  const InputSearchWidget({
    Key? key,
    required this.title,
    this.suffixIconOnPressed,
    this.prefixIconOnPressed,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        hintText: title,
        fillColor: Colors.grey[200],
        filled: true,
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(Icons.cancel_outlined),
                color: Colors.black54,
                onPressed: suffixIconOnPressed,
                splashColor: Colors.transparent,
              )
            : null,
        prefixIcon: prefixIcon != null
            ? IconButton(
                icon: Icon(
                  prefixIcon,
                ),
                color: Colors.black54,
                onPressed: prefixIconOnPressed,
                splashColor: Colors.transparent,
              )
            : null,
      ),
      controller: controller,
      onChanged: (value) {},
      onSubmitted: onSubmitted,
    );
  }
}
