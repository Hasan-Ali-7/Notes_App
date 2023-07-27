import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/cubits/app_cubit.dart';
import '../logic/hive/noteModel.dart';
import '../views/editNote.dart';

class Note extends StatelessWidget {
  const Note({super.key, 
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
          context: context, 
          builder: (BuildContext context) => Dialog(
            backgroundColor: BlocProvider.of<App_Cubit>(context).primaryColors[note.colorIndex],
            insetPadding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    note.title,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    note.content,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[900],
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    note.date,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[900],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      child: Container(
        decoration: BoxDecoration(
            color: BlocProvider.of<App_Cubit>(context).primaryColors[note.colorIndex],
            borderRadius: BorderRadius.circular(7)),
        width: double.infinity,
        margin: const EdgeInsetsDirectional.only(bottom: 5, top: 10, end: 10, start: 10),
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900],
                    ),
                  ),
                  const SizedBox(  height: 10,  ),
                  Text(
                    note.content,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[900],
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  const SizedBox(  height: 30,  ),
                  Text(
                    note.date,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[900],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(  width: 20,  ),
            Column(
              children: [
                IconButton(
                  onPressed: () => Navigator.push(
                      context, MaterialPageRoute(
                          builder: (context) {
                    return Edit(note: note);
                  })),
                  icon: Icon(
                    Icons.edit,
                    size: 25,
                    color: Colors.grey[900],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                IconButton(
                  onPressed: () => showDialog(
                    context: context, 
                    builder: (BuildContext context) => Dialog(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Center(
                              child: Text( 
                                'Please Confirm',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Divider(
                              height: 20,
                              thickness: 2,
                            ),
                            const Text(
                              'Are you sure you want to delete this Note ?',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: MaterialButton(
                                    onPressed: () => Navigator.pop(context),
                                    color: Colors.grey,
                                    child: const Text(
                                      'No',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox( width: 10,),
                                Expanded(
                                  child: MaterialButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                      note.delete();
                                    },
                                    color: Colors.redAccent[400],
                                    child: const Text(
                                      'Yes',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  icon: Icon(
                    Icons.delete,
                    size: 30,
                    color: Colors.grey[900],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
