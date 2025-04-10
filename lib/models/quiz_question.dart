class QuizQuestion {
  final String text;
  final List<String> answers;
  final int correctIndex; // Tambahkan correctIndex

  const QuizQuestion(this.text, this.answers, this.correctIndex);

List<String> getShuffledAnswers() {
  final shuffledAnswers = List<String>.from(answers); // Copy list jawaban
  shuffledAnswers.shuffle(); // Acak jawaban
  return shuffledAnswers;
}

}