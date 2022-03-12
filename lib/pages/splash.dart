import 'dart:async';
// import 'loginscreen.dart';
import 'package:dealsapp/pages/login.dart';
import 'package:flutter/material.dart';

// Stateful widget
class SplashScreen extends StatefulWidget {
  final String title;

  const SplashScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // constructor to load initially
  _SplashScreenState() {
    Timer(const Duration(milliseconds: 5000), () {
      setState(() {
        // Navigator.of(context).pushReplacementNamed('/home');
        // Navigator.push(SpashScreen());
        // Navigator.pushNamed();
        // Navigator.pop();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor
            ],
            stops: const [0.0, 1.0],
            tileMode: TileMode.mirror),
      ),
      child: AnimatedOpacity(
        duration: const Duration(
          milliseconds: 2000,
        ),
        opacity: 1.0,
        child: Center(
          child: Container(
            height: 140.0,
            width: 140.0,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 2.0,
                    offset: const Offset(0.0, 2.0),
                    spreadRadius: 2.0),
              ],
            ),
            child: const Center(
              child: ClipOval(
                child: Icon(
                  Icons.credit_card,
                  size: 100.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Stateless widget
// class SpashScreenClass extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }
