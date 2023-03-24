class LetterState extends Equatable {
  final String letter;

  LetterState({this.letter = 'A'});

  @override
  List<Object> get props => [letter];
}