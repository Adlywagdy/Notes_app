import 'package:flutter/material.dart';

class Customtextformfield extends StatelessWidget {
  final String labelText;

  final int? maxLines;
  final void Function(String)? onFieldSubmitted;

  const Customtextformfield({
    super.key,
    required this.labelText,

    this.onFieldSubmitted,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
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

        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.tealAccent),
        ),
      ),
    );
  }
}
