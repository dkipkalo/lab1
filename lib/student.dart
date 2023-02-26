class Student {
  String _firstName;

  String get firstName => _firstName;

  set firstName(String customFirstName) => _firstName = customFirstName;
  String secondName;
  int age;

  Student(this._firstName, this.secondName, this.age);
}
