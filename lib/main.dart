import 'package:flutter/material.dart';
import 'package:my_flutter/http.dart';
import 'package:my_flutter/list.dart';
import 'package:my_flutter/flutter_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '老徐的 Flutter Demo',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
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
      body: Tab1Page(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '学习清单',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
    // #docregion _buildButtonColumn
  }
}


// tab1
class Tab1Page extends StatelessWidget {
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HttpDemo()));
            },
          ),
          ElevatedButton(
            child: Text('学习清单'),
            onPressed: () {
              // Navigate to second route when tapped.
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StudyList()));
            },
          ),
          ElevatedButton(
            child: Text('demo'),
            onPressed: () {
              // Navigate to second route when tapped.
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FlutterDemo()));
            },
          ),
        ],
      );
  }
}

// tab2
class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('tab2')
    );
  }
}





