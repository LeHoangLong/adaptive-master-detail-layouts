import 'package:adaptive_master_detail_layouts/item.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ItemListing extends StatelessWidget {
  ItemListing({
    @required this.itemSelectedCallback,
    this.selectedItem,
    @required this.items,
  });

  final ValueChanged<int> itemSelectedCallback;
  final Item selectedItem;
  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    if (items.length == 0) {
      return Container();
    }
    return ListView(
      children: items.map((item) {
        int idx = items.indexOf(item);
        return ListTile(
          title: item.title,
          onTap: () => itemSelectedCallback(idx),
          selected: selectedItem != null && selectedItem == item,
        );
      }).toList(),
    );
  }
}
