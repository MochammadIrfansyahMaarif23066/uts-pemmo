import 'package:flutter/material.dart';
import 'package:quizz/components/answer_button.dart';
import 'package:quizz/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  final void Function(int score) onQuizComplete; // Callback untuk navigasi ke result screen

  const QuestionsScreen({
    super.key,
    required this.onQuizComplete, // Tambahkan parameter untuk callback
  });

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  int score = 0;
  int? selectedAnswerIndex; // Melacak indeks jawaban yang dipilih
  bool isAnswerChecked = false; // Status apakah jawaban sudah diperiksa
  List<String>? shuffledAnswers; // Cache jawaban yang sudah diacak
  int? correctIndex; // Indeks jawaban benar setelah pengacakan

  @override
  void initState() {
    super.initState();
    loadQuestion(); // Memuat soal pertama kali
  }

  void loadQuestion() {
    setState(() {
      // Muat dan acak jawaban hanya sekali per soal
      shuffledAnswers = List<String>.from(questions[currentQuestionIndex].answers);
      shuffledAnswers!.shuffle();

      // Perbarui correctIndex untuk menyesuaikan jawaban yang benar setelah pengacakan
      final correctAnswer =
      questions[currentQuestionIndex].answers[questions[currentQuestionIndex].correctIndex];
      correctIndex = shuffledAnswers!.indexOf(correctAnswer);
    });
  }

  void checkAnswer(int index) {
    setState(() {
      selectedAnswerIndex = index; // Simpan jawaban yang dipilih
      isAnswerChecked = true; // Tandai bahwa jawaban sudah diperiksa

      //Tambahkan skor
      if (index == correctIndex){
        score += 1;
      }
    });
	
	Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        currentQuestionIndex++; // Lanjut ke soal berikutnya
        if (currentQuestionIndex < questions.length) {
          loadQuestion(); // Memuat soal berikutnya
        } else {
          widget.onQuizComplete(score); // Navigasi ke halaman hasil
        }
        selectedAnswerIndex = null; // Reset pilihan
        isAnswerChecked = false; // Reset status
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex]; //memuat soal saat ini ang diambil dari questions
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,//soal quis saat ini
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            if (shuffledAnswers != null) // Pastikan shuffledAnswers tidak null
              ...shuffledAnswers!.asMap().entries.map((entry) {
                int index = entry.key; // Indeks jawaban
                String answer = entry.value; // Jawaban teks
                return AnswerButton(
                  text: answer,
                  index: index,
                  correctIndex: correctIndex!, // Indeks jawaban benar
                  selectedIndex: selectedAnswerIndex,
                  onTap: () {
                    if (!isAnswerChecked) {
                      checkAnswer(index);
                    }
                  },
                );
              }),
          ],
        ),
      ),
    );
  }
}
