import 'package:flutter/material.dart';

class ToolTipExample extends StatefulWidget {
  @override
  _ToolTipExampleState createState() => _ToolTipExampleState();
}

class _ToolTipExampleState extends State<ToolTipExample> {
  String _value = 'Nothing Yet';
  void _onPressed() => setState(() => _value = DateTime.now().toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tooltip"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Text(_value),
              IconButton(
                icon: Icon(Icons.timer),
                onPressed: _onPressed,
                tooltip: 'Click me',
              )
            ],
          ),
        ),
      ),
    );
  }
}
