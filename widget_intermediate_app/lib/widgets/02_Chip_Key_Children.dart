import 'package:flutter/material.dart';

class ChipExample extends StatefulWidget {
  @override
  _ChipExampleState createState() => _ChipExampleState();
}

class _ChipExampleState extends State<ChipExample> {
  int counter = 0;
  List<Widget> _list = List<Widget>();
  @override
  void initState() {
    for (var i = 0; i < 5; i++) {
      Widget child = _newItem(i);
      _list.add(child);
    }
  }

  _onPress() {
    Widget child = _newItem(counter);
    setState(() => _list.add(child));
  }

  Widget _newItem(int i) {
    Key key = Key('item_${i}');
    Container child = Container(
      key: key,
      padding: EdgeInsets.all(10.0),
      child: Chip(
        label: Text('${i} Name here'),
        deleteIconColor: Colors.red,
        deleteButtonTooltipMessage: 'Delete',
        onDeleted: () => _removeItem(key),
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: Text(i.toString()),
        ),
      ),
    );
    counter++;
    return child;
  }

  _removeItem(Key key) {
    for (int i = 0; i < _list.length; i++) {
      Widget child = _list.elementAt(i);
      if (child.key == key) {
        setState(() => _list.removeAt(i));
        print('Removing ${key.toString()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Chips')),
        floatingActionButton: FloatingActionButton(
          onPressed: _onPress,
          child: Icon(Icons.add),
        ),
        body: Container(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: _list,
          ),
        ));
  }
}
