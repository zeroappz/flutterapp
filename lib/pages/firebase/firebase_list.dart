import 'package:dealsapp/pages/firebase/auth_anonymous.dart';
import 'package:dealsapp/pages/login.dart';
import 'package:dealsapp/pages/time_fetch.dart';
import 'package:dealsapp/values/values.dart';

import '../../commonwidget/global_widget.dart';
import 'package:flutter/material.dart';

// import 'auth_anonymous.dart';
// import 'auth_email_password.dart';
// import 'auth_google.dart';

class FirebaseAuthenticationsListPage extends StatefulWidget {
  // const FirebaseAuthenticationsListPage(Key key) : super(key: key);
  @override
  _FirebaseAuthenticationsListPageState createState() =>
      _FirebaseAuthenticationsListPageState();
}

class _FirebaseAuthenticationsListPageState
    extends State<FirebaseAuthenticationsListPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _globalWidget.globalAppBar(),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        children: [
          Container(
            child: const Text(
              'Firebase Authentications List',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 24),
            child: Row(
              children: [
                Flexible(
                  flex: 5,
                  child: Container(
                    child: const Text(
                      'Used for authentication with Firebase',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          letterSpacing: 0.5),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Icon(Icons.local_fire_department,
                        size: 50, color: Colors.orange),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 48),
            child: const Text(
              'List',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: Sizes.height_16),
          _globalWidget.screenDetailList(
            context: context,
            title: 'Anonymous Method',
            page: const LoginScreen(),
          ),
          _globalWidget.screenDetailList(
            context: context,
            title: 'Email / Password Method',
            page: const LoginScreen(),
          ),
          _globalWidget.screenDetailList(
            context: context,
            title: 'Google Sign In',
            page: const LoginScreen(),
          ),
          _globalWidget.screenDetailList(
            context: context,
            title: 'Time Picker Widget',
            page: TimePickerWidgetPage(),
          ),
        ],
      ),
    );
  }
}
