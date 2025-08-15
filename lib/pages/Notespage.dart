import 'package:flutter/material.dart';
import 'package:notes_app/widgets/Noteitem.dart';
import 'package:notes_app/widgets/customicon.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notes',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [CustomIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: NoteItem()),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.tealAccent,
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
