import 'package:flutter/material.dart';
import 'package:notes_app/widgets/customelevatedbutton.dart';
import 'package:notes_app/widgets/customtextformfield.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Customtextformfield(labelText: 'Note Title'),
              SizedBox(height: 16),
              Customtextformfield(labelText: 'Note Content', maxLines: 5),
              SizedBox(height: 64),
              CustomElevatedButton(
                formKey: formKey,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // Handle adding the note
                  }
                },
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
