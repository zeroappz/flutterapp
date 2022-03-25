import 'package:dealsapp/pages/forgotpassword.dart';
import 'package:dealsapp/pages/home.dart';
import 'package:dealsapp/pages/login.dart';
import 'package:dealsapp/pages/onboarding/onboarding_screen.dart';
import 'package:dealsapp/pages/otp_validation.dart';
import 'package:dealsapp/pages/registration.dart';
import 'package:dealsapp/pages/tabview/tab_home.dart';
import 'package:dealsapp/pages/weather_report.dart';
import 'package:dealsapp/pages/widget/gesture_detector.dart';
import 'package:dealsapp/util/notifyService.dart';
import 'pages/splash.dart';
import 'package:flutter/material.dart'; // building android layout
// import 'package:flutter/cupertino.dart'; // for ios layout
import 'package:hexcolor/hexcolor.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().init(); // invoke the constructor of the class
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
      // home: const SplashScreen(title: "Deals App"),
      // home: const LoginScreen(),
      // home: const ForgotPasswordScreen(),
      // home: const RegistrationScreen(),
      // home: const OTPVerificationScreen(),
      // home: const HomeScreen(),
      // home: const HomeTabBar()
      // home: const CardGestureWidget()
      home: OnBoardingScreen(),
      // home: const WeatherReportScreen(),
      routes: {
        'login': (context) => const LoginScreen(),
        'forgotpassword': (context) => const ForgotPasswordScreen(),
        'registration': (context) => const RegistrationScreen(),
        'otpvalidation': (context) => const OTPVerificationScreen(),
      },
    );
  }
}

class PushNotifications extends StatefulWidget {
  const PushNotifications({Key? key}) : super(key: key);

  @override
  State<PushNotifications> createState() => _PushNotificationsState();
}


class _PushNotificationsState extends State<PushNotifications> {
  NotificationService _notificationService = NotificationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Test'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await _notificationService.showNotification();
                  },
                  child: const  Text('Show Notification'),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _notificationService.showDynamicNotification(
                        1,
                        'Pongal Offer!',
                        'Welcome to the Pongal Offers of Amazon!..');
                  },
                  child: const  Text('Dynamic Notification'),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _notificationService.scheduledDynamicNotification(
                        2,
                        'Pongal Offer at Diwali Time!',
                        'Welcome to the Pongal Offers of Amazon!..');
                  },
                  child: const  Text('Scheduled Dynamic'),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _notificationService.cancelNotification(1);
                  },
                  child: const Text('Cancel Notification'),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _notificationService.cancelAllNotification();
                  },
                  child: Text('Cancel All'),
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
