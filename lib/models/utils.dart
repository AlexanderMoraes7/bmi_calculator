import 'dart:convert';
import 'dart:io';

import 'package:bmi_calculator/enum/app_language.dart';

class Utils {
  static String readText() {
    String value;
    while(true){
      try{
        value = stdin.readLineSync(encoding: utf8) ?? '';
        break;
      }catch(e){
        print('Invalid value, enter again / Valor inválido, digite novamente:');
      }
    }
    return value;
  }

  static String receiveText(String text){
    print(text);
    return readText();
  }

  static double receiveDouble(String text) {
    print(text);
    double value;
    while(true){
      try{
        value = double.parse(stdin.readLineSync(encoding: utf8)?? '0.0');
        break;
      }catch(e){
        print('Invalid value, enter again / Valor invalido, digite novamente:');
      }
    }
    return value;
  }

  static String getClassificationPt(double bmi) {
    if (bmi < 16) {
      return 'Magreza grave';
    } else if (bmi < 17) {
      return 'Magreza moderada';
    } else if (bmi < 18.5) {
      return 'Magreza leve';
    } else if (bmi < 25) {
      return 'Saudável';
    } else if (bmi < 30) {
      return 'Sobrepeso';
    } else if (bmi < 35) {
      return "Obesidade Grau I";
    } else if (bmi < 40) {
      return "Obesidade Grau II (severa)";
    } else {
      return "Obesidade Grau III (móbida)";
    }
  }

  static String getClassificationEn(double bmi) {
    if (bmi < 16) {
      return 'Severe thinness';
    } else if (bmi < 17) {
      return 'Moderate thinness';
    } else if (bmi < 18.5) {
      return 'Mild thinness';
    } else if (bmi < 25) {
      return 'Normal range';
    } else if (bmi < 30) {
      return 'Overweight';
    } else if (bmi < 35) {
      return 'Class I obesity';
    } else if (bmi < 40) {
      return 'Class II obesity (Severe obesity)';
    } else {
      return 'Class III obesity (Morbid obesity)';
    }
  }

  static double bmiCalculate(double weight, height, AppLanguage language){
  double value;
  if (language == AppLanguage.english) {
    value =  weight / (height * height) * 703;
  } else {
    value = weight / (height * height);
  }
  return double.parse(value.toStringAsFixed(2));
  }
}