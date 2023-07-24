import 'package:flutter/material.dart';

void main() => runApp(const Calculator());

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorHome(),
    );
  }
}

bool backGroundColor = false;

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key});

  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  dynamic displaytxt = 20;

  Widget calcButton(String btnTxt, Color btnColor, Color txtColor) {
    return SizedBox(
      height: 70,
      width: 70,
      child: ElevatedButton(
        onPressed: () {
          calculation(btnTxt);
        },
        style: ElevatedButton.styleFrom(
            elevation: 7,
            shape: CircleBorder(),
            shadowColor:
                backGroundColor ?Colors.white : Colors.grey.shade600,
            backgroundColor: btnColor,
            padding: EdgeInsets.all(20)),
        child: Text(
          btnTxt,
          style: TextStyle(fontSize: 20, color: txtColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor ? Colors.black : Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    '$text',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 100,
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Switch(
                  trackColor: MaterialStateProperty.all(Colors.grey),
                  activeColor: Colors.black.withOpacity(0.4),
                  inactiveThumbColor: Colors.white.withOpacity(0.4),
                  activeThumbImage: const AssetImage('assets/sun.png'),
                  inactiveThumbImage: const AssetImage('assets/moon.png'),
                  value: backGroundColor,
                  onChanged: (value) => setState(() {
                    backGroundColor = !backGroundColor;
                  }),
                ),
                Text(
                  backGroundColor
                      ? "SWITCH TO LIGHT THEME"
                      : "SWITCH TO DARK THEME",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcButton('AC', Color(0xFFfdb82c), Colors.white),
                calcButton('+/-', Color(0xFFf4efe2), Color(0xFFa48f64)),
                calcButton('%', Color(0xFFf4efe2), Color(0xFFa48f64)),
                calcButton('/', Color(0xFFe1d5e9), Color(0xFF500079)),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcButton('7', Color(0xFFfdb82c), Colors.white),
                calcButton('8', Color(0xFFf4efe2), Color(0xFFa48f64)),
                calcButton('9', Color(0xFFf4efe2), Color(0xFFa48f64)),
                calcButton('x', Color(0xFFe1d5e9), Color(0xFF500079)),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcButton('4', Color(0xFFfdb82c), Colors.white),
                calcButton('5', Color(0xFFf4efe2), Color(0xFFa48f64)),
                calcButton('6', Color(0xFFf4efe2), Color(0xFFa48f64)),
                calcButton('-', Color(0xFFe1d5e9), Color(0xFF500079)),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcButton('1', Color(0xFFfdb82c), Colors.white),
                calcButton('2', Color(0xFFf4efe2), Color(0xFFa48f64)),
                calcButton('3', Color(0xFFf4efe2), Color(0xFFa48f64)),
                calcButton('+', Color(0xFFe1d5e9), Color(0xFF500079)),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFfdb82c),
                    shadowColor: backGroundColor ?Colors.white : Colors.grey.shade600,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(150, 60), //////// HERE
                  ),
                  onPressed: () {},
                  child: Text(
                    '0',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                calcButton('.', Color(0xFFf4efe2), Color(0xFFa48f64)),
                calcButton('=', Color(0xFFe1d5e9), Color(0xFF500079)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  //Calculator logic
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';

  void calculation(btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
}
