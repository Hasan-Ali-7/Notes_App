
abstract class App_State {}

class AppInitialState extends App_State {}

class ChangeAppModeState extends App_State {}

class ShowNoteLoading extends App_State {}

class ShowNoteSuccess extends App_State {}

class ShowNoteFialed extends App_State {
  final String errorMessage;
  ShowNoteFialed(this.errorMessage);
}