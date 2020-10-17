import 'dart:math';

import 'package:adaptive_master_detail_layouts/item.dart';
import 'package:adaptive_master_detail_layouts/item_details.dart';
import 'package:adaptive_master_detail_layouts/item_listing.dart';
import 'package:flutter/material.dart';

class MasterDetailContainer extends StatefulWidget {
  final int splitScreenBreakPoint;
  final List<Item> children;
  final ValueChanged<int> onItemSelected;
  final Widget appBar;
  final double sideBarWidth;

  MasterDetailContainer({
    @required this.children,
    @required this.onItemSelected,
    @required this.appBar,
    this.splitScreenBreakPoint = 600,
    this.sideBarWidth = 200,
  }) : super();

  @override
  _MasterDetailContainerState createState() => _MasterDetailContainerState();
}

class _MasterDetailContainerState extends State<MasterDetailContainer> {
  int _selectedIndex = 0;

  void _itemSelectedCallbackHandler(int selectedIndex) {
    setState(() {
      _selectedIndex = selectedIndex;
    });
    widget.onItemSelected(selectedIndex);
  }

  Widget _buildMobileLayout(BuildContext context) {
    return ItemListing(
      itemSelectedCallback: (selectedIndex) {
        setState(() {
          _selectedIndex = selectedIndex;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ItemDetails(
                isInTabletLayout: false,
                item: widget.children[selectedIndex],
              );
            },
          ),
        );
      },
      selectedItem: widget.children[_selectedIndex],
      items: widget.children,
    );
  }

  Widget _buildTabletLayout() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            color: Theme.of(context).backgroundColor,
            width: widget.sideBarWidth,
            child: Material(
              color: Theme.of(context).backgroundColor,
              elevation: 4.0,
              child: ItemListing(
                itemSelectedCallback: _itemSelectedCallbackHandler,
                selectedItem: widget.children[_selectedIndex],
                items: widget.children,
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              child: ItemDetails(
                isInTabletLayout: true,
                item: widget.children[_selectedIndex],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    var shortestSide = MediaQuery.of(context).size.shortestSide;

    if (shortestSide < widget.splitScreenBreakPoint) {
      content = _buildMobileLayout(context);
    } else {
      content = _buildTabletLayout();
    }

    return Scaffold(
      appBar: widget.appBar,
      body: content,
    );
  }
}
