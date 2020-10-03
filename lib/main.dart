import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text('Ask Me Anything'),
      ),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ListTile(
                leading: Icon(
                  Icons.vibration,
                  size: 50,
                  color: Colors.blue.shade900,
                ),
                title: Center(
                  child: Text(
                    'Shake Me!',
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 50,
                        fontFamily: 'Architects Daughter'),
                  ),
                ),
              ),
            ),
            margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          ),
          Ball(),
        ],
      ),
      backgroundColor: Colors.blue,
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;
  ShakeDetector detector;

  @override
  void initState() {
    super.initState();
    detector = ShakeDetector.autoStart(onPhoneShake: () {
      shake();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FlatButton(
          child: Image.asset('images/ball$ballNumber.png'),
          onPressed: () {
            shake();
          },
        ),
      ),
    );
  }

  void shake() {
    return setState(() {
      ballNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  void dispose() {
    super.dispose();
    detector.stopListening();
  }
}
