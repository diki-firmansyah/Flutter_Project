
import 'package:flutter/material.dart';
import 'package:tekninkal_tes/screens/home_page.dart';
import 'screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bubun Mobile Application',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Roboto'),
        home: Login(),
        routes: <String, WidgetBuilder>{
          '/homepage': (BuildContext context) => HomePage(),
          '/login': (BuildContext context) => Login(),
        });
  }


}
