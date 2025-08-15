import 'package:flutter/material.dart';

class Customtextformfield extends StatelessWidget {
  final String labelText;
  final double verticalPadding;
  final double horizontalPadding;
  final void Function(String)? onFieldSubmitted;

  const Customtextformfield({
    super.key,
    required this.labelText,
    this.verticalPadding = 0,
    this.horizontalPadding = 10,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter this field';
        }
        return null;
      },
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.tealAccent),

        contentPadding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.tealAccent),
        ),
      ),
    );
  }
}
