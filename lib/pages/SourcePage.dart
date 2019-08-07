import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './SourceRecommendPage.dart';

class _TabData {
  final Widget tab;
  final Widget body;
  _TabData({this.tab, this.body});
}

final _tabDataList = <_TabData>[
  _TabData(tab: Text('推荐'), body: SourceRecommendPage()),
  _TabData(tab: Text('甲醇'), body: Text('甲醇页')),
  _TabData(tab: Text('甲苯'), body: Text('甲苯页')),
];

class SourcePage extends StatefulWidget {
  @override
  _SourcePageState createState() => _SourcePageState();
}

class _SourcePageState extends State<SourcePage>
    with SingleTickerProviderStateMixin {
  final tabBarList = _tabDataList.map((item) => item.tab).toList();
  final tabBarViewList = _tabDataList.map((item) => item.body).toList();

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: _tabDataList.length)
      ..addListener(() {
        if (tabController.index.toDouble() == tabController.animation.value) {
          switch (tabController.index) {
            case 0:
              print(1);
              break;
            case 1:
              print(2);
              break;
            case 2:
              print(3);
              break;
          }
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return DefaultTabController(
      length: tabBarList.length,
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: ScreenUtil.getInstance().setWidth(150),
            padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
            alignment: Alignment.centerLeft,
            // color: Colors.white,
            child: TabBar(
              controller: tabController,
              onTap: onTap,
              isScrollable: true,
              indicator: BoxDecoration(),
              unselectedLabelColor: Color.fromRGBO(100, 100, 100, 1),
              unselectedLabelStyle:
                  TextStyle(fontSize: ScreenUtil.getInstance().setSp(40)),
              labelColor: Colors.black,
              labelStyle: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(40),
                fontWeight: FontWeight.bold,
              ),
              tabs: tabBarList,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: tabBarViewList,
            ),
          ),
        ],
      ),
    );
  }
}
