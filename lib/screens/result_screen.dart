import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final VoidCallback onHomePress; // Callback untuk kembali ke halaman utama
  final int score;
  final int totalQuestions;

  const ResultScreen({
    super.key,
    required this.onHomePress,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Finishh!',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20), // Margin di kanan dan kiri
            child: const Text(
              'Selamat Anda Telah Berhasil Menyelesaikan Quiz Ini!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Skor Anda: $score/$totalQuestions',
            style : TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: onHomePress, // Navigasi ke halaman awal
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              backgroundColor: Colors.white,
            ),
            child: const Text(
              'Kembali ke Home',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF0D47A1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
