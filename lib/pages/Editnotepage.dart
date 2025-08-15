import 'package:flutter/material.dart';
import 'package:notes_app/widgets/customicon.dart';
import 'package:notes_app/widgets/customtextformfield.dart';

class EditNotePage extends StatelessWidget {
  const EditNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Note',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [CustomIcon(icon: Icons.check)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Customtextformfield(labelText: 'Note Title'),
            SizedBox(height: 16),
            Customtextformfield(labelText: 'Note Content', maxLines: 5),
          ],
        ),
      ),
    );
  }
}
