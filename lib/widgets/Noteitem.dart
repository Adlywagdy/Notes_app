import 'package:flutter/material.dart';
import 'package:notes_app/pages/Editnotepage.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditNotePage()),
        );
      },
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(
                'Note Title',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Note Content', style: TextStyle(fontSize: 18)),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete, size: 30),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text('Note date'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
