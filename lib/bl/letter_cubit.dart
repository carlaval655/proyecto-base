class LetterCubit extends Cubit<LetterState> {
  LetterCubit() : super(LetterState());

  void setLetter(String letter) {
    emit(LetterState(letter: letter));
  }
}

// Path: lib/bl/letter_state.dart