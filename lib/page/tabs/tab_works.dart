import 'package:flutter/material.dart';
import 'package:portfolio/data/data.dart';
import 'package:portfolio/theme.dart';
import 'package:portfolio/widgets/work_grid_item.dart';

class WorksTab extends StatelessWidget {

  final List<Widget> _workList = PortfolioData.workList.map((e) => WorkGridItem(key: ValueKey(e),data: e,)).toList();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: WebTheme.defaultPagePadding.copyWith(bottom: 0),
          sliver: SliverToBoxAdapter(
            child: Text(
              "Works".toUpperCase(),
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w700
              ),
            ),
          )
        ),
        SliverPadding(
          padding: WebTheme.defaultPagePadding.copyWith(top: 16),
          sliver: SliverGrid.count(
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 5/4,
            crossAxisCount: MediaQuery.of(context).size.width~/400,
            children: _workList,
          ),
        )
      ],
    );
  }
}