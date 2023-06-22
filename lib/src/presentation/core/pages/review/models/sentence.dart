class Sentence {
  final String word;
  final String translation;
  final String sentence;
  final String opened;

  Sentence({
    required this.word,
    required this.translation,
    required this.sentence,
    required this.opened,
  });
}
  List<Sentence> sentences = [
    Sentence(
        word: 'shoping',
        translation: 'kupować',
        sentence: 'I go shoping',
        opened: '18.06.2023'),
    Sentence(
        word: 'win',
        translation: 'wygrać',
        sentence: 'I will win this game',
        opened: '12.06.2023'),
      Sentence(
        word: 'win',
        translation: 'wygrać',
        sentence: 'I will win this game',
        opened: '12.06.2023'),
      Sentence(
        word: 'win',
        translation: 'wygrać',
        sentence: 'I will win this game',
        opened: '12.06.2023'),
  ];

  List<Sentence> getSentenceList() {
    return sentences;
  }