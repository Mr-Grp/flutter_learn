import 'package:flutter/material.dart';

class OopLearn extends StatelessWidget {
  const OopLearn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20, color: Colors.black);
    return Scaffold(
      appBar: AppBar(title: Text('面向对象')),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                  onPressed: _constructor, child: Text('构造器', style: textStyle)),
              MaterialButton(
                  onPressed: _abstract, child: Text('抽象', style: textStyle)),
              MaterialButton(
                  onPressed: _mixins, child: Text('mixins', style: textStyle)),
              Text(
                '（ 结果在控制台查看 ）',
                style: TextStyle(fontSize: 16, color: Colors.deepOrange),
              ),
            ],
          ),
        ),
      ),
    ) ;
  }

  void _constructor() {
    Student student = Student('bjut', '小明', 12, '男', city: '北京');
    print(student.toString());
    Student student1 = Student.copyStudent(student);
    print(student1.toString());
    Student student2 = Student.copyStudentFactory(student);
    print(student2.toString());
    print(student2.school);
    student2.school = '北工大';
    print(student2.school);
  }

  void _abstract() {
    StudyPerson studentPerson = StudyPerson();
    studentPerson.say();
    studentPerson.study();
  }

  void _mixins() {
    PinkBird pinkBird = PinkBird();
    pinkBird.eat();
    pinkBird.fly();
  }
}


/// 父类
/// 所有的类都继承自 Object
class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

/// 子类
/// 继承父类，需要调用父类构造器 super
class Student extends Person {
  String _school; // 通过下划线来标识私有字段
  String city;
  String country;
  String gender;

  /// 标准构造方法
  /// 通过 this.xxx 初始化自有参数
  /// { } 是默认参数和可选参数，自 dart 2.12 开始非空检测必须初始化，要么有默认值，要么加上必填标识
  /// 参数都要初始化，在构造方法体之前
  /// Student student = Student('bjut', '小明', 12, '男', city: '北京');
  Student(this._school, String name, int age, String gender,
      {this.city, this.country = 'China'})
      : // 初始化列表（:以后的所有内容都是初始化列表）除了调用构造器，在子类构造器方法体之前，也可以初始化实例变量，不同的初始化变量之间用逗号分隔，如果不需要可以省略（冒号开始到方法体之前）
        this.gender = gender,
        super(name, age) {
    /// 方法体(不是必须的，可以省略 [{ }] 整体 )
    // print(this);
  }

  /// 命名构造方法
  /// Student student1 = Student.copyStudent(student);
  Student.copyStudent(Student student):
      this._school = student._school,
      this.city = student.city,
      this.country = student.country,
      this.gender = student.gender,
      super(student.name, student.age);


  /// 工厂构造器方法
  /// 一个方法，可以返回一个实例
  /// 和标准构造方法不能同时出现（名称相同）
  // factory Student(Student student) {
  //   return Student.copyStudent(student);
  // }

  /// 工厂命名构造器方法
  factory Student.copyStudentFactory(Student student){
    return Student.copyStudent(student);
  }

  /// get set 修改私有变量
  String get school => _school;

  set school(String school) {
    _school = school;
  }

  // 多态：重写父类方法（toString 是 Object 方法）
  @override
  String toString() {
    return 'name:$name age:$age school:$_school city:$city country:$country gender:$gender';
  }

}

/// 抽象
/// 不能实例
/// 可以有没有方法体的方法（抽象方法）也可以有有方法体的方法
/// 但是抽象方法必须在抽象类
abstract class Study1 {
  void study();
  void say() {
    print('day day up');
  }
}

class StudyPerson extends Study1 {

  @override
  void study() {
    print('study');
  }
}


/// mixins
/// 为类添加特征
/// 通过非继承的方式来复用类中的代码
/// 要使用 mixins ，在 with 关键字后面跟上一个或多个 mixin 的名字，用逗号分隔，并且 with 要用在 extends 关键字之后
/// 特征：实现 mixins，必须创建一个继承 Object 的子类，不声明任何构造方法，不调用 super （是不是抽象类都可以）

// 父类
class Animal {
  eat() {
    print('eat');
  }
}

class Bird {
  fly() {
    print('fly');
  }
}

class PinkBird extends Animal with Bird {

}