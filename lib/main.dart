import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_flutter/home_screen.dart';

void main() {
  // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent,
  // ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp',
      theme: ThemeData(
        primaryColor: Color(0xff075e54),
        accentColor: Color(0xff128c7e),
        // fontFamily: "OpenSans"

      ),
      home: HomeScreen(),
    );
  }
}



