abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {}

class AddNoteFialed extends AddNoteState {
  final String errorMessage;
  AddNoteFialed(this.errorMessage);
}
