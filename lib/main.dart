import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'logic/cubits/app_states.dart';
import 'components/constants.dart';
import 'logic/cubits/bloc_observer.dart';
import 'logic/cubits/app_cubit.dart';
import 'logic/hive/hive.dart';
import 'logic/hive/noteModel.dart';
import 'views/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  await Hive.openBox('hiveBox');
  Bloc.observer = SimpleObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => App_Cubit(),
      child: BlocConsumer<App_Cubit, App_State>(
        listener: (context, state) {},
        builder: (context, state) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Notes',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: ( App_Cubit().isDark = HiveMethods().get('darkMode') ?? true )
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const Home(),
          );
        }
      )
    );
  }
}
