// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:admob_flutter/admob_flutter.dart';

import './screens/home.dart';

// String getAppId() {
//   if (Platform.isIOS) {
//     return DotEnv().env['AD_MOD_ID_IOS'];
//   } else {
//     return DotEnv().env['AD_MOD_ID'];
//   }
// }

Future main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await DotEnv().load('.env');
  // Admob.initialize(getAppId());
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
