import 'package:flutter/material.dart';

class FlutterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // #enddocregion _buildButtonColumn
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    '主标题主标题主标题主标题主标题主标题',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '子标题子标题子标题子标题子标题',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );

    // #docregion buttonSection
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );
    // #enddocregion buttonSection

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Flutter 是谷歌公司开发的一款开源、免费的移动 UI 框架，可以让我们快速的在Android 和 iOS 上构建高质量 App。它最大的特点就是跨平台、以及高性能。Flutter 基于谷歌的 Dart 语言，如果没有任何 Dart 语言的基础，不建议直接学习Flutter。建议先学习Dart语言的基本语法。然后再进入 Flutter 的学习',
        softWrap: true,
      ),
    );
    return MaterialApp(
      title: '老徐的 Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('老徐的 Flutter Demo'),
        ),
        body: Column(
          children: [
            // Image.asset(
            //   'images/lake.png',
            //   width: 600,
            //   height: 240,
            //   fit: BoxFit.cover,
            // ),
            Image(
              image: AssetImage('images/lake.png'),
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );

    // #docregion _buildButtonColumn
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
