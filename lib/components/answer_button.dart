import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.text,
    required this.index,
    required this.correctIndex,
    required this.selectedIndex,
    required this.onTap,
  });

  final String text;
  final int index;
  final int correctIndex;
  final int? selectedIndex;
  final void Function() onTap;


  Color _getTheRightColor() {
    if (selectedIndex != null) { // Jika pengguna telah memilih jawaban
      if (index == correctIndex) {
        return Colors.green; // Hijau untuk jawaban benar
      } else {
        return Colors.red; // Merah untuk semua jawaban salah
      }
    }
    return Colors.grey; // Default sebelum pengguna memilih
  }

  IconData? _getTheRightIcon() {
    if (selectedIndex != null) { // Jika pengguna telah memilih jawaban
      if (index == correctIndex) {
        return Icons.done; // Centang untuk jawaban benar
      } else {
        return Icons.close; // Silang untuk semua jawaban salah
      }
    }
    return null; // Tidak ada ikon untuk jawaban sebelum dipilih
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8), // Menambahkan jarak antar tombol
      decoration: BoxDecoration(
        color: Colors.white,// Warna latar belakang putih
        border: Border.all(color: _getTheRightColor()), // Warna border dinamis
        borderRadius: BorderRadius.circular(15), // Membuat sudut border melengkung
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Menambahkan padding dalam tombol
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Expanded(
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
              const SizedBox(width: 12),
              Container(
                height: 26,
                width: 26,
                decoration: BoxDecoration(
                  color: _getTheRightColor() == Colors.grey
                      ? Colors.transparent
                      : _getTheRightColor(),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: _getTheRightColor()),
                ),
                  child: _getTheRightIcon() == null
                      ? null
                      : Icon(
                          _getTheRightIcon(),
                          size: 16,
                          color: Colors.white,
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

