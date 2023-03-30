import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tzData;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  final _localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> setup() async {
    // Generate Settings for needed Platforms
    const androidSetting = AndroidInitializationSettings('spend_time');
    const iosSetting = IOSInitializationSettings();

    // Construct InitializationSettings
    const initSettings =
        InitializationSettings(android: androidSetting, iOS: iosSetting);

    // Init the plugin
    await _localNotificationsPlugin.initialize(initSettings).then((_) {
      debugPrint('setupPlugin: setup success');
    }).catchError((Object error) {
      debugPrint('Error: $error');
    });
  }

  Future<void> showSimpleNotification({
    required String title,
    required String body,
  }) async {
    await _localNotificationsPlugin.show(
      0,
      title,
      body,
      getNotificationsDetails(),
    );
  }

  Future<void> showDelayedNotification({
    required String title,
    required String body,
    int delayInSeconds = 5,
  }) async {
    tzData.initializeTimeZones();
    final scheduleTime =
        tz.TZDateTime.now(tz.local).add(Duration(seconds: delayInSeconds));

    await _localNotificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      scheduleTime,
      getNotificationsDetails(),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

  NotificationDetails getNotificationsDetails() {
    final androidDetail = AndroidNotificationDetails(
      'bogy_04_2023_lfz_id', // channel Id
      'bogy_04_2023_lfz', // channel Name
      groupKey: 'com.example.flutter_push_notifications',
      channelDescription: 'channel description',
      importance: Importance.max,
      priority: Priority.max,
      largeIcon: const DrawableResourceAndroidBitmap('logo'),
      playSound: true,
    );

    final iosDetail = IOSNotificationDetails();

    final noticeDetail = NotificationDetails(
      iOS: iosDetail,
      android: androidDetail,
    );
    return noticeDetail;
  }
}
