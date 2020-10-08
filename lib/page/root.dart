import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:portfolio/page/tabs/tab_contact.dart';
import 'package:portfolio/page/tabs/tab_home.dart';
import 'package:portfolio/page/tabs/tab_works.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root>  with SingleTickerProviderStateMixin {

  final List<Tab> tabs = [
    Tab(text: "Jetsadakorn Maliwan"),
    Tab(text: "Works"),
    Tab(text: "Contact")
  ];

  TabController _tabController;
  ItemScrollController _itemScrollController;
  ItemPositionsListener _itemPositionsListener;

  FloatingActionButton scrollUpButton;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
    _itemScrollController = ItemScrollController();
    _itemPositionsListener = ItemPositionsListener.create();
    _tabController.addListener(onScroll);
    _itemPositionsListener.itemPositions.addListener(onScroll);
    scrollUpButton = null;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void changePage(int index) {
    _itemScrollController.scrollTo(
      index: index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOutExpo
    );
  }

  void changeTab(int index) {
    _tabController.animateTo(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut
    );
  }

  void onScroll() {
    ItemPosition data = _itemPositionsListener.itemPositions.value.first;
    print("Index: ${data.index}, LeadingEdge: ${data.itemLeadingEdge}, TrailingEnd: ${data.itemTrailingEdge}");
    if (!_tabController.indexIsChanging) {
      if (data.index == _tabController.index && data.itemTrailingEdge < 0.1) {
        changeTab(data.index+1);
      } else if (data.index != _tabController.index && data.itemTrailingEdge > 0.1) {
        changeTab(data.index);
      }
    }

    if (data.index == 0 && data.itemTrailingEdge > 0.8) {
      setState(() {
        scrollUpButton = null;
      });
    } else {
      setState(() {
        scrollUpButton = FloatingActionButton(
          child: Icon(Icons.arrow_upward_rounded),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          onPressed: () => changePage(0),
        );
      });
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
        child: pageList(),
      ),
      floatingActionButton: scrollUpButton,
    );
  }

  TabBar navBar() {
    return TabBar(
      labelPadding: EdgeInsets.fromLTRB(16, 4, 16, 0),
      labelColor: Colors.white,
      labelStyle: TextStyle(fontFamily: "Raleway", fontSize: 16, fontWeight: FontWeight.w500),
      unselectedLabelColor: Colors.black,
      unselectedLabelStyle: TextStyle(fontFamily: "Raleway", fontSize: 16),
      indicator: BubbleTabIndicator(
        indicatorHeight: 38,
        indicatorRadius: 8,
        indicatorColor: Colors.black,
        padding: EdgeInsets.zero
      ),
      isScrollable: true,
      controller: _tabController,
      tabs: tabs,
      onTap: changePage,
    );
  }

  Widget pageList() {
    final contents = [
        HomeTab(),
        WorksTab(),
        ContactTab()
      ];
    return ScrollablePositionedList.builder(
      padding: EdgeInsets.zero,
      minCacheExtent: 102400,
      itemPositionsListener: _itemPositionsListener,
      itemScrollController: _itemScrollController,
      itemCount: contents.length,
      itemBuilder: (context, index) {
        return contents[index];
      },
    );
  }
}