import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './screens/home.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

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
