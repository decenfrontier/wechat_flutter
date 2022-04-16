main(List<String> args) {
  var a = Animal(11);
  var b = Person("ws", 18);
  a.run();
  b.run();
}

class Animal {
  int age;
  Animal(this.age);
  void run() {
    print("animal run");
  }
}

class Person extends Animal {
  String name;
  Person(this.name, int age) : super(age);
  @override  // 注解表示重写, 加不加都行
  void run() {
    print("people run");
  }
}