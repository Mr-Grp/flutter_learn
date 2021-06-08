import 'package:flutter/material.dart';

String flutterLogo =
    'https://flutter.cn/assets/flutter-lockup-1caf6476beed76adec3c477586da54de6b552b2f42108ec5bc68dc63bae2df75.png';

class Layout extends StatelessWidget {
  const Layout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return Scaffold(
        appBar: AppBar(
          title: Text('布局'),
        ),
        body: Container(
            child: ListView(
      children: [
        Column(
          children: <Widget>[
            Text('透明度  & 圆形 & 矩形', style: textStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // 内容水平居中
              children: [_getOpacity(), _getRectWidget(), _getOvalWidget()],
            ),
            Text('Padding', style: textStyle),
            _getPaddingWidget(),
            Text('SizedBox', style: textStyle),
            SizedBox(
              width: 100,
              height: 100,
              child: Container(color: Colors.lightBlue),
            ),
            Text('PhysicalModel', style: textStyle),
            _getPhysicModelWidget(),
            Text('FractionallySizedBox', style: textStyle),
            _getFractionallySizedBox(),
            Text('Stack & Positioned', style: textStyle),
            Stack(
              children: [
                _getRectWidget(),
                Positioned(
                  child: Container(
                    color: Colors.yellow,
                    width: 30,
                    height: 30,
                  ),
                  left: 10,
                  bottom: 10,
                )
              ],
            ),
            Text('Wrap', style: textStyle),
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: <Widget>[
                _chip('flutter'),
                _chip('flutter'),
                _chip('flutter'),
                _chip('flutter'),
                _chip('flutter')
              ],
            ),
            Text('expended', style: textStyle),
            Container(
              color: Colors.lightBlue,
              height: 400,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.yellow,
                      child: Text('内容'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    )));
  }

  _getOpacity() {
    return Opacity(
        opacity: 0.3,
        child: Image.network(flutterLogo, width: 100, height: 100));
  }

  _getOvalWidget() {
    return ClipOval(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.lightBlue,
      ),
    );
  }

  _getRectWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: 100,
        height: 100,
        color: Colors.lightBlue,
      ),
    );
  }

  _getPhysicModelWidget() {
    return PhysicalModel(
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.antiAlias, // 抗锯齿
        color: Colors.lightBlue,
        child: Container(width: 100, height: 100));
  }

  _getPaddingWidget() {
    return Container(
      color: Colors.lightBlue,
      width: 100,
      height: 100,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 30, 0),
        child: Container(
          color: Colors.yellow,
        ),
      ),
    );
  }

  _getFractionallySizedBox() {
    return FractionallySizedBox(
        widthFactor: 1, // 宽度占比
        child: Container(
          color: Colors.lightBlue,
          child: Text('FractionallySizedBox'),
        ));
  }

  _chip(String label) {
    return Chip(
      label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade50,
        child: Text(label.substring(0, 1)),
      ),
    );
  }
}
