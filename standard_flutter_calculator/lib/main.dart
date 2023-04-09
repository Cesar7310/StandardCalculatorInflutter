import 'package:flutter/material.dart';
import 'package:standard_flutter_calculator/buttons.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

bool _iconBool = false;

IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

ThemeData _lightTheme = ThemeData(
  primarySwatch: Colors.deepPurple,
  brightness: Brightness.light,
);

ThemeData _darkTheme = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
);

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '';

  // final myTextStyle = TextStyle(fontSize: 60, color: Colors.deepPurple[900]);

  final List<String> buttons = [
    'AC',
    '(',
    ')',
    '÷',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '+',
    '3',
    '2',
    '1',
    '-',
    '0',
    '.',
    '%',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _iconBool ? _darkTheme : _lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dark & Light Theme'),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _iconBool = !_iconBool;
                });
              },
              icon: Icon(_iconBool ? _iconDark : _iconLight),
            ),
          ],
        ),
        // backgroundColor: const Color(0xFFE5E8FB),
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // const SizedBox(height: 1),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 30),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userQuestion,
                      style: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAnswer,
                      style: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 97, 83, 160),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.deepPurple[200],
            ),
            // const Padding(
            //   padding: EdgeInsets.only(
            //     bottom: 15,
            //   ),
            // ),
            //  const Padding(
            //   padding: EdgeInsets.only(
            //     top: 15,
            //   ),
            // ),
            Expanded(
              flex: 3,
              child: Center(
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            userQuestion = "";
                            userAnswer = "0";
                          });
                        },
                        buttonText: buttons[index],
                        color: const Color.fromARGB(255, 79, 172, 127),
                        textColor: Colors.white,
                        textSize: 30.0,
                        textWeight: FontWeight.bold,
                      );
                      // } else if (index == 1) {
                      //   return MyButton(
                      //     buttonTapped: () {
                      //       setState(() {
                      //         userQuestion = userQuestion.substring(
                      //             0, userQuestion.length - 1);
                      //       });
                      //     },
                      //     buttonText: buttons[index],
                      //     color: Colors.red,
                      //     textColor: Colors.white,
                      //     textSize: 25.0,
                      //     textWeight: FontWeight.bold,
                      //     iconDel: const Icon(Icons.arrow_back),
                      //   );
                    } else if (index == buttons.length - 1) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.deepPurple.shade900,
                        textColor: Colors.white,
                        textSize: 30.0,
                        textWeight: FontWeight.w500,
                      );
                    } else {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            userQuestion = userQuestion + buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: isOperator(buttons[index])
                            ? Colors.deepPurple[200]
                            : const Color(0xffd1d5ee),
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.deepPurple.shade900,
                        textSize: 27.0,
                        textWeight: FontWeight.w500,
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '(' ||
        x == ')' ||
        x == '%' ||
        x == '÷' ||
        x == 'x' ||
        x == '-' ||
        x == '+' ||
        x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;

    finalQuestion = finalQuestion.replaceAll("x", "*");
    finalQuestion = finalQuestion.replaceAll("÷", "/");

    userAnswer = calculate();
    if (userAnswer.endsWith(".0")) {
      userAnswer = userAnswer.replaceAll(".0", "");
      return;
    }

    try {
      Parser p = Parser();
      Expression exp = p.parse(finalQuestion);
      double eval = exp.evaluate(EvaluationType.REAL, ContextModel());
      userAnswer = eval.toString();
    } catch (e) {
      return;
    }
  }

  String calculate() {
    try {
      var exp = Parser().parse(userQuestion);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return "Error";
    }
  }
}
