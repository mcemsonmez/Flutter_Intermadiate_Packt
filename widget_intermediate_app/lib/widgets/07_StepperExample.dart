import 'package:flutter/material.dart';

class StepperExample extends StatefulWidget {
  @override
  _StepperExampleState createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  int _current;
  List<Step> _steps;

  @override
  void initState() {
    super.initState();
    _current = 0;
    _steps = <Step>[
      Step(
        title: Text('Step 1'),
        content: Text('Do Something'),
        isActive: true,
      ),
      Step(
        title: Text('Step 2'),
        content: Text('Do Something'),
        isActive: false,
      ),
      Step(
        title: Text('Step 3'),
        content: Text('Do Something'),
        isActive: true,
      ),
    ];
  }

  void _stepContinue() {
    setState(() {
      _current++;
      if (_current >= _steps.length) _current = _steps.length - 1;
    });
  }

  void _stepCancel() {
    setState(() {
      _current--;
      if (_current < 0) _current = 0;
    });
  }

  void _stepTap(int index) {
    setState(() {
      _current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper Example'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
            child: Stepper(
          steps: _steps,
          type: StepperType.vertical, // vertical, horizontal
          currentStep: _current,
          onStepCancel: _stepCancel,
          onStepContinue: _stepContinue,
          onStepTapped: _stepTap,
        )),
      ),
    );
  }
}
