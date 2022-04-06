// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/scheduler.dart';
// import '../../commonwidget/global_widget.dart';
// import 'package:flutter/material.dart';

// class AuthHomePage extends StatefulWidget {
//   const AuthHomePage({Key? key}) : super(key: key);

//   @override
//   State<AuthHomePage> createState() => _AuthHomePageState();
// }

// class _AuthHomePageState extends State<AuthHomePage> {
//   // initialize global widget
//   final _globalWidget = GlobalWidget();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   User? _firebaseUser;
//   String? _firebaseEmail, _firebaseName, _firebasePhotoUrl;

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

//   void _checkUserLogin() {
//     setState(() {
//       _firebaseUser = _auth.currentUser;
//       if (_firebaseUser != null) {
//         Navigator.pop(context);
//       } else {
//         _firebaseEmail = _firebaseUser?.email != '' ? _firebaseUser?.email : '';
//         _firebaseName =
//             _firebaseUser?.displayName != '' ? _firebaseUser?.displayName : '';
//         _firebasePhotoUrl =
//             _firebaseUser?.photoURL != '' ? _firebaseUser?.photoURL : '';
//       }
//     });
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
//               'Authenticated Home Page',
//             ),
//             const SizedBox(height: 24),
//             _firebasePhotoUrl != null
//                 ? ClipOval(
//                     child: Image.network(
//                       _firebasePhotoUrl!,
//                       width: 100,
//                       height: 100,
//                     ),
//                   )
//                 : const SizedBox.shrink(),
//             const SizedBox(height: 24),
//             Text(
//               _firebaseName ?? '',
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 24),
//             Text(
//               _firebaseEmail ?? '',
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 24),
//             Text(
//               'Firebse UID: ' +
//                   ((_firebaseUser != null) ? _firebaseUser!.uid : ''),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
