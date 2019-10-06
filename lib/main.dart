import 'package:flutter/material.dart';

import './screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hikmah / Bersams Quiz POC',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.indigo,
          fontFamily: "UnicaOne",
          buttonColor: Colors.pink,
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.pink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              textTheme: ButtonTextTheme.primary)),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
