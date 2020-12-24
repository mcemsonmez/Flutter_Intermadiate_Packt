import 'package:flutter/material.dart';

class ExpansionPanelExample extends StatefulWidget {
  @override
  _ExpansionPanelExampleState createState() => _ExpansionPanelExampleState();
}

class _ExpansionPanelExampleState extends State<ExpansionPanelExample> {
  List<MyItem> _items = List<MyItem>();
  @override
  void initState() {
    for (var i = 0; i < 10; i++) {
      _items.add(MyItem(
          false,
          'Item $i',
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Hello World'),
          )));
    }
  }

  ExpansionPanel _createItem(MyItem item) {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Container(
          padding: EdgeInsets.all((15.0)),
          child: Text('Header ${item.header}'),
        );
      },
      body: item.body,
      isExpanded: item.isExpanded,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expansion Panel'),
      ),
      body: Container(
        child: ListView(
          children: [
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanede) => setState(
                  () => _items[index].isExpanded = !_items[index].isExpanded),
              children: _items.map((_createItem)).toList(),
            )
          ],
        ),
      ),
    );
  }
}

class MyItem {
  bool isExpanded;
  final String header;
  final Widget body;
  MyItem(this.isExpanded, this.header, this.body);
}
