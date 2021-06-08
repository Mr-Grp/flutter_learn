import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/dart/data_type.dart';
import 'package:flutter_learn/pages/dart/generic_learn.dart';
import 'package:flutter_learn/pages/dart/index.dart';
import 'package:flutter_learn/pages/dart/method.dart';
import 'package:flutter_learn/pages/dart/oop.dart';
import 'package:flutter_learn/pages/study/evet.dart';
import 'package:flutter_learn/pages/study/index.dart';
import 'package:flutter_learn/pages/study/layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Study',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Study'),
      routes: <String, WidgetBuilder>{
        'layout': (BuildContext context) => Layout(),
        'event': (BuildContext context) => Event(),
        'dart_number': (BuildContext context) => DataType(),
        'dart_oop': (BuildContext context) => OopLearn(),
        'dart_method': (BuildContext context) => Method(),
        'dart_generic': (BuildContext context) => GenericTest(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,  this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    bottomNavigationBar: BottomNavigationBar(
      //item > 3时必须要设置,不然未选中项字体颜色变白
      currentIndex: _currIndex,
      onTap: (index) {
        setState(() {
          _currIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '布局'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dart')
      ],
    ),
      body: _getPage()
    );
  }

  _getPage() {
    switch(_currIndex) {
      case 0: {
        return Study();
      }
      case 1: {
        return Dart();
      }
    }
  }
}
