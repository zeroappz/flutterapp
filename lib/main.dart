import 'package:dealsapp/pages/loginscreen.dart';

// import '../pages/splashscreen.dart';
import 'package:flutter/material.dart'; // building android layout
// import 'package:flutter/cupertino.dart'; // for ios layout
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // Color _primaryColor = Colors.blue;
  final Color _primaryColor = HexColor("#F74949");
  // Color _primaryColor = Color(0xFF00FF00);

  final Color _accentColor = HexColor("#F73849");

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deals App',
      theme: ThemeData(
          primaryColor: _primaryColor,
          primarySwatch: Colors.blue,
        scaffoldBackgroundColor: _accentColor,
      ),
      debugShowCheckedModeBanner: true,
      // home: SplashScreen(title: "Deals App"),
      home: const LoginScreen(),
    );
  }
}
