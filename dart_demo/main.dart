main(List<String> args) {
  var dd = {
    "aa": 11,
    "bb": "22",
  };
  var a = Animal(11, dd);
}

class Animal {
  int age;
  dynamic dd;
  Animal(this.age, dd);
  void run() {
    print("animal run");
  }
}

class Person extends Animal {
  String name;
  Person(this.name, int age) : super(age);
  @override // 注解表示重写, 加不加都行
  void run() {
    print("people run");
  }
}
