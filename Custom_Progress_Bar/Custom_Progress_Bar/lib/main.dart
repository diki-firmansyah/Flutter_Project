import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cutom Progress Bar'),
        ),
        body: Center(
          // ignore: missing_required_param
          child: ChangeNotifierProvider<TimeState>(
            builder: (context) => TimeState(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer<TimeState>(
                  builder: (context, timeState, _) => CustomProggressBar(
                    width: 200,
                    value: timeState.time,
                    totalValue: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Consumer<TimeState>(
                  builder: (context, timeState, _) => RaisedButton(
                    color: Colors.lightBlue,
                    child: Text(
                      "Start",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Timer.periodic(Duration(seconds: 1), (timer) {
                        if (timeState.time == 0)
                          timer.cancel();
                        else
                          timeState.time -= 1;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomProggressBar extends StatelessWidget {
  final double width;
  final int value;
  final int totalValue;
  CustomProggressBar({
    this.width,
    this.value,
    this.totalValue,
  });

  @override
  Widget build(BuildContext context) {
    double ratio = value / totalValue;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.timer,
          color: Colors.grey[700],
        ),
        SizedBox(width: 5),
        Stack(
          children: <Widget>[
            Container(
              width: width,
              height: 10.0,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(5),
              child: AnimatedContainer(
                width: width * ratio,
                height: 10,
                duration: Duration(milliseconds: 500),
                decoration: BoxDecoration(
                  color: (ratio < 0.3)
                      ? Colors.red
                      : (ratio < 0.6) ? Colors.amber[400] : Colors.lightGreen,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class TimeState with ChangeNotifier {
  int _time = 15;

  int get time => _time;
  set time(int newTime) {
    _time = newTime;
    notifyListeners();
  }
}
