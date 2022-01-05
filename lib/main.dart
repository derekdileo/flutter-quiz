import 'package:flutter/material.dart';

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
  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.', // false,
    'Approximately one quarter of human bones are in the feet.', // true,
    'A slug\'s blood is green.', //true,
  ];

  int questionCount = 0;

  List<String> answers = ['False', 'True', 'True'];

  List<Icon> scoreKeeper = [];

  Icon makeIcon(IconData data) {
    return Icon(data);
  }

  Icon checkIcon = const Icon(
    Icons.check,
    color: Colors.green,
  );

  Icon checkIconWhite = const Icon(
    Icons.check,
    color: Colors.white,
  );

  Icon closeIcon = const Icon(
    Icons.close,
    color: Colors.red,
  );

  Icon closeIconWhite = const Icon(
    Icons.close,
    color: Colors.white,
  );

  void checkCount() {
    if (questionCount < questions.length - 1) {
      questionCount++;
    } else {
      questionCount = 0;
    }
  }

  void checkAnswer(String answer) {
    if (answers[questionCount] == answer) {
      scoreKeeper.add(
        checkIcon,
      );
    } else {
      scoreKeeper.add(
        closeIcon,
      );
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
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionCount],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        // True
        buildCard(Colors.green, 'True', checkIconWhite),
        // False
        buildCard(Colors.red, 'False', closeIconWhite),
        // buildCard(Colors.red, Icons.close, Icons.close, 'False'),

        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
