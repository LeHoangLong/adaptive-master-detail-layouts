import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  Item({
    @required this.title,
    @required this.child,
  });

  final Widget title;
  final Widget child;
  @override
  Widget build(BuildContext context) => this.child;
}
