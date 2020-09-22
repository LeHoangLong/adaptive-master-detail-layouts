import 'package:adaptive_master_detail_layouts/item.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ItemDetails extends StatelessWidget {
  ItemDetails({
    @required this.isInTabletLayout,
    @required this.item,
  });

  final bool isInTabletLayout;
  final Item item;

  @override
  Widget build(BuildContext context) {
    if (item == null) {
      return Container();
    }
    if (isInTabletLayout) {
      return Center(child: item.child);
    }

    return Scaffold(
      appBar: AppBar(
        title: item.title,
      ),
      body: Center(child: item.child),
    );
  }
}
