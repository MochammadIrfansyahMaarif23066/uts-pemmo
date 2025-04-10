import 'package:flutter/material.dart';
import 'package:quizz/screens/start_screen.dart';
import 'package:quizz/screens/questions_screen.dart';
import 'package:quizz/screens/result_screen.dart';
import 'package:quizz/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
      int finalScore = 0;

  void switchScreen(String screenName) {
    setState(() {
      activeScreen = screenName;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidget = activeScreen == 'start-screen'
        ? StartScreen(() => switchScreen('questions-screen'))
        : activeScreen == 'questions-screen'
          ? QuestionsScreen(
            onQuizComplete: (score){
              setState(() {
                finalScore = score;
                activeScreen = 'result-screen';
              });
            },
          )
          : ResultScreen(
              score: finalScore,
              totalQuestions: questions.length,
              onHomePress: () => switchScreen('start-screen'),
            );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.purpleAccent,
                Colors.blueAccent,
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
