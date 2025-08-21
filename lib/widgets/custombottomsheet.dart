import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/addnotescubit/addnotescubit.dart';
import 'package:notes_app/cubits/addnotescubit/addnotesstates.dart';
import 'package:notes_app/widgets/noteform.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});
  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

bool isLoading = false;

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: BlocListener<Addnotescubit, Addnotesstates>(
        listener: (context, state) {
          if (state is AddnotesSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Note added successfully!')));

            Navigator.pop(context);
          } else if (state is AddnotesFailure) {
            log('Error: ${state.errorMessage}');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed to add note: ${state.errorMessage}'),
              ),
            );
          } else if (state is AddnotesLoading) {
            setState(() {
              isLoading = true;
            });
          }
          setState(() {
            isLoading = false;
          });
        },
        child: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 16,
          ),
          child: NoteForm(),
        ),
      ),
    );
  }
}
