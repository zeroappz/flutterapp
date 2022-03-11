import '../pages/splashscreen.dart';
import 'package:flutter/material.dart'; // building android layout
// import 'package:flutter/cupertino.dart'; // for ios layout
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  // Color _primaryColor = Colors.blue;
  Color _primaryColor = HexColor("#F74949");
  // Color _primaryColor = Color(0xFF00FF00);

  Color _accentColor = HexColor("#F73849");

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deals App',
      theme: ThemeData(
          primaryColor: _primaryColor,
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.grey.shade100),
      debugShowCheckedModeBanner: true,
      home: SplashScreen(title: "Deals App"),
    );
  }
}
