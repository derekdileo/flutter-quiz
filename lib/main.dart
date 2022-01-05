import 'package:flutter/material.dart';
import 'question.dart';

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

  List<Question> questionList = [
    Question('You can lead a cow down stairs but not up stairs', 'False'),
    Question(
        'Approximately one quarter of human bones are in the feet.', 'True'),
    Question('A slug\'s blood is green.', 'True'),
  ];

  List<Icon> scoreKeeper = [];

  Icon checkIconWhite = const Icon(
    Icons.check,
    color: Colors.white,
  );

  Icon closeIconWhite = const Icon(
    Icons.close,
    color: Colors.white,
  );

  void checkAnswer(String answer) {
    if (questionList[questionCount].answerText.toString() == answer) {
      scoreKeeper.add(
        const Icon(Icons.check, color: Colors.green),
      );
    } else {
      scoreKeeper.add(
        const Icon(Icons.close, color: Colors.red),
      );
    }
  }

  void checkCount() {
    if (questionCount < questionList.length - 1) {
      questionCount++;
    } else {
      questionCount = 0;
    }
  }

  // Function to create true and false buttons
  Expanded buildCard(Color color, String answer, Icon icon) {
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
                  checkCount();
                });
              },
              icon: icon,
              label: Text(
                answer,
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
                questionList[questionCount].questionText.toString(),
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
        buildCard(Colors.green, 'True', checkIconWhite),
        // False Button
        buildCard(Colors.red, 'False', closeIconWhite),
        // Score
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
