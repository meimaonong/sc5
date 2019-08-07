import 'package:flutter/material.dart';
import 'package:sc5/pages/SourcePage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('货单')),
    BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('运单')),
    BottomNavigationBarItem(icon: Icon(Icons.message), title: Text('我的')),
  ];

  final bodyList = [
    SourcePage(),
    Text('运单'),
    Text('个人中心'),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromRGBO(0, 0, 0, 1),
        unselectedItemColor: Color.fromRGBO(125, 125, 125, 1),
        items: items,
        currentIndex: currentIndex,
        onTap: onTap,
      ),
      body: IndexedStack(
        index: currentIndex,
        children: bodyList,
      ),
    );
  }
}
