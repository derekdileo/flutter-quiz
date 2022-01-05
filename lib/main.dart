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
  // Instantiate lists to keep questions and score
  List<String> questions = [];
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
        const Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                'This is where the question text will go.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        buildCard(Colors.green, Icons.check, Icons.check, 'True'),
        buildCard(Colors.red, Icons.close, Icons.close, 'False'),

        // TODO: Add a Row here as your score keeper
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

/*
* question1: 'You can lead a cow down stairs but not up stairs.', false,
* question2: 'Approximately one quarter of human bones are in the feet.', true,
* question3: 'A slug\'s blood is green.', true,
* */
