import 'dart:io';

main() => Dartalator();

class Dartalator {
  Dartalator() {
    formulate();
  }

  void formulate() {
    print("Welcome to the console calculator!");

    /*
    ()  => Group
    ?<> => Group name

    \.  => Finding single character
    \d  => Finding number
    \s  => Finding space
    \w  => Finding letter
    */

    try {
      String pattern =
          r'(?<firstVal>\d+\.?\d*)\s*(?<operator>\+|-|\*|/)\s*(?<secondVal>\d+\.?\d*)\s*=?$';

      String deicPattern = r'\.';

      bool? isDecimal;
      String? operatorSign;

      num? firstDeciamlVal;
      num? secondDeciamlVal;
      num? answer;

      print('What mathematical computation would you like to perform?');
      String? inputValue = stdin.readLineSync();

      if (inputValue == 'Quit'.toLowerCase() ||
          inputValue == 'Exit'.toLowerCase()) exit;

      RegExpMatch? match = new RegExp(pattern).firstMatch(inputValue!);

      if (match != null)
        operatorSign = match.namedGroup('operator');
      else {
        print('Please enter a valid mathematical expression');
        formulate();
      }

      if (new RegExp(deicPattern).firstMatch(match!.group(0)!) != null ||
          new RegExp(deicPattern).firstMatch(match.group(2)!) != null) {
        isDecimal = true;
      } else {
        isDecimal = false;
      }

      if (isDecimal) {
        firstDeciamlVal = double.parse(match.namedGroup('firstVal')!);
        secondDeciamlVal = double.parse(match.namedGroup('secondVal')!);

        switch (operatorSign) {
          case '+':
            answer = firstDeciamlVal + secondDeciamlVal;
            break;
          case '-':
            answer = firstDeciamlVal - secondDeciamlVal;
            break;
          case '*':
            answer = firstDeciamlVal * secondDeciamlVal;
            break;
          case '/':
            answer = firstDeciamlVal / secondDeciamlVal;
            break;
          case '%':
            answer = firstDeciamlVal % secondDeciamlVal;
            break;
        }
      } else {
        firstDeciamlVal = int.parse(match.namedGroup('firstVal')!);
        secondDeciamlVal = int.parse(match.namedGroup('secondVal')!);

        switch (operatorSign) {
          case '+':
            answer = firstDeciamlVal + secondDeciamlVal;
            break;
          case '-':
            answer = firstDeciamlVal - secondDeciamlVal;
            break;
          case '*':
            answer = firstDeciamlVal * secondDeciamlVal;
            break;
          case '/':
            answer = firstDeciamlVal / secondDeciamlVal;
            break;
          case '%':
            answer = firstDeciamlVal % secondDeciamlVal;
            break;
        }
      }

      print(
          '${match.namedGroup('firstVal')} $operatorSign ${match.namedGroup('secondVal')} = ${answer.toString()}');
      isThatAll();

      // if (match) var operatorSign = match;
    } catch (e) {
      print(e);
    }
  }

  void isThatAll() {
    print('Is that all? (type Y for yes or N for no):');

    String? again = stdin.readLineSync();

    if (again == 'N'.toLowerCase())
      formulate();
    else
      exit;
  }
}
