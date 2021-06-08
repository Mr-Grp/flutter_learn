
import 'package:flutter/material.dart';

class Dart extends StatefulWidget {
  const Dart({Key key}) : super(key: key);

  @override
  _DartState createState() => _DartState();
}

class _DartState extends State<Dart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(50),
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _block('数字', 'dart_number'),
            _block('面向对象', 'dart_oop'),
            _block('泛型', 'dart_generic'),
            _block('方法', 'dart_method'),
          ],
        ),
      )
    );
  }

  _block(String title, String routeName) {
    TextStyle textStyle = TextStyle(fontSize: 30, color: Colors.white);
    return (GestureDetector(
      // 手势
        onTap: () {
          // 点击事件
          Navigator.pushNamed(context, routeName);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(
            color: Colors.lightGreen,
            width: 100,
            height: 100,
            child: Text(title, style: textStyle),
          ),
        )));
  }

}
