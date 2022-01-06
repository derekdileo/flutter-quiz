import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // Instantiate local variables
  int questionCount = 0;

  List<Icon> scoreKeeper = [];

  Icon checkIconWhite = const Icon(
    Icons.check,
    color: Colors.white,
  );

  Icon closeIconWhite = const Icon(
    Icons.close,
    color: Colors.white,
  );

  void checkAnswer(bool answer) {
    questionCount++;
    if (quizBrain.getAnswer() == answer) {
      scoreKeeper.add(
        const Icon(Icons.check, color: Colors.green),
      );
    } else {
      scoreKeeper.add(
        const Icon(Icons.close, color: Colors.red),
      );
    }
  }

  void clearAnswers() {
    Alert(
            context: context,
            title: "Alert",
            desc: "You've reached the end of the quiz!")
        .show();
    scoreKeeper.removeRange(0, questionCount);
    questionCount = 0;
    quizBrain.resetQuestions();
  }

  // Function to create true and false buttons
  Expanded buildCard(Color color, bool answer, Icon icon) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          color: color,
          // margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: Center(
            child: TextButton.icon(
              onPressed: () {
                setState(() {
                  checkAnswer(answer);
                  quizBrain.nextQuestion();
                  if (quizBrain.getEOF()) {
                    clearAnswers();
                  }
                });
              },
              icon: icon,
              label: Text(
                answer.toString(),
                style: const TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Questions
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        // True Button
        buildCard(Colors.green, true, checkIconWhite),
        // False Button
        buildCard(Colors.red, false, closeIconWhite),
        // Score
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
