import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/colorslist.dart';
import 'package:notes_app/cubits/addnotescubit/addnotescubit.dart';
import 'package:notes_app/cubits/notecubit/notescubit.dart';
import 'package:notes_app/models/notemodel.dart';
import 'package:notes_app/widgets/coloritem.dart';

import 'package:notes_app/widgets/customelevatedbutton.dart';
import 'package:notes_app/widgets/customtextformfield.dart';

class NoteForm extends StatefulWidget {
  const NoteForm({super.key});

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? thetitle;
  String? thecontent;
  int theColor = 0xff607d8b;
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Customtextformfield(
              labelText: 'Note Title',
              onSaved: (title) {
                thetitle = title;
              },
            ),
            SizedBox(height: 16),
            Customtextformfield(
              labelText: 'Note Content',
              maxLines: 5,
              onSaved: (content) {
                thecontent = content;
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
                        theColor = colors[index];
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

            CustomElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  final NoteModel newNote = NoteModel(
                    title: thetitle!,
                    content: thecontent!,
                    date: DateTime.now().toString().substring(0, 16),
                    theColor: theColor,
                  );
                  BlocProvider.of<Addnotescubit>(
                    context,
                  ).addNoteToHive(newNote);
                  BlocProvider.of<NotesCubit>(context).getAllNotes();
                  log(Hive.box<NoteModel>('mynotes').values.toString());
                }
              },
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
