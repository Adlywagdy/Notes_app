import 'package:flutter/material.dart';
import 'package:notes_app/widgets/customelevatedbutton.dart';
import 'package:notes_app/widgets/customtextformfield.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Spacer(flex: 1),
            Customtextformfield(labelText: 'Note Title'),
            Spacer(flex: 1),
            Customtextformfield(
              labelText: 'Note Content',
              verticalPadding: 50.0,
            ),
            Spacer(flex: 5),
            CustomElevatedButton(
              formKey: formKey,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // Handle adding the note
                }
              },
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
