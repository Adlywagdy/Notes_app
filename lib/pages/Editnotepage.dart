import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/colorslist.dart';
import 'package:notes_app/cubits/notecubit/notescubit.dart';
import 'package:notes_app/models/notemodel.dart';
import 'package:notes_app/widgets/coloritem.dart';
import 'package:notes_app/widgets/customicon.dart';
import 'package:notes_app/widgets/customtextformfield.dart';

class EditNotePage extends StatefulWidget {
  final NoteModel thenote;
  const EditNotePage({super.key, required this.thenote});

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  late int currentindex;
  @override
  void initState() {
    super.initState();
    currentindex = colors.indexOf(widget.thenote.theColor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Note',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          CustomIcon(
            icon: Icons.check,
            onPressed: () async {
              await widget.thenote.save();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Note edited successfully!')),
              );
              BlocProvider.of<NotesCubit>(context).getAllNotes();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Customtextformfield(
              hint: widget.thenote.title,
              labelText: 'Note Title',
              onChanged: (title) {
                widget.thenote.title = title;
              },
            ),
            SizedBox(height: 16),
            Customtextformfield(
              hint: widget.thenote.content,
              labelText: 'Note Content',
              maxLines: 5,
              onChanged: (content) {
                widget.thenote.content = content;
              },
            ),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: colors.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentindex = index;
                        widget.thenote.theColor = colors[index];
                      });
                    },
                    child: Coloritem(
                      backgroundColor: colors[index],
                      istapped: currentindex == index ? true : false,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
