import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:portfolio/theme.dart';
import 'package:portfolio/page/tabs/tab_contact.dart';
import 'package:portfolio/page/tabs/tab_home.dart';
import 'package:portfolio/page/tabs/tab_works.dart';

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

  FloatingActionButton scrollUpButton;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length, initialIndex: 1);
    scrollUpButton = null;
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
        elevation: 4,
        backgroundColor: Colors.white,
        toolbarHeight: WebTheme.appBarHeight,
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
      body: tabView(),
      floatingActionButton: scrollUpButton,
    );
  }

  TabBar navBar() {
    return TabBar(
      labelPadding: EdgeInsets.fromLTRB(16, 4, 16, 0),
      labelColor: Colors.white,
      labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      unselectedLabelColor: Colors.black,
      unselectedLabelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      indicator: BubbleTabIndicator(
        indicatorHeight: 38,
        indicatorRadius: 8,
        indicatorColor: Colors.black,
        padding: EdgeInsets.zero
      ),
      isScrollable: true,
      controller: _tabController,
      tabs: tabs
    );
  }

  Widget tabView() {
    final contents = [
        HomeTab(),
        WorksTab(),
        ContactTab()
      ];
    return TabBarView(
      controller: _tabController,
      physics: NeverScrollableScrollPhysics(),
      children: contents,
    );
  }
}