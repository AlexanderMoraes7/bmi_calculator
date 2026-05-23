import 'package:bmi_calculator/classes/person.dart';
import 'package:bmi_calculator/enum/app_language.dart';
import 'package:bmi_calculator/models/utils.dart';

void main(List<String> arguments) {
  AppLanguage appLanguage = AppLanguage.english;
  Person person = Person();
  String language;
  double bmi;

  print('Enter your language || Digite seu idioma:');
  language = Utils.receiveText('1 - English || 2 - Português');
  if (language == '2') {
    appLanguage = AppLanguage.portuguese;
  } else {
    appLanguage = AppLanguage.english;
  }

  do {
    if (appLanguage == AppLanguage.portuguese) {
      person.setName(Utils.receiveText('Digite seu nome:').trim());
    } else {
      person.setName(Utils.receiveText('Enter your name:').trim());
    }
  } while (person.getName.isEmpty);


  if (appLanguage == AppLanguage.portuguese){
    person.setWeight(Utils.receiveDouble('Digite seu peso:'));
  } else {
    // pounds = libras
    person.setWeight(Utils.receiveDouble('Enter your weight in pounds:'));
  }

  if (appLanguage == AppLanguage.portuguese){
    person.setHeight(Utils.receiveDouble('Digite sua altura (Exemplo: 1.65):'));
  } else {
    // inches = polegadas
    double feet = Utils.receiveDouble('Enter your height (feet):');
    double inches = Utils.receiveDouble('Enter your height (inches):');
    person.setHeight((feet * 12) + inches);
  }

  // BMI Calculate
  bmi = Utils.bmiCalculate(person.getWeight, person.getHeight, appLanguage);

  if (appLanguage == AppLanguage.english) {
    print('${person.getName}, your BMI is: $bmi ${Utils.getClassificationEn(bmi)}');
  } else {
    print('${person.getName}, seu IMC é: $bmi ${Utils.getClassificationPt(bmi)}');
  }
}