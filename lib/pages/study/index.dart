import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/study/layout.dart';

import 'evet.dart';

class Study extends StatefulWidget {
  Study({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StudyState createState() => _StudyState();
}

class _StudyState extends State<Study> {
  bool switchByName = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          SwitchListTile(
              title: Text('${switchByName ? '' : '不'}通过路由名称跳转'),
              value: switchByName,
              onChanged: (value) {
                setState(() {
                  switchByName = value;
                });
              }),
          Padding(
            padding: EdgeInsets.all(50),
            child: Wrap(
              spacing: 8,
              runSpacing: 6,
              children: [
                _block('布局', Layout(), 'layout'),
                _block('事件', Event(), 'event'),
              ],
            ),
          )
        ],
      ),
    );
  }

  _block(String title, page, String routeName) {
    TextStyle textStyle = TextStyle(fontSize: 30, color: Colors.white);
    return (GestureDetector(
        // 手势
        onTap: () {
          // 点击事件
          if (switchByName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
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
