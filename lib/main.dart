import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int addSum = 0;
  int subtractSum = 0;
  int multiplySum = 0;
  int divideSum = 0;

  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();
  TextEditingController sub1Controller = TextEditingController();
  TextEditingController sub2Controller = TextEditingController();
  TextEditingController mul1Controller = TextEditingController();
  TextEditingController mul2Controller = TextEditingController();
  TextEditingController div1Controller = TextEditingController();
  TextEditingController div2Controller = TextEditingController();

  void clearInputs() {
    add1Controller.clear();
    add2Controller.clear();
    sub1Controller.clear();
    sub2Controller.clear();
    mul1Controller.clear();
    mul2Controller.clear();
    div1Controller.clear();
    div2Controller.clear();

    setState(() {
      addSum = 0;
      subtractSum = 0;
      multiplySum = 0;
      divideSum = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepPurple, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildOperationRow(
                  label: " + ",
                  controller1: add1Controller,
                  controller2: add2Controller,
                  result: addSum,
                  onPressed: () {
                    int firstNum = int.tryParse(add1Controller.text) ?? 0;
                    int secondNum = int.tryParse(add2Controller.text) ?? 0;
                    setState(() {
                      addSum = firstNum + secondNum;
                    });
                  },
                ),
                buildOperationRow(
                  label: " - ",
                  controller1: sub1Controller,
                  controller2: sub2Controller,
                  result: subtractSum,
                  onPressed: () {
                    int firstNum = int.tryParse(sub1Controller.text) ?? 0;
                    int secondNum = int.tryParse(sub2Controller.text) ?? 0;
                    setState(() {
                      subtractSum = firstNum - secondNum;
                    });
                  },
                ),
                buildOperationRow(
                  label: " x ",
                  controller1: mul1Controller,
                  controller2: mul2Controller,
                  result: multiplySum,
                  onPressed: () {
                    int firstNum = int.tryParse(mul1Controller.text) ?? 0;
                    int secondNum = int.tryParse(mul2Controller.text) ?? 0;
                    setState(() {
                      multiplySum = firstNum * secondNum;
                    });
                  },
                ),
                buildOperationRow(
                  label: " ÷ ",
                  controller1: div1Controller,
                  controller2: div2Controller,
                  result: divideSum,
                  onPressed: () {
                    int firstNum = int.tryParse(div1Controller.text) ?? 0;
                    int secondNum = int.tryParse(div2Controller.text) ?? 0;
                    setState(() {
                      divideSum = secondNum != 0 ? firstNum ~/ secondNum : 0;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: clearInputs,
                  child: const Text("Clear"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildOperationRow({
    required String label,
    required TextEditingController controller1,
    required TextEditingController controller2,
    required int result,
    required VoidCallback onPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: TextField(
            controller: controller1,
            decoration: InputDecoration(labelText: "First Number"),
            keyboardType: TextInputType.number,
          ),
        ),
        Text(label),
        Expanded(
          child: TextField(
            controller: controller2,
            decoration: InputDecoration(labelText: "Second Number"),
            keyboardType: TextInputType.number,
          ),
        ),
        Text(' = $result'),
        IconButton(
          icon: const Icon(Icons.calculate),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
