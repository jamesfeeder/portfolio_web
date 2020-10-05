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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
    _tabController.addListener(onTabChanged);
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(onPageChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Tabbar Alignment
  // https://github.com/flutter/flutter/issues/17459

  void onTabChanged() {
    if (_pageController.page.toInt() != _tabController.index)
    _pageController.animateToPage(
      _tabController.index, 
      duration: Duration(milliseconds: 250),
      curve: Curves.easeInOut
    );
  }

  void onPageChanged() {
    if (!_tabController.indexIsChanging) {
      _tabController.animateTo(
        _pageController.page.toInt(),
        duration: Duration(milliseconds: 250),
        curve: Curves.easeInOut
      );
    }
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
                TabBar(
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
                ),
                SizedBox(width: 48,)
              ],
            ),
            SizedBox(height: 0,)
          ],
        ),
      ),
      body: Scrollbar(
        child: PageView(
          scrollDirection: Axis.vertical,
          pageSnapping: false,
          controller: _pageController,
          children: tabs.map((Tab tab) {
            final String label = tab.text.toLowerCase();
            return Center(
              child: Text(
                'This is the $label tab',
                style: const TextStyle(fontSize: 36),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}