import 'package:flutter/material.dart';

class Method extends StatelessWidget {
  const Method({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20, color: Colors.black);
    return Scaffold(
      appBar: AppBar(title: Text('方法')),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                  onPressed: (){ print(_sum(1, 2));}, child: Text('私有方法', style: textStyle)),
              MaterialButton(
                  onPressed:_list, child: Text('匿名方法', style: textStyle)),
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

  int _sum(int var1, int var2) {
    return var1 + var2;
  }

  _list() {
    var list = [1, 2, 3];
    // 匿名方法
    list.forEach((element) { print(element); });
  }
}
