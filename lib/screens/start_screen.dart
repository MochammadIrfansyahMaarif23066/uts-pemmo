import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget { // Membuat class bernama StartScreen
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;// Mendeklarasikan variabel final bertipe fungsi void tanpa parameter.

  @override
  Widget build(BuildContext context) { // Method build membuat UI widget.
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,// Menyusun widget secara vertikal dan berada di tengah secara vertikal.
          children: [
          Image.asset(
            'assets/444.png',
            width: 400,// Menampilkan gambar dari folder assets dengan lebar 400px.
          ),
            const SizedBox(height: 80),// Jarak vertikal antara gambar dan teks sebesar 80px.
            const Text(
              'Selamat Datang',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),// Jarak vertikal antara teks dan tombol sebesar 30px.
            OutlinedButton(// Menggunakan OutlinedButton untuk tombol
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1DE9B6),
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
              ),// Tombol dengan warna latar hijau muda dan padding.
              onPressed: startQuiz,// Saat tombol diklik, fungsi startQuiz dijalankan.
              child: const Text(
                'Start Quizz!',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF01579B),
                fontWeight: FontWeight.bold,
              ),
            ),
            )
      ],
      ),
    );
  }
}

