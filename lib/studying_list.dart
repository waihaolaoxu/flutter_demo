import 'dart:convert';
import 'package:flutter/material.dart';

class StudyList extends StatelessWidget {
  Widget _listItem(BuildContext context, int index, List mydata) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          '${index + 1}、${mydata[index][0]}',
          style: TextStyle(
            color: mydata[index][1] == 1 ? Colors.green : Colors.black45,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/js/list.json'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var mydata = jsonDecode(snapshot.data);
                // return ListView(children: [
                //   for (var i = 0; i < mydata.length; i++)
                //     _listItem(context, i, mydata)
                // ]);
                return ListView.builder(
                  itemCount: mydata.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _listItem(context, index, mydata);
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
