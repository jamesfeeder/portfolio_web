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
  PageController _pageController;
  
  // Trigger TabBar to the next tab when XX% [0.XX] of prev. page
  double preTrigger = 0.9;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
    _tabController.addListener(syncTabBar);
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(onPageChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void changePageWithTabBar(int index) {
    _pageController.animateToPage(
      index, 
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut
    ); 
  }

  void syncTabBar() {
    if (!_tabController.indexIsChanging) {
      if (_tabController.index != _pageController.page.toInt()) {
        //changeTabBar(_pageController.page.toInt());
        if (_pageController.page > _pageController.page.toInt()+preTrigger) {
          changeTabBar(_pageController.page.toInt()+1);
        } else {
          changeTabBar(_pageController.page.toInt());
        }
      }
    }
  }

  void onPageChanged() {
    //print("PageView: ${_pageController.page}, PageView(Int): ${_pageController.page.toInt()}");
    if (_pageController.page > 0) {
      // Do something
    }
    if (!_tabController.indexIsChanging) {
      if (_pageController.page > _pageController.page.toInt()+preTrigger) {
        changeTabBar(_pageController.page.toInt()+1);
      } else {
        changeTabBar(_pageController.page.toInt());
      }
    }
  }

  void changeTabBar(int index) {
    _tabController.animateTo(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut
    );
  }

  void jmpToStart() {
    _pageController.animateToPage(
      0, 
      duration: Duration(milliseconds: 250),
      curve: Curves.easeInOut
    );
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
        child: PageView(
          scrollDirection: Axis.vertical,
          pageSnapping: false,
          controller: _pageController,
          children: [
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
          ],
        ),
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
      onTap: changePageWithTabBar,
      tabs: tabs,
    );
  }
}