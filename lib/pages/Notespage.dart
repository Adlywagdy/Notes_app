import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/addnotescubit/addnotescubit.dart';
import 'package:notes_app/cubits/notecubit/notescubit.dart';
import 'package:notes_app/cubits/notecubit/notesstates.dart';

import 'package:notes_app/models/notemodel.dart';
import 'package:notes_app/widgets/Noteitem.dart';
import 'package:notes_app/widgets/custombottomsheet.dart';
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
        actions: [const CustomIcon(icon: Icons.search)],
      ),
      body: FetchNotes(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.tealAccent,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return BlocProvider(
                create: (context) => Addnotescubit(),
                child: CustomBottomSheet(),
              );
            },
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}

class FetchNotes extends StatefulWidget {
  const FetchNotes({super.key});

  @override
  State<FetchNotes> createState() => _FetchNotesState();
}

class _FetchNotesState extends State<FetchNotes> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotesCubit>(context).getAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes;

        if (notes.isEmpty) {
          return Center(
            child: Text(
              'No notes available',
              style: TextStyle(fontSize: 24, color: Colors.grey),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return NoteItem(thenote: notes[index]);
            },
          );
        }
      },
    );
  }
}
