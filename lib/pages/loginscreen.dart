import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueAccent, Colors.greenAccent],
            stops: [0.0, 1.0],
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
                    offset: Offset(0.0, 2.0),
                    spreadRadius: 2.0),
              ],
            ),
            child: const Center(
              child: ClipOval(
                child: Icon(
                  Icons.person_add,
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
