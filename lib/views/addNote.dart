import 'package:flutter/material.dart';
import '../components/addNoteForm.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
        top:15.0,
        left: 15,
        right: 15,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child:  const SingleChildScrollView(
        child: AddNoteForm()
      ),
    );
  }
}
