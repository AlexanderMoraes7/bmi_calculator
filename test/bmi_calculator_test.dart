import 'package:bmi_calculator/classes/person.dart';
import 'package:bmi_calculator/enum/app_language.dart';
import 'package:bmi_calculator/models/utils.dart';
import 'package:test/test.dart';

void main() {
  Person person = Person();

  // --- Person setters/getters ---
  test('Verify name input', () {
    person.setName('Peter');
    expect(person.getName, 'Peter');
  });

  test('Verify height input', () {
    person.setHeight(67);
    expect(person.getHeight, 67);
  });

  test('Verify weight input', () {
    person.setWeight(242.5);
    expect(person.getWeight, 242.5);
  });

  // --- BMI calculation ---
  test('Verify BMI calculate (imperial)', () {
    expect(Utils.bmiCalculate(242.5, 67, AppLanguage.english), 37.98);
  });

  test('Verify BMI calculate (metric)', () {
    // 70kg, 1.75m => 70 / (1.75 * 1.75) = 22.86
    expect(Utils.bmiCalculate(70, 1.75, AppLanguage.portuguese), 22.86);
  });

  // --- Portuguese classification ---
  test('Classification PT: Magreza grave (< 16)', () {
    expect(Utils.getClassificationPt(15), 'Magreza grave');
  });

  test('Classification PT: Magreza moderada (16 a < 17)', () {
    expect(Utils.getClassificationPt(16.5), 'Magreza moderada');
  });

  test('Classification PT: Magreza leve (17 a < 18.5)', () {
    expect(Utils.getClassificationPt(18), 'Magreza leve');
  });

  test('Classification PT: Saudável (18.5 a < 25)', () {
    expect(Utils.getClassificationPt(22), 'Saudável');
  });

  test('Classification PT: Sobrepeso (25 a < 30)', () {
    expect(Utils.getClassificationPt(27), 'Sobrepeso');
  });

  test('Classification PT: Obesidade Grau I (30 a < 35)', () {
    expect(Utils.getClassificationPt(32), 'Obesidade Grau I');
  });

  test('Classification PT: Obesidade Grau II (35 a < 40)', () {
    expect(Utils.getClassificationPt(37), 'Obesidade Grau II (severa)');
  });

  test('Classification PT: Obesidade Grau III (>= 40)', () {
    expect(Utils.getClassificationPt(41), 'Obesidade Grau III (móbida)');
  });

  // --- English classification ---
  test('Classification EN: Severe thinness (< 16)', () {
    expect(Utils.getClassificationEn(15), 'Severe thinness');
  });

  test('Classification EN: Moderate thinness (16 a < 17)', () {
    expect(Utils.getClassificationEn(16.5), 'Moderate thinness');
  });

  test('Classification EN: Mild thinness (17 a < 18.5)', () {
    expect(Utils.getClassificationEn(18), 'Mild thinness');
  });

  test('Classification EN: Normal range (18.5 a < 25)', () {
    expect(Utils.getClassificationEn(22), 'Normal range');
  });

  test('Classification EN: Overweight (25 a < 30)', () {
    expect(Utils.getClassificationEn(27), 'Overweight');
  });

  test('Classification EN: Class I obesity (30 a < 35)', () {
    expect(Utils.getClassificationEn(32), 'Class I obesity');
  });

  test('Classification EN: Class II obesity (35 a < 40)', () {
    expect(Utils.getClassificationEn(37), 'Class II obesity (Severe obesity)');
  });

  test('Classification EN: Class III obesity (>= 40)', () {
    expect(Utils.getClassificationEn(41), 'Class III obesity (Morbid obesity)');
  });
}
