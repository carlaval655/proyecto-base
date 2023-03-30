import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bl/letter_app_cubit.dart';
import '../bl/letter_app_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Letter App with Cubit'),
      ),
      body: BlocBuilder<LetterAppCubit, LetterAppState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton<String>(
                value: state.selectedLetter,
                onChanged: (String? letter) {
                  context.read<LetterAppCubit>().selectLetter(letter!);
                },
                items:
                  state.letters.map((letter) {
                  return DropdownMenuItem<String>(
                    value: letter,
                    child: Text(letter),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/add_letter');
                },
                child: const Text('Add letter'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/edit_letter');
                },
                child: const Text('Edit selected letter'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<LetterAppCubit>().deleteSelectedLetter();
                },
                child: const Text('Delete selected letter'),
              ),
            ],
          );
        },
      ),
    );
  }
}