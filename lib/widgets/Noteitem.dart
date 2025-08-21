import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notecubit/notescubit.dart';
import 'package:notes_app/models/notemodel.dart';
import 'package:notes_app/pages/Editnotepage.dart';

class NoteItem extends StatelessWidget {
  final NoteModel thenote;
  const NoteItem({super.key, required this.thenote});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditNotePage(thenote: thenote),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(thenote.theColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(
                thenote.title,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(thenote.content, style: TextStyle(fontSize: 18)),
              trailing: IconButton(
                onPressed: () async {
                  await thenote.delete();

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Note deleted successfully!')),
                  );
                  BlocProvider.of<NotesCubit>(context).getAllNotes();
                },
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
                child: Text(thenote.date),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
