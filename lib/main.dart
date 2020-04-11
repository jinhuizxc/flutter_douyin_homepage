import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//【无聊的编码】利用Flutter一小时做出抖音首页，观看前请先上个厕所
// https://www.bilibili.com/video/BV15J411M71W

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '抖音',
      home: Scaffold(
        body: Container(
          // 设置颜色
          decoration: BoxDecoration(color: Colors.black45),
          child: Home(),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            // 需要设置高度
            height: 60,
            decoration: BoxDecoration(color: Colors.black),
            child: BtmBar(),
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 获取屏幕宽度
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        // 顶部组件
        Positioned(
            top: 0,
            width: screenWidth,
            height: 100,
            child: Container(
//              decoration: BoxDecoration(color: Colors.pinkAccent),
              child: TopBar(),
            )),
        Positioned(
            bottom: 0,
            width: 0.7 * screenWidth,
            height: 150,
            child: Container(
//              decoration: BoxDecoration(color: Colors.red),
              child: BtmContent(),
            )),
        Positioned(
            right: 0,
            top: 0.38 * screenHeight,
            width: 0.25 * screenWidth,
            height: 0.35 * screenHeight,
            child: Container(
//              decoration: BoxDecoration(color: Colors.blueAccent),
              child: getBtnList(),
            )),
        // 底部唱片
        Positioned(
          bottom: 0,
          right: 0,
          width: 0.25 * screenWidth,
          height: 0.25 * screenWidth,
          child: Container(
//            decoration: BoxDecoration(color: Colors.purple),
            child: RotateAlbum(),
          ),
        )
      ],
    );
  }
}

// 关注 推荐的tab
class TopBar extends StatefulWidget {
  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    // 初始化controller  默认推荐： initialIndex: 1
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // 搜索
        Expanded(
          flex: 2,
          child: Icon(Icons.search, color: Colors.white,),
        ),
        // 关注推荐
        Expanded(
            flex: 8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TabBar(
                indicatorColor: Colors.white,
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
                unselectedLabelStyle: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 20,
                ),
                tabs: <Widget>[
                  Text('关注'),
                  Text('推荐'),
                ],
                controller: _tabController,
              ),
            )),
        Expanded(
          flex: 2,
          child: Icon(
            Icons.live_tv,
            color: Colors.white,
          ),
        )
        /* Flexible(
          child: Row(
            children: <Widget>[
              SizedBox(width: 20,),
              Icon(Icons.live_tv, color: Colors.white,)
            ],
          ),
          flex: 2,
        )*/
      ],
    );
  }
}

// 底部bottomBar
class BtmBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // 这种方式:  alignment: Alignment.center,可以居中
          /*Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text('首页'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text('同城'),
          ),
          Expanded(
            flex: 1,
            child: AddIcon(),
          ),
          Expanded(
            flex: 1,
            child: Text('消息'),
          ),
          Expanded(
            flex: 1,
            child: Text('我'),
          ),*/

          getBtmTextWidget('首页', true),
          getBtmTextWidget('同城', false),
          AddIcon(),
          getBtmTextWidget('消息', false),
          getBtmTextWidget('我', false),
        ],
      ),
    );
  }
}

getBtmTextWidget(String content, bool isSelected) {
  return Text("$content",
      style: isSelected
          ? TextStyle(fontSize: 18, color: Colors.white)
          : TextStyle(fontSize: 18, color: Colors.grey[500]));
}

// 中间添加按钮
class AddIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
      height: 35,
      width: 60,
      child: Stack(
        children: <Widget>[
          // 相当于3个container的叠加
          Positioned(
              height: 35,
              width: 50,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.cyan, borderRadius: BorderRadius.circular(3)),
              )),
          Positioned(
              height: 35,
              width: 50,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(3)),
              )),
          Positioned(
              height: 35,
              width: 50,
              right: 5,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3)),
                child: Icon(Icons.add),
              )),
        ],
      ),
    );
  }
}

class BtmContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              '@fighting!！',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              "偶尔无聊谢谢代码偶尔无聊谢谢代码。累也要坚持奔跑，因为路在脚下，没有人可以替你走，加油，骚年，相信你自己！加油，加油，加油",
              style: TextStyle(color: Colors.white),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              children: <Widget>[
                Icon(Icons.album),
                Text(
                  "测试文本",
                  style: TextStyle(color: Colors.white),
                )
                /* Marquee(
              text: '',
            )*/
                /*Marquee(
              text: 'Some sample text that takes some space.',
              style: TextStyle(fontWeight: FontWeight.bold),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              blankSpace: 20.0,
              velocity: 100.0,
              pauseAfterRound: Duration(seconds: 1),
              startPadding: 10.0,
              accelerationDuration: Duration(seconds: 1),
              accelerationCurve: Curves.linear,
              decelerationDuration: Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            )*/
              ],
            ),
          )
        ],
      ),
    );
  }
}

// 唱片组件
class RotateAlbum extends StatefulWidget {
  @override
  _RotateAlbumState createState() => _RotateAlbumState();
}

class _RotateAlbumState extends State<RotateAlbum>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  var animation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    // 旋转动画 ， 这里只是转1次，如果保持一直旋转需要有个小技巧
    animation = RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_controller)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _controller.forward(from: 0.0);
          }
        }),
//      child: Icon(Icons.music_note),
      child: CircleAvatar(
        backgroundImage: NetworkImage(
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586609773992&di=e65dad143df77670db810b913f0e60a5&imgtype=0&src=http%3A%2F%2Fstatic.rong360.com%2Fgl%2Fuploads%2Fallimg%2F180410%2F183-1P41011320JA.jpg'),
      ),
    );

    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: animation,
    );
  }
}

// 右侧按钮
getBtnList() {
  return Column(
    children: <Widget>[
      Container(
        height: 70,
        child: Stack(
          children: <Widget>[
            Container(
              width: 60,
              height: 60,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586607301633&di=4fa1569fc7e7969c7a97f7242e729b37&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Ffront%2F480%2Fw1280h800%2F20190118%2Fmnvz-hrvcwnk3831030.jpg"),
              ),
            ),
            Positioned(
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              bottom: 0,
              left: 18,
            )
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      IconText(
        text: "999w",
        icon: Icon(
          Icons.favorite,
          size: 50,
          color: Colors.redAccent,
        ),
      ),
      IconText(
        text: "352",
        icon: Icon(
          Icons.feedback,
          size: 50,
          color: Colors.white,
        ),
      ),
      IconText(
        text: "999w",
        icon: Icon(
          Icons.refresh,
          size: 50,
          color: Colors.white,
        ),
      ),
    ],
  );
}

// 图标、文字
class IconText extends StatelessWidget {
  final Icon icon;
  final String text;

  IconText({Key key, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          icon,
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
