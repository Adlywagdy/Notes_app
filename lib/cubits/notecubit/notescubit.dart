import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/cubits/notecubit/notesstates.dart';
import 'package:notes_app/models/notemodel.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel> notes = [];
  void getAllNotes() {
    notes = Hive.box<NoteModel>('mynotes').values.toList();
    emit(NotesSuccess());
  }
}
