import 'package:flutter/material.dart';
import '../model/question.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Quiz App",
      home: Quiz(),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _currentQuestionIndex = 0;
  List<Question> questionBank = [
    Question("Hello World is the most coded program in this world ?", true),
    Question("Is Your name Shubham ?", true),
    Question("Are you from Mumbai ?", false)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello World"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Image.asset("images/flag.png",
                  width: 250,
                  height: 280,),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.5),
                      border: Border.all(
                        color: Colors.blueGrey.shade400,
                        style: BorderStyle.solid
                      )
                    ),
                    height: 120,
                    child: Center(child: Text(questionBank[_currentQuestionIndex].questionText, style: const TextStyle(
                      fontSize: 17,
                      color: Colors.white
                    ),)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(onPressed: () {
                      _checkAnswer(true , context);
                    },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey.shade700
                      ),
                      child: const Text("True", style: TextStyle(color: Colors.white)),
                    ),
                    ElevatedButton(onPressed: () {
                      _checkAnswer(false, context);
                    },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey.shade700
                      ),
                      child: const Text("False", style: TextStyle(color: Colors.white)),
                    ),
                    ElevatedButton(onPressed: () {
                      _nextQuestion;
                    },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey.shade700
                      ),
                      child: const Icon(Icons.arrow_forward, color: Colors.white)
                    )
                  ],
                ),
                const Spacer(),
              ],
            ),
          );
        }
      ),
    );
  }

  _checkAnswer (bool userChoice , BuildContext context) {
    if(userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      const snackBar = SnackBar(content: Text("Correct"),duration: Duration(milliseconds: 500), backgroundColor: Colors.green,);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _nextQuestion();
    }
    else {
      const snackBar = SnackBar(content: Text("Incorrect"), duration: Duration(milliseconds: 500), backgroundColor: Colors.red,);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _nextQuestion();
    }
  }
  _nextQuestion () {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

}

