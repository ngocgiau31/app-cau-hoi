import 'dart:html';
import 'package:flutter/material.dart';
import 'package:app/question_model.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 206, 148, 176),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Text(
            "App Câu hỏi đơn giản",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          _questionWidget(),
          _answerList(),
          _nextButton(),
        ]),
      ),
    );
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Câu hỏi ${currentQuestionIndex + 1}/${questionList.length.toString()}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 75, 143, 191),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        child: Text(answer.answerText),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary:
              isSelected ? Color.fromARGB(255, 75, 143, 191) : Colors.white,
          onPrimary: isSelected ? Colors.white : Colors.black,
        ),
        onPressed: () {
          if (selectedAnswer == null) {
            if (answer.isCorrect) {
              score++;
            }
            setState(() {
              selectedAnswer = answer;
            });
          }
        },
      ),
    );
  }

  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }

    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
        child: Text(isLastQuestion ? "Chọn" : "Tiếp theo"),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Color.fromARGB(255, 174, 187, 122),
          onPrimary: Colors.white,
        ),
        onPressed: () {
          if (isLastQuestion) {
            showDialog(context: context, builder: (_) => _showScoreDialog());
          } else {
            setState(() {
              selectedAnswer = null;
              currentQuestionIndex++;
            });
          }
        },
      ),
    );
  }

  _showScoreDialog() {
    bool isPassed = false;
    if (score >= questionList.length * 0.6) {
      isPassed = true;
    }
    String title = isPassed ? "Đúng!" : "Sai!";
    return AlertDialog(
      title: Text(
        title + " Điểm của bạn là $score",
        style: TextStyle(color: isPassed ? Colors.green : Colors.redAccent),
      ),
      content: ElevatedButton(
        child: const Text("Bắt đầu lại"),
        onPressed: () {
          Navigator.pop(context);
          setState(() {
            currentQuestionIndex = 0;
            score = 0;
            selectedAnswer = null;
          });
        },
      ),
    );
  }
}
