import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../logic/cubits/addNote_cubit.dart';
import '../logic/cubits/app_cubit.dart';
import '../logic/hive/noteModel.dart';
import '../logic/cubits/addNote_states.dart';
import 'TextFormField.dart';
import 'constants.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() =>
      _AddNoteFormState();
}

class _AddNoteFormState  extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode =  AutovalidateMode.disabled;
  String? title, content;
  int colorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {  
          if (state is AddNoteSuccess) {
            Navigator.pop(context);
          }
          if (state is AddNoteFialed) {
            debugPrint('failed state is ${state.errorMessage}');
          }},
        builder: (context, state) => AbsorbPointer(
          absorbing: state is AddNoteLoading ? true : false,
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                CTextFormField(
                    hint: 'Title',
                    onSaved: (value) {
                      title = value;
                    },
                    maxLines: 1,
                    minLines: 1),
                const SizedBox( height: 15, ),
                CTextFormField(
                    hint: 'Content',
                    onSaved: (value) {
                      content = value;
                    },
                    maxLines: 25,
                    minLines: 5),
                const SizedBox( height: 15, ),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          colorIndex = 0;
                          setState(() {
                          
                          });
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: BlocProvider.of<App_Cubit>(context).primaryColors[0],
                            borderRadius: BorderRadius.circular(50)),
                          child: colorIndex == 0
                          ? const Icon(
                            Icons.done,
                            color: Colors.black,
                            size: 40,
                          )
                          : null,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          colorIndex = 1;
                          setState(() {
                          
                          });
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: BlocProvider.of<App_Cubit>(context).primaryColors[1],
                            borderRadius: BorderRadius.circular(50)),
                          child: colorIndex == 1
                          ? const Icon(
                            Icons.done,
                            color: Colors.black,
                            size: 40,
                          )
                          : null,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          colorIndex = 2;
                          setState(() {
                          
                          }); 
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: BlocProvider.of<App_Cubit>(context).primaryColors[2],
                            borderRadius: BorderRadius.circular(50)),
                          child: colorIndex == 2
                          ? const Icon(
                            Icons.done,
                            color: Colors.black,
                            size: 40,
                          )
                          : null,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          colorIndex = 3;
                          setState(() {
                          
                          });
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: BlocProvider.of<App_Cubit>(context).primaryColors[3],
                            borderRadius: BorderRadius.circular(50)),
                          child: colorIndex == 3
                          ? const Icon(
                              Icons.done,
                              color: Colors.black,
                              size: 40,
                            )
                          : null,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          colorIndex = 4;
                          setState(() {
                          
                          });
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: BlocProvider.of<App_Cubit>(context).primaryColors[4],
                            borderRadius: BorderRadius.circular(50)),
                          child: colorIndex == 4
                          ? const Icon(
                              Icons.done,
                              color: Colors.black,
                              size: 40,
                            )
                          : null,
                        ),
                      ),
                      ],
                  ),
                ),
                const SizedBox( height: 15, ),
                MaterialButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    
                      NoteModel noteModel = NoteModel(
                        title: title!, 
                        content: content!, 
                        date:  DateFormat('dd - MMM - yyyy     HH:mm:ss').format(DateTime.now()).toString(),
                        colorIndex: colorIndex,
                      );
                      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                    }else{
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {
                        
                      });
                    }
                  },
                  color: kColor,
                  minWidth: double.infinity,
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)
                  ),
                  child : state is AddNoteLoading ? 
                  CircularProgressIndicator(
                    color: Colors.redAccent[400],
                  )
                  : const Text(
                    'Add to notes',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox( height: 15, ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
