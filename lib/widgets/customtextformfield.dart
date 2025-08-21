import 'package:flutter/material.dart';

class Customtextformfield extends StatelessWidget {
  final String labelText;
  final void Function(String?)? onSaved;
  final int? maxLines;
  final String? hint;
  final void Function(String)? onChanged;
  const Customtextformfield({
    super.key,
    required this.labelText,
    this.hint,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter this field';
        }
        return null;
      },

      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.tealAccent),
        hint: Text(hint ?? ''),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.tealAccent),
        ),
      ),
    );
  }
}
