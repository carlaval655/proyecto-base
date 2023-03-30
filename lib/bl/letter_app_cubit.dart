import 'package:bloc/bloc.dart';
import 'letter_app_state.dart';

class LetterAppCubit extends Cubit<LetterAppState> {
  LetterAppCubit() : super(const LetterAppState(selectedLetter: ""));

  void addLetter(String letter) {
    final List<String> updatedLetters = List.from(state.letters)..add(letter);
    emit(state.copyWith(letters: updatedLetters, selectedLetter: letter));
  }

  void editSelectedLetter(String letter) {
    final List<String> updatedLetters = List.from(state.letters);
    final int selectedIndex = updatedLetters.indexOf(state.selectedLetter);
    updatedLetters[selectedIndex] = letter;
    emit(state.copyWith(
      letters: updatedLetters,
      selectedLetter: letter,
    ));
  }

  void deleteSelectedLetter() {
    final List<String> updatedLetters = List.from(state.letters)..remove(state.selectedLetter);
    emit(state.copyWith(
      letters: updatedLetters,
      selectedLetter: updatedLetters.isEmpty ? "" : updatedLetters.first,
    ));
  }

  void selectLetter(String letter) {
    emit(state.copyWith(selectedLetter: letter, letters: state.letters));
  }
}