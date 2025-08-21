import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/cubits/addnotescubit/addnotesstates.dart';
import 'package:notes_app/models/notemodel.dart';

class Addnotescubit extends Cubit<Addnotesstates> {
  Addnotescubit() : super(AddnotesInitial());

  void addNoteToHive(NoteModel newNote) async {
    try {
      emit(AddnotesLoading());

      await Hive.box<NoteModel>('mynotes').add(newNote);

      emit(AddnotesSuccess());
    } catch (e) {
      emit(AddnotesFailure(e.toString()));
    }
  }
}
