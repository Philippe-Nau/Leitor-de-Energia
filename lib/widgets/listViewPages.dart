import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class ListViewPages extends StatelessWidget {
  final List<Widget> children;

  const ListViewPages({
    @required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: ResponsiveGridList(
          desiredItemWidth: 300,
          minSpacing: 10,
          children: this.children,
        ),
      ),
    );
  }
}
