import 'package:flutter/material.dart';

class SliderIdicatorExample extends StatefulWidget {
  @override
  _SliderIdicatorExampleState createState() => _SliderIdicatorExampleState();
}

class _SliderIdicatorExampleState extends State<SliderIdicatorExample> {
  double _value = 0.0;
  void _onChange(double value) => setState(() => _value = value);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 80.0),
        child: Center(
          child: Column(
            children: [
              Slider(value: _value, onChanged: _onChange),
              Container(
                padding: EdgeInsets.all(32.0),
                child: LinearProgressIndicator(
                  value: _value,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
              Container(
                padding: EdgeInsets.all(32.0),
                child: CircularProgressIndicator(
                  value: _value,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
