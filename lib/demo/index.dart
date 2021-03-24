import 'package:flutter/material.dart';
import 'package:my_flutter/demo/http.dart';

class DemoMenu extends StatelessWidget {
  final List _menu = [
    {"name": "导航 Navigation", "route": HttpDemo()},
    {"name": "使用 http请求数据并渲染", "route": HttpDemo()}
  ];

  Widget _listItem(BuildContext context, int index, List mydata) {
    return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              child: Text(
                '${index + 1}、${mydata[index]["name"]}',
                style: TextStyle(
                    // fontSize: 18,
                    // fontWeight: FontWeight.bold,
                    ),
              ),
              style: ButtonStyle(
                alignment: Alignment.centerLeft,
                minimumSize: MaterialStateProperty.all(Size(200, 45))
              ),
              onPressed: () {
                if(index == 1){
                  Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HttpDemo()));
                }
              },
            ),
            Divider()
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: ListView.builder(
                itemCount: _menu.length,
                itemBuilder: (BuildContext context, int index) {
                  return _listItem(context, index, _menu);
                })));
  }
}
