import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../components/constants.dart';
import '../hive/hive.dart';
import '../hive/noteModel.dart';
import 'app_states.dart';

class App_Cubit extends Cubit<App_State> {
  App_Cubit() : super(AppInitialState());

  bool isDark = true;
  void changeAppMode() {
    isDark = !isDark;
    emit(ChangeAppModeState());
    HiveMethods().put('darkMode', isDark);
  }

  List<Color> primaryColors = [
    const Color.fromARGB(255, 251, 188, 93),
    const Color.fromARGB(255, 142, 255, 146),
    const Color.fromARGB(255, 72, 222, 255),
    const Color.fromRGBO(83, 169, 255, 1),
    const Color.fromRGBO(255, 111, 243, 1),
  ];


  List<NoteModel>? notes;
  fetchNote() {
    emit(ShowNoteLoading());
    var noteBox = Hive.box<NoteModel>(kNotesBox);
    notes = noteBox.values.toList();
    emit(ShowNoteSuccess());
  }

}
