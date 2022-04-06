// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/scheduler.dart';
// import '../../commonwidget/global_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'auth_home.dart';

// class AnonymousAuthPage extends StatefulWidget {
//   const AnonymousAuthPage({Key? key}) : super(key: key);

//   @override
//   State<AnonymousAuthPage> createState() => _AnonymousAuthPageState();
// }

// class _AnonymousAuthPageState extends State<AnonymousAuthPage> {
// // initialize global widget
//   final _globalWidget = GlobalWidget();

//   // initialize firebase auth
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   void _checkUserLogin() {
//     User? user = _auth.currentUser;
//     if (user != null) {
//       Navigator.pop(context);
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => AuthHomePage(),
//         ),
//       );
//     }
//   }

//   Future<void> _singInAnonymous() async {
//     try {
//       // sign in anonymously with firebase
//       UserCredential userCredential = await _auth.signInAnonymously();

//       User? firebaseUser = userCredential.user;

//       if (firebaseUser != null) {
//         Navigator.pop(context);
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => AuthHomePage(),
//           ),
//         );
//       } else {
//         Fluttertoast.showToast(
//           msg: "Failed to login",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0,
//         );
//       }
//     } on FirebaseAuthException catch (e) {
//       // print(e.code);
//       // print(e.message);
//       Fluttertoast.showToast(
//         msg: e.message!,
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.redAccent,
//         textColor: Colors.white,
//         fontSize: 16.0,
//       );
//     } catch (e) {
//       Fluttertoast.showToast(
//         msg: e.toString(),
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.redAccent,
//         textColor: Colors.white,
//         fontSize: 16.0,
//       );
//     }
//   }

//   @override
//   void initState() {
//     SchedulerBinding.instance!.addPostFrameCallback((_) {
//       _checkUserLogin();
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: _globalWidget.globalAppBar(),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Sign in with Anonymous',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             _globalWidget.createButton(
//                 buttonName: 'Sign In Anonymously',
//                 onPressed: () {
//                   _singInAnonymous();
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }
