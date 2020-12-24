import 'package:flutter/material.dart';
import 'dart:math';

class GridViewExampe extends StatefulWidget {
  @override
  _GridViewExampeState createState() => _GridViewExampeState();
}

class Area {
  int index;
  String name;
  Color color;
  Area({this.index: 1, this.name: 'Area', this.color: Colors.blueAccent});
}

class _GridViewExampeState extends State<GridViewExampe> {
  int _location;
  List<Area> _areas;
  @override
  void initState() {
    _setGame();
  }

  void _setGame() {
    setState(() {
      _areas = List<Area>();
      for (var i = 1; i < 17; i++) {
        _areas.add(Area(index: i, name: 'Area $i'));
      }

      var rnd = Random();
      _location = rnd.nextInt(16);
    });
  }

  Widget _generate(int index) {
    return GridTile(
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: RaisedButton(
          onPressed: () => _onPressed(index),
          color: _areas[index].color,
          child: Text(
            _areas[index].name,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _onPressed(int index) {
    setState(() {
      if (index == _location) {
        _areas[index].color = Colors.green;
        _showMaterialDialog();
      } else {
        _areas[index].color = Colors.red;
      }
    });
  }

  _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              contentPadding: EdgeInsets.all(30.0),
              title: new Text("You Win"),
              content: new Text("You find the box."),
              actions: <Widget>[
                FlatButton(
                  child: Text('Refresh Game?'),
                  onPressed: () => {_setGame(), Navigator.of(context).pop()},
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Example'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: GridView.count(
          crossAxisCount: 4,
          children: List<Widget>.generate(16, _generate),
        ),
      ),
    );
  }
}
