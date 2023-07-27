import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SimpleObserver implements BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
  }

  @override
  void onError(BlocBase bloc, Object error,
      StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('change is $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onChange
  }

  @override
  void onClose(BlocBase bloc) {
    // TODO: implement onClose
  }

  @override
  void onCreate(BlocBase bloc) {
    // TODO: implement onCreate
  }
}
