import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bl/letter_app_cubit.dart';
import '../bl/letter_app_state.dart';

class EditLetterScreen extends StatelessWidget {
  final TextEditingController _editLetterController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final selectedLetter = context.select((LetterAppCubit cubit) => cubit.state.selectedLetter);

    // Set the text in the controller to the selected letter
    _editLetterController.text = selectedLetter;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit selected letter'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _editLetterController,
              decoration: const InputDecoration(
                labelText: 'Edit letter',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a letter';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final String editedLetter = _editLetterController.text;
                  context.read<LetterAppCubit>().editSelectedLetter(editedLetter);
                  Navigator.pop(context);
                }
              },
              child: const Text('Save changes'),
            ),
          ],
        ),
      ),
    );
  }
}