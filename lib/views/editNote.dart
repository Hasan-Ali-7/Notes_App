import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/cubits/app_cubit.dart';
import '../logic/hive/noteModel.dart';
import '../components/costumAppBar.dart';
import '../components/TextFormField.dart';

class Edit extends StatefulWidget {
  const Edit({super.key, required this.note});
  final NoteModel note;

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {

  String? title, content;
  int? colorIndex;

  @override
  Widget build(BuildContext context) {

    colorIndex = widget.note.colorIndex;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CostumeAppBar(
              title: 'Edit', 
              icon: Icons.done, 
              iconPressed: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.content = content ?? widget.note.content;
                  widget.note.save();
                  BlocProvider.of<App_Cubit>(context).fetchNote();
                  Navigator.pop(context);
              }
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: [
                  CTextFormField(
                      hint: widget.note.title,
                      onSaved: (value) {
                        title = value;
                      },
                      maxLines: 1,
                      minLines: 1),
                  const SizedBox(height: 15,),
                  CTextFormField(
                      hint: widget.note.content,
                      onSaved: (value) {
                        content = value;
                      },
                      maxLines: 100,
                      minLines: 10),
                  const SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            widget.note.colorIndex = 0;
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
                            widget.note.colorIndex = 1;
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
                            widget.note.colorIndex = 2;
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
                            widget.note.colorIndex = 3;
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
                            widget.note.colorIndex = 4;
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
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}