import 'package:flutter/material.dart';

class PopupMenuExample extends StatefulWidget {
  @override
  _PopupMenuExampleState createState() => _PopupMenuExampleState();
}

enum Animals { Cat, Dog, Bird, Lizard, Fish }

class _PopupMenuExampleState extends State<PopupMenuExample> {
  Animals _selected = Animals.Cat;
  String _value = 'Make a Selection';
  List<PopupMenuEntry<Animals>> _items = List<PopupMenuEntry<Animals>>();

  @override
  void initState() {
    for (Animals animal in Animals.values) {
      _items.add(PopupMenuItem<Animals>(
        value: animal,
        child: Text(
          _getDisplay(animal),
        ),
      ));
    }
  }

  void _onSelected(Animals animal) {
    setState(() {
      _selected = animal;
      _value = 'You selected ${_getDisplay(animal)}';
    });
  }

  String _getDisplay(Animals animal) {
    return animal.toString().split('.').last;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Popup Menu')),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(_value),
            ),
            PopupMenuButton(
                child: Icon(Icons.input),
                initialValue: Animals.Cat,
                onSelected: _onSelected,
                itemBuilder: (BuildContext context) => _items)
          ]),
        ),
      ),
    );
  }
}
