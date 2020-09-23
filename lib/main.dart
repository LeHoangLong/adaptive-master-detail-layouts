import 'package:adaptive_master_detail_layouts/master_detail_container.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_master_detail_layouts/item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Master-Detail example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MasterDetailContainer(
      children: [
        Item(title: Text('item 1'), child: Text('detail 1')),
        Item(title: Text('item 2'), child: Text('detail 2')),
      ],
      onItemSelected: (int idx) {
        setState(() {
          _selectedItemIndex = idx;
        });
      },
      selectedIndex: _selectedItemIndex,
      splitScreenBreakPoint: 600,
    );
  }
}
