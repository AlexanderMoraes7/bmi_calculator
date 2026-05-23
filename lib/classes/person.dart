class Person {
  
  String? _name;
  double _weight = 0;
  double _height = 0;

  void setName(String name) {
    _name = name;
  }

  String get getName => _name!;

  void setWeight(double weight) {
    _weight = weight;
  }

  double get getWeight => _weight;

  void setHeight(double height) {
    _height = height;
  }

  double get getHeight => _height;
}