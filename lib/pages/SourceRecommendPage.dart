/// recommend_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SourceRecommendPage extends StatefulWidget {
  @override
  _SourceRecommendPageState createState() => _SourceRecommendPageState();
}

class _SourceRecommendPageState extends State<SourceRecommendPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<String> imageList = List();

  @override
  void initState() {
    imageList
      ..add(
        'http://www.di5cheng.com/uploads/product/2019-08-01/15646284271056.jpg',
      )
      ..add(
        'http://www.di5cheng.com/uploads/evidence/100x100/2017-07-10/14996648968814.jpg',
      )
      ..add(
        'http://www.di5cheng.com/uploads/evidence/100x100/2016-10-09/14759786608110.png',
      )
      ..add(
        'http://www.di5cheng.com/uploads/product/2019-08-01/15646225656663.jpg',
      );

    super.initState();
    print('recommend initState');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(
                0,
                ScreenUtil.getInstance().setWidth(10),
                0,
                ScreenUtil.getInstance().setWidth(30)),
            child: AspectRatio(
              aspectRatio: 2 / 1,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(
                        ScreenUtil.getInstance().setWidth(10),
                        0,
                        ScreenUtil.getInstance().setWidth(10),
                        0),
                    // 用Container实现图片圆角的效果
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imageList[index]),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(ScreenUtil.getInstance().setWidth(15)),
                      ),
                    ),
                  );
                },
                itemCount: 4,
                viewportFraction: 0.9,
              ),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _onTap,
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(
                    ScreenUtil.getInstance().setWidth(20),
                    0,
                    0,
                    0,
                  ),
                  width: ScreenUtil.getInstance().setWidth(250),
                  height: ScreenUtil.getInstance().setWidth(200),
                  child: Image.network(
                    'http://www.di5cheng.com/uploads/product/2019-08-01/15646284271056.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    // color: Colors.red,
                    margin: EdgeInsets.only(
                      right: ScreenUtil.getInstance().setWidth(25),
                    ),
                    padding: EdgeInsets.only(
                      left: ScreenUtil.getInstance().setWidth(25),
                    ),
                    height: ScreenUtil.getInstance().setWidth(200),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          height: ScreenUtil.getInstance().setWidth(150),
                          child: Text(
                            '张家港-东营 甲苯 100吨张家港-100吨张家港东营 甲苯 100吨',
                            style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(38),
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Container(
                          height: ScreenUtil.getInstance().setWidth(50),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                child: Text('五城小编'),
                                left: 0,
                                bottom: 0,
                              ),
                              Positioned(
                                child: Text('浏览：100'),
                                right: 0,
                                bottom: 0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onTap() {
    print('onPress');
  }

  Widget header(BuildContext context) {
    return Image.network(
        'http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage06.jpg');
  }
}
