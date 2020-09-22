import 'dart:math';

import 'package:adaptive_master_detail_layouts/item.dart';
import 'package:adaptive_master_detail_layouts/item_details.dart';
import 'package:adaptive_master_detail_layouts/item_listing.dart';
import 'package:flutter/material.dart';

class MasterDetailContainer extends StatelessWidget {
  final int splitScreenBreakPoint;
  final List<Item> children;
  final ValueChanged<int> onItemSelected;
  final int selectedIndex;

  MasterDetailContainer({
    @required this.children,
    @required this.onItemSelected,
    this.selectedIndex = 0,
    this.splitScreenBreakPoint = 600,
  }) : super();

  Widget _buildMobileLayout() {
    return ItemListing(
      itemSelectedCallback: onItemSelected,
      selectedItem: children[selectedIndex],
      items: children,
    );
  }

  Widget _buildTabletLayout() {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Material(
            elevation: 4.0,
            child: ItemListing(
              itemSelectedCallback: onItemSelected,
              selectedItem: children[selectedIndex],
              items: children,
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: ItemDetails(
            isInTabletLayout: true,
            item: children[selectedIndex],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    var shortestSide = MediaQuery.of(context).size.shortestSide;

    if (shortestSide < splitScreenBreakPoint) {
      content = _buildMobileLayout();
    } else {
      content = _buildTabletLayout();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Master-detail flow sample'),
      ),
      body: content,
    );
  }
}
