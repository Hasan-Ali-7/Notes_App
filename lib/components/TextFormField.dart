import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants.dart';
import '../logic/cubits/app_cubit.dart';

class CTextFormField extends StatelessWidget {
  const CTextFormField(
      {super.key,
      required this.hint,
      required this.onSaved,
      required this.minLines,
      required this.maxLines});
  final String hint;
  final int maxLines;
  final int minLines;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kColor,
      cursorHeight: 25,
      textInputAction: TextInputAction.next, 
      onSaved: onSaved,
      onFieldSubmitted: onSaved,
      onChanged: onSaved,
      validator: (value){
        if (value?.isEmpty ?? true) {
          return '$hint is required to add task';
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(7),
            borderSide: BorderSide(
              color:  BlocProvider.of<App_Cubit>(context).isDark
                  ? Colors.white
                  : Colors.black,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(7),
            borderSide: BorderSide(
              color: kColor,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(7),
            borderSide: BorderSide(
              color: kColor,
            )),
        focusColor: kColor,
        hoverColor: kColor,
        hintText: hint,
        hintStyle: TextStyle(
            color: kColor,
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      style: const TextStyle(
        fontSize: 24,
      ),
      maxLines: maxLines,
      minLines: minLines,
    );
  }
}
