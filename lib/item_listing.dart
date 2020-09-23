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
        bool selected = selectedItem != null && selectedItem == item;
        return Ink(
          color: selected ? Theme.of(context).focusColor : Colors.transparent,
          child: ListTile(
            leading: item.icon,
            title: item.title,
            onTap: () => itemSelectedCallback(idx),
            selected: selected,
            hoverColor: Theme.of(context).hoverColor,
          ),
        );
      }).toList(),
    );
  }
}
