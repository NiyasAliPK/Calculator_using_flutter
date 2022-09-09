import 'package:get/get.dart';

class HomeController extends GetxController {
  dynamic text = '0';
  dynamic numOne = 0;
  dynamic numTwo = 0;
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
      update();
      return;
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
        numOne = double.tryParse(result);
      } else {
        numTwo = double.tryParse(result);
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
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = '$result.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-$result';
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    text = finalResult;
    update();
  }

  add() {
    if (numOne == null || numTwo == null) {
      return;
    }
    result = (numOne + numTwo).toString();
    numOne = double.tryParse(result);
    return doesContainDecimal(result);
  }

  sub() {
    if (numOne == null || numTwo == null) {
      return;
    }
    result = (numOne - numTwo).toString();
    numOne = double.tryParse(result);
    return doesContainDecimal(result);
  }

  mul() {
    if (numOne == null || numTwo == null) {
      return;
    }
    result = (numOne * numTwo).toString();
    numOne = double.tryParse(result);
    return doesContainDecimal(result);
  }

  div() {
    if (numOne == null || numTwo == null) {
      return;
    }
    result = (numOne / numTwo).toString();
    numOne = double.tryParse(result);
    return doesContainDecimal(result);
  }

  doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return result = splitDecimal[0].toString();
      }
    }
    return result;
  }
}
