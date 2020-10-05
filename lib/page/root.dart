import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root>  with SingleTickerProviderStateMixin {

  final List<Tab> tabs = [
    Tab(text: "Home"),
    Tab(text: "Works"),
    Tab(text: "Contact")
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 64,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                navBar(),
                SizedBox(width: 48,)
              ],
            ),
            SizedBox(height: 0,)
          ],
        ),
      ),
      body: Scrollbar(
        radius: Radius.circular(2),
        child: tabBarView(),
      ),
    );
  }

  TabBar navBar() {
    return TabBar(
      labelPadding: EdgeInsets.fromLTRB(16, 4, 16, 0),
      labelColor: Colors.white,
      labelStyle: TextStyle(fontSize: 16),
      unselectedLabelColor: Colors.black,
      unselectedLabelStyle: TextStyle(fontSize: 16),
      indicator: BubbleTabIndicator(
        indicatorHeight: 38,
        indicatorRadius: 8,
        indicatorColor: Colors.black,
        padding: EdgeInsets.zero
      ),
      isScrollable: true,
      controller: _tabController,
      tabs: tabs,
    );
  }

  TabBarView tabBarView() {
    final contents = [
        Container(
          color: Colors.blue[200],
          child: Center(child: Text("1"),),
        ),
        Container(
          color: Colors.blue[400],
          child: Center(child: Text("2"),),
        ),
        Container(
          color: Colors.blue[600],
          child: Center(child: Text("3"),),
        )
      ];
    return TabBarView(
      controller: _tabController,
      physics: ClampingScrollPhysics(),
      children: contents,
    );
  }
}