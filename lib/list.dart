import 'package:flutter/material.dart';

class StudyList extends StatelessWidget {
  final _data = [
    ["Flutter项目安装配置", 1],
    ["Flutter VScode插件安装配置", 1],
    ["成功在模拟器和手机中启动第一个hello word程序", 1],
    ["Dart语言基础学习", 1],
    ["学习web开发的html/css效果 在Flutter中对应如何实现", 1],
    ["Flutter 中路由", 0],
    ["Flutter中如何使用package", 1],
    ["Flutter http数据获取，并渲染异步数据", 0],
    ["Flutter Basic Widgets", 0],
    ["Flutter Layout Widgets", 0],
    ["Flutter Scrolling widgets", 0],
    ["Flutter Assets, images, and icon widgets", 0],
    ["Flutter Material Components widgets", 0],
    ["Flutter Text widgets", 0],
  ];

  Widget _listItem(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.only(left: 20,top: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            '${index+1}、${_data[index][0]}',
            style: TextStyle(
              color: _data[index][1] == 1? Colors.green: Colors.black45,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('老徐Flutter 学习清单'),
          ),
          body: ListView.builder(
            itemCount: _data.length,
            itemBuilder: _listItem,
          )),
    );
  }
}
