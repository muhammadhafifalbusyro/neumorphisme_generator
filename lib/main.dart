import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NeumorphicRadioSliderSwitchExample(),
    );
  }
}

class NeumorphicRadioSliderSwitchExample extends StatefulWidget {
  @override
  _NeumorphicRadioSliderSwitchExampleState createState() =>
      _NeumorphicRadioSliderSwitchExampleState();
}

class _NeumorphicRadioSliderSwitchExampleState
    extends State<NeumorphicRadioSliderSwitchExample> {
  String selectedOption = 'A';
  double sliderValue = 50.0;
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Neumorphic design'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildNeumorphicRadio('A'),
            buildNeumorphicRadio('B'),
            buildNeumorphicRadio('C'),
            SizedBox(height: 16),
            Text(
              'Selected: $selectedOption',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 24),
            NeumorphicSlider(
              value: sliderValue,
              min: 1,
              max: 100,
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
              style: SliderStyle(
                border: NeumorphicBorder(),
                accent: Colors.blue,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Slider Value: ${sliderValue.round()}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 24),
            NeumorphicSwitch(
              value: switchValue,
              onChanged: (value) {
                setState(() {
                  switchValue = value;
                });
              },
              style: NeumorphicSwitchStyle(
                lightSource: LightSource.topLeft,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Switch Value: ${switchValue ? 'On' : 'Off'}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNeumorphicRadio(String option) {
    return NeumorphicButton(
      onPressed: () {
        setState(() {
          selectedOption = option;
        });
      },
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.circle(),
        shape: NeumorphicShape.flat,
        intensity: 0.8,
        surfaceIntensity: 0.5,
        depth: 4,
        color: selectedOption == option ? Colors.blue : Colors.grey,
        lightSource: LightSource.topLeft,
      ),
      padding: const EdgeInsets.all(16.0),
      child: Text(
        option,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
