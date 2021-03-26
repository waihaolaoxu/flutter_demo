import 'package:flutter/material.dart';

import 'package:my_flutter/studying_list.dart';
import 'package:my_flutter/demo/http.dart';
import 'package:my_flutter/demo/flutter_demo.dart';
import 'package:my_flutter/demo/index.dart';
import 'package:my_flutter/demo/demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '老徐的 Flutter Demo',
      // home: Home(),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/demo/flutter_demo': (context) => FlutterDemo(),
        '/demo/http': (context) => HttpDemo(),
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    DemoMenu(),
    StudyList()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('老徐的 Flutter Demo'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Demo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '学习清单',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
    // #docregion _buildButtonColumn
  }
}

// tab1
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'images/lake.png',
          width: 600,
          height: 240,
          fit: BoxFit.cover,
        ),
        ElevatedButton(
          child: Text('跳转http页面'),
          onPressed: () {
            // Navigate to second route when tapped.
            Navigator.pushNamed(context, '/demo/http');
          },
        ),
        ElevatedButton(
          child: Text('Flutter demo'),
          onPressed: () {
            // Navigate to second route when tapped.
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FlutterDemo()));
          },
        ),
        ElevatedButton(
          child: Text('demo'),
          onPressed: () {
            // Navigate to second route when tapped.
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Demo()));
          },
        ),
      ],
    );
  }
}
