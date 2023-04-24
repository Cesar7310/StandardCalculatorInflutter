import 'package:flutter/material.dart';
import 'package:standard_flutter_calculator/buttons.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:auto_size_text/auto_size_text.dart';

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

//AÑADIR LA OPCIÓN DE DARK THEME Y LIGHT THEME
bool _iconBool = false;

IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

ThemeData _lightTheme = ThemeData(
  primarySwatch: Colors.deepPurple,
  brightness: Brightness.light,
);

ThemeData _darkTheme = ThemeData(
  primarySwatch: Colors.deepPurple,
  brightness: Brightness.dark,
);
//AÑADIR LA OPCIÓN DE DARK THEME Y LIGHT THEME

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '0';
  bool invalid = false;

  final List<String> buttons = [
    'AC', //0
    '(', //1
    ')', //2
    '÷', //3
    '9', //4
    '8', //5
    '7', //6
    'x', //7
    '6', //8
    '5', //9
    '4', //10
    '+', //11
    '3', //12
    '2', //13
    '1', //14
    '-', //15
    '0', //16
    '.', //17
    'C', //18
    '=', //19
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _iconBool ? _darkTheme : _lightTheme,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
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
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 30),
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      userQuestion,
                      style: const TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis),
                      minFontSize: 35,
                      maxLines: 1,
                      maxFontSize: 45,
                      overflowReplacement: const Text(
                        'El número es muy grande',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    alignment: Alignment.centerRight,
                    child: AutoSizeText(
                      userAnswer,
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w500,
                          color: Colors.teal.shade300),
                      minFontSize: 35,
                      maxLines: 1,
                      maxFontSize: 50,
                      overflowReplacement: const Text(
                        'El número es muy grande',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.deepPurple[200],
            ),
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
                            resetInvalid();
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.teal.shade100,
                        textColor: Colors.white,
                        textSize: 25.0,
                        // textWeight: FontWeight.bold,
                      );
                    } else if (index == 18) {
                      return MyButton(
                        buttonText: buttons[index],
                        color: Colors.teal.shade100,
                        textColor: Colors.white,
                        textSize: 30.0,
                        // textWeight: FontWeight.bold,
                        buttonTapped: () {
                          if (userQuestion.isNotEmpty) {
                            setState(() {
                              userQuestion = userQuestion.substring(
                                  0, userQuestion.length - 1);
                              userAnswer = "0";
                            });
                          }
                        },
                      );
                    } else if (index == 1) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            buttonPressed(index);
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.teal.shade700,
                        textColor: Colors.white,
                        textSize: 25.0,
                        // textWeight: FontWeight.bold,
                      );
                    } else if (index == 2) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            buttonPressed(index);
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.teal.shade700,
                        textColor: Colors.white,
                        textSize: 25.0,
                      );
                    } else if (index == 3) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            buttonPressed(index);
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.teal.shade700,
                        textColor: Colors.white,
                        textSize: 25.0,
                      );
                    } else if (index == 7) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            buttonPressed(index);
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.teal.shade700,
                        textColor: Colors.white,
                        textSize: 25.0,
                      );
                    } else if (index == 11) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            buttonPressed(index);
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.teal.shade700,
                        textColor: Colors.white,
                        textSize: 25.0,
                      );
                    } else if (index == 15) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            buttonPressed(index);
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.teal.shade700,
                        textColor: Colors.white,
                        textSize: 25.0,
                      );
                    }
                    // else if (index == 16) {
                    //   return MyButton(
                    //     buttonTapped: () {
                    //       setState(() {
                    //         buttonPressed(index);
                    //       });
                    //     },
                    //     buttonText: buttons[index],
                    //     color: const Color.fromARGB(255, 79, 172, 127),
                    //     textColor: Colors.white,
                    //     textSize: 30.0,
                    //     textWeight: FontWeight.bold,
                    //   );
                    // }
                    else if (index == 17) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            buttonPressed(index);
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.grey.shade200,
                        textColor: Colors.black,
                        textSize: 30.0,
                      );
                    } else if (index == buttons.length - 1) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.lightBlue.shade900,
                        textColor: Colors.white,
                        textSize: 30.0,
                        // textWeight: FontWeight.w500,
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
                            ? Colors.grey.shade50
                            : Colors.grey.shade50,
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.black,
                        textSize: 30.0,
                        // textWeight: FontWeight.w500,
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

  resetInvalid() {
    invalid = false;
  }

  buttonPressed(index) {
    resetInvalid();
    userQuestion += buttons[index];
    RegExp regExp = RegExp(r'^(0-9)+$');
    if (!(regExp.hasMatch(buttons[index])) && userQuestion.length == 1) {
      ///this If is use when user enter first digit an arithmetic operator, that is
      ///if user enter first digit +,- or any other, we won't allow to add into amount
      ///and remove from user input.
      // userQuestion = '';
      return;
    }

    ///if user pressing any of below button again and again, it will replace with the last character
    ///e.g if value is 12+ and user press - , it will replace + with -.
    String lastChar =
        userQuestion.characters.elementAt(userQuestion.length - 2);

    if (lastChar == '(' ||
        lastChar == ')' ||
        lastChar == '÷' ||
        lastChar == '-' ||
        lastChar == 'x' ||
        lastChar == '+' ||
        lastChar == '=' ||
        lastChar == '.') {
      userQuestion = userQuestion.substring(0, userQuestion.length - 2);
      userQuestion += buttons[index];
    } else {
      userQuestion = userQuestion.substring(0, userQuestion.length - 1);
      userQuestion += buttons[index];
    }
  }

  String calculate() {
    try {
      var exp = Parser().parse(userQuestion);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return "Sintaxis Error";
    }
  }
}
