import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/models/user_model.dart';
import 'package:flutter_social_ui/widget/customdrawer.dart';
import 'package:flutter_social_ui/widget/following.dart';
import 'package:flutter_social_ui/widget/post.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController=PageController( initialPage: 0,viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        title: Text(
          'TEMENAN',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
              color: Colors.amber),
        ),
        bottom: TabBar(
            labelColor: Colors.blue,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.blueAccent,
            controller: _tabController,
            indicatorWeight: 4.0,
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
            tabs: [
              Tab(
                text: "Treading",
              ),
              Tab(
                text: "Laste",
              )
            ]),
      ),
      drawer: CustomDrawer(),
      body: ListView(
        children: [
          Following(),
          PostCaraousel(
            pageController:_pageController,
            title: 'Post',
            posts: posts,
          )
          ],
      ),
    );
  }
}
