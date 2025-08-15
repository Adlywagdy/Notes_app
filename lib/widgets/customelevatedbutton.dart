import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final GlobalKey<FormState>? formKey;
  const CustomElevatedButton({
    super.key,
    this.formKey,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all(Size(double.maxFinite, 50)),
        shape: WidgetStateProperty.all(
          ContinuousRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
        backgroundColor: WidgetStateProperty.all(Colors.tealAccent),
      ),
      onPressed: onPressed,
      child: Text('Add Note', style: TextStyle(color: Colors.black)),
    );
  }
}
