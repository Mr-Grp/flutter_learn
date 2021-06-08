import 'package:flutter/material.dart';

class DataType extends StatelessWidget {
  const DataType({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20, color: Colors.black);
    return Scaffold(
      appBar: AppBar(title: Text('数字')),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              MaterialButton(
                  onPressed: _int, child: Text('数字类型', style: textStyle)),
              MaterialButton(
                  onPressed: _string, child: Text('字符串类型', style: textStyle)),
              MaterialButton(
                  onPressed: _bool, child: Text('布尔类型', style: textStyle)),
              MaterialButton(
                  onPressed: _list, child: Text('列表', style: textStyle)),
              MaterialButton(
                  onPressed: _map, child: Text('集合', style: textStyle)),
              MaterialButton(
                  onPressed: _dynamicAndVarAndObject,
                  child: Text('dynamic var Object', style: textStyle)),
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

  void _int() {
    num num1 = -1.0; // 是数字类型的父类
    num num2 = 2; // 是数字类型的父类
    int int1 = 3; // 只能是整数
    double d1 = 1.68; // 双精度
    print("num:$num1 num:$num2 int$int1 double:$d1");
    print(num1.abs()); // 求绝对值
    print(num1.toInt()); // 转换成 int
    print(num1.toDouble()); // 转换成 double
  }

  void _string() {
    String str1 = '字符串1', str2 = "字符串2";
    String str3 = str1 + str2; // 字符串拼接
    String str4 = "$str1$str2"; // 字符串拼接（变量可以是数字，也可以是字符串）
    print("$str1 $str2 $str3 $str4");

    /// 常用方法
    String str5 = '测试：字符串截取测试';
    print(str5.substring(1, 5)); // 字符串截取，[start, end)
    print(str5.indexOf('类型')); // 找打某个位置的索引
    print(str5.startsWith('类型')); // 是否以 xxx 开头
    print(str5.replaceAll('测试', 'test')); // 字符串替换
    print(str5.contains('测试')); // 是否包含
    print(str5.split('测试')); // 字符串分割
  }

  void _bool() {
    bool success = true, fail = false;
    print(success);
    print(fail);
    print(success || fail);
    print(success && fail);
  }

  void _list() {
    // 字面量方式创建集合
    List list1 = [1, 2, 3, true, '1', 1]; // 初始化添加元素
    print(list1);

    // 通过生成函数创建集合
    List list2 = List.generate(3, (index) => index * 2);
    print(list2);

    // 动态添加元素
    list1.add(true);
    print(list1);

    // 指定集合的类型
    List<int> list3 = [1, 2, 3]; // 只能添加数字类型，其他类型会报错
    print(list2);

    // 集合的赋值：子类可以赋值个父类，翻过来报错
    list1 = list3; // 可以
    // list3 = list1; // 报错，list 3 是子类型，编辑器不提示，但应该是编译时报错


    list1 = [1, 2, 3, true, '1'];
    // for 循环
    print('=====for=====');
    for(int i = 0; i < list1.length; i++) {
      print(list1[i]);
    }

    print('=====for in=====');
    // for in, 这里如果 不用 var 指定，运行时类型匹配不上会报错(运行时报错)
    for(var o in list1) {
      print(o);
    }

    print('=====forEach=====');
    // forEach 遍历,
    list1.forEach((element) {
      print(element);
    });


    print('=====常用操作=====');
    list1 = [1, 2, 3, true, '1', 1];
    /// 集合操作
    print(list1.remove(1)); // 删除匹配到的第一个值，返回 bool
    print(list1);

    print(list1.removeAt(1)); // 删除某个索引，返回被删掉的元素
    print(list1);

    print(list1.removeLast()); // 删除最后一个值，返回被删掉的元素
    print(list1);

    list1.removeWhere((element) => element == true); // 通过表达式删除，没有返回值
    print(list1);

    list1.removeRange(1, 2); // 删除 [start, end) 范围越界运行时会报错，没有返回值
    print(list1);

    list1.insert(1, 0); // 在某个位置插入，没有返回值
    print(list1);

    list1.insertAll(1, [3, 3]); // 插入一个可迭代对象，内容会依次被插入，没有返回值
    print(list1);

    print(list1.sublist(2, 3)); // 截取 [start, end) ，不会改变原数组，返回子数组
    print(list1);

    print(list1.indexOf(3)); // 返回匹配到的第一个索引


  }

  void _map() {
    // key value 对象
    /// MAP 初始化,字面量方式,最后一个逗号可以省略
    Map names = {
      1: 2,
      'name': '小明',
    };
    print(names);

    // 添加元素
    names['age'] = 14;
    names[4] = 1;
    print(names);

    /// 遍历
    print('=====forEach=====');
    names.forEach((key, value) {
      print(key);
      print(value);
    });

    print('=====map=====');
    print(names.map((key, value) {
      print(key);
      print(value);
      return MapEntry(value, key); // 颠倒
    }));

    print('=====for in=====');
    // 利用的还是数组遍历
    for (var key in names.keys) {
      print(names[key]);
    }

    print(names.keys); // 获取所有 key
    print(names.values); // 获取所有 value
    print(names.remove('name')); // 删除key 返回 删掉的值，没有 key 返回 null（这里可以没有）
    print(names.containsKey('age')); // 是否包含某个 key，返回 bool
  }

  void _dynamicAndVarAndObject() {
    // dynamic var Object 区别
    /// dynamic
    /// 所有 Dart 对象的基础类型
    /// 运行时推测数据类型，编译时不检测，会导致静态类型检查失效
    dynamic x = 'hello';
    print(x.runtimeType);
    print(x);
    x = 1; // 数据类型可以改变
    print(x);
    // x.dp(); // 运行时会报错
    // x();  // 运行时会报错

    /// var
    /// 一个关键字
    /// 一旦赋值，类型就会被定义，可用于遍历不知道值类型的情况
    var a = 'hello';
    print(a.runtimeType);
    print(a);
    // a = 1; // 编译报错，数据类型不可以改变
    // a.dp(); // 编译报错，String 没有方法
    // a(); // 编译报错，String 不是方法

    /// Object
    /// 对象类型
    /// 会产生一个对象，上面会有 Object 内置的方法，值本身可改变，runtimeType 是值得类型
    /// 如果调用 Object 不存在的方法会报错，因为它的数据类型是确切的，就是对象
    Object b = '1';
    print(b.runtimeType);
    print(b);
    b = 1; // 可以改变类型
    // b(); // Object 对象不能被执行
    // b.dp(); // 编译报错， Object 没有 dp 这个方法，它的数据类型是确切的，就是对象
  }
}
