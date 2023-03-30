import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/HomeScreen.dart';
import 'screens/AddLetterScreen.dart';
import 'screens/EditLetterScreen.dart';
import 'bl/letter_app_cubit.dart';

void main() {
  runApp(const LetterApp());
}

class LetterApp extends StatelessWidget {
  const LetterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LetterAppCubit(),
      child: MaterialApp(
        title: 'Letter App with Cubit',
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/add_letter': (context) => AddLetterScreen(),
          '/edit_letter': (context) => EditLetterScreen(),
        },
      ),
    );
  }
}