import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bl/letter_app_cubit.dart';
import '../bl/letter_app_state.dart';
import './AddLetterScreen.dart';
import './EditLetterScreen.dart';

class AddLetterScreen extends StatelessWidget {
  final TextEditingController _newLetterController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add letter'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _newLetterController,
              decoration: const InputDecoration(
                labelText: 'New letter',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                  final String newLetter = _newLetterController.text;
                  _newLetterController.clear();
                  context.read<LetterAppCubit>().addLetter(newLetter);
                  Navigator.pop(context);
              },
              child: const Text('Add letter'),
            ),
          ],
        ),
      ),
    );
  }
}
