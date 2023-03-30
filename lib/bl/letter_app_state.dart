import 'package:equatable/equatable.dart';

class LetterAppState extends Equatable {
  final List<String> letters;
  final String selectedLetter;

  const LetterAppState({this.letters = const [], required this.selectedLetter});

  @override
  List<Object> get props => [letters, selectedLetter];

  LetterAppState copyWith({
    required List<String> letters,
    required String selectedLetter,
  }) {
    return LetterAppState(
      letters: letters,
      selectedLetter: selectedLetter,
    );
  }
}