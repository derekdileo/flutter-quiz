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

  List<String> answers = ['false', 'true', 'true'];

  List<Icon> scoreKeeper = [];

  var checkIcon = const Icon(
    Icons.check,
    color: Colors.green,
  );

  Icon closeIcon = const Icon(
    Icons.close,
    color: Colors.red,
  );

  // Function to create true and false buttons
  Expanded buildCard(
      Color color, IconData iconName, IconData scoreIcon, String label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          color: color,
          // margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: Center(
            child: TextButton.icon(
              onPressed: () {
                if (questionCount < questions.length - 1) {
                  questionCount++;
                } else {
                  questionCount = 0;
                }
                setState(() {
                  scoreKeeper.add(
                    Icon(
                      scoreIcon,
                      color: color,
                    ),
                  );
                });
              },
              icon: Icon(
                iconName,
                color: Colors.white,
              ),
              label: Text(
                label,
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
        // buildCard(Colors.green, Icons.check, Icons.check, 'True'),
        // buildCard(Colors.red, Icons.close, Icons.close, 'False'),

        // True
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              color: Colors.green,
              // margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: Center(
                child: TextButton.icon(
                  onPressed: () {
                    if (questionCount < questions.length - 1) {
                      questionCount++;
                    } else {
                      questionCount = 0;
                      scoreKeeper.removeRange(0, questions.length);
                    }
                    setState(() {
                      if (answers[questionCount] == 'true') {
                        scoreKeeper.add(
                          const Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                      } else {
                        scoreKeeper.add(
                          const Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        );
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'True',
                    style: TextStyle(
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
        ),
        // False
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              color: Colors.red,
              // margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: Center(
                child: TextButton.icon(
                  onPressed: () {
                    if (questionCount < questions.length - 1) {
                      questionCount++;
                    } else {
                      questionCount = 0;
                      scoreKeeper.removeRange(0, questions.length);
                    }
                    setState(() {
                      if (answers[questionCount] == 'false') {
                        scoreKeeper.add(
                          const Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                      } else {
                        scoreKeeper.add(
                          const Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        );
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'False',
                    style: TextStyle(
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
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
