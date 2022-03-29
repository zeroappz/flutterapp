import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  // Singleton Object - only one instance to this class
  static final NotificationService _notifyService =
      NotificationService._internal();

  factory NotificationService() {
    return _notifyService;
  }
  NotificationService._internal();

  // Creating channel ID
  static const channelID = '1234';
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationPlugin =
      FlutterLocalNotificationsPlugin();

  // General Setting for notification - Andorid, IOS, LINUX, MAC
  Future<dynamic> init() async {
    AndroidInitializationSettings _initSettingsForAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    // IOS notification settings
    IOSInitializationSettings _initSettingsForIOS =
        const IOSInitializationSettings(
            requestSoundPermission: true,
            requestAlertPermission: false,
            requestBadgePermission: false);

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: _initSettingsForAndroid, iOS: _initSettingsForIOS);

    // load timezones
    tz.initializeTimeZones();

    // Initiate notification service
    await _flutterLocalNotificationPlugin.initialize(initializationSettings);
  }

  final AndroidNotificationDetails _androidNotificationDetails =
      const AndroidNotificationDetails('channelID', 'channelName',
          playSound: true, importance: Importance.high);

  final IOSNotificationDetails _iOSNotificationDetails =
      const IOSNotificationDetails();

  // In order to show notification in your app use this following function
  Future<void> showNotification() async {
    await _flutterLocalNotificationPlugin.show(
      0,
      'Diwali Offer!!!',
      'Hurray! You have been ready to explore our services it seems.. enjoy!',
      NotificationDetails(
        android: _androidNotificationDetails,
      ),
      // iOS: _iOSNotificationDetails
    );
  }

  // In order to show notification in your app use this following function
  Future<void> showDynamicNotification(
      int id, String title, String desc) async {
    await _flutterLocalNotificationPlugin.show(
      id,
      title,
      desc,
      NotificationDetails(
        android: _androidNotificationDetails,
      ),
      // iOS: _iOSNotificationDetails
    );
  }

  // Scheduled Notification
  Future<void> scheduledDynamicNotification(
      int id, String title, String desc) async {
    await _flutterLocalNotificationPlugin.zonedSchedule(
      id, title, desc,
      tz.TZDateTime.now(tz.local).add(
        const Duration(seconds: 5),
      ),
      NotificationDetails(
        android: _androidNotificationDetails,
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,

      // iOS: _iOSNotificationDetails
    );
  }

  // Cancelling ID based notification
  Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationPlugin.cancel(id);
  }

  // Cancelling ID based notification
  Future<void> cancelAllNotification() async {
    await _flutterLocalNotificationPlugin.cancelAll();
  }
}
