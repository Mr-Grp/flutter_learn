
import 'package:flutter/material.dart';

class GenericTest extends StatelessWidget {
  const GenericTest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20, color: Colors.black);
    return Scaffold(
      appBar: AppBar(title: Text('泛型')),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                  onPressed: _generic , child: Text('泛型', style: textStyle)),
              MaterialButton(
                  onPressed: _genericExtends , child: Text('泛型继承', style: textStyle)),
              Text(
                '（ 结果在控制台查看 ）',
                style: TextStyle(fontSize: 16, color: Colors.deepOrange),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _generic() {
    Cache<String> cache1 = new Cache();
    cache1.setItem('1', '1');
    print(cache1.getItem('1'));
  }

  void _genericExtends() {
    Student<Person> student = new Student();
  }
}

/// 提高代码复用度
/// 对不特定数据类型支持
class Cache<T> {
  static final Map<String, Object> _cached = Map();

  void setItem(String key, T value) {
    _cached[key] = value;
  }

  T getItem(String key) {
    return _cached[key] as T;
  }

}


/// 泛型继承
class Person {
  String name;
  Person(this.name);
}

class Student<T extends Person> {
    List<T> list = [];
}