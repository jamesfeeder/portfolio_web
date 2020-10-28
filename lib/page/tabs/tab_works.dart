import 'package:flutter/material.dart';
import 'package:portfolio/theme.dart';
import 'package:portfolio/widgets/work_grid_item.dart';

class WorksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: WebTheme.defaultPagePadding.copyWith(bottom: 0),
          child: Text(
            "Works".toUpperCase(),
            style: TextStyle(
              fontSize: 84,
              fontWeight: FontWeight.w700
            ),
          ),
        ),
        GridView.count(
          padding: WebTheme.defaultPagePadding.copyWith(top: 24),
          shrinkWrap: true,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 3/2,
          crossAxisCount: MediaQuery.of(context).size.width~/400,
          children: [
            WorkGridItem(),
            WorkGridItem(),
            WorkGridItem(),
            WorkGridItem(),
            WorkGridItem(),
            WorkGridItem(),
            WorkGridItem()
          ],
        )
      ],
    );
  }
}