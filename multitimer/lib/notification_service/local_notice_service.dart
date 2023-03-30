import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  final _localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> setup() async {
    // Generate Settings for needed Platforms
    const androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
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
    final androidDetail = AndroidNotificationDetails(
        'some_id', // channel Id
        'some_name' // channel Name
        );

    final iosDetail = IOSNotificationDetails();

    final noticeDetail = NotificationDetails(
      iOS: iosDetail,
      android: androidDetail,
    );
    await _localNotificationsPlugin.show(
      0,
      title,
      body,
      noticeDetail,
    );
  }
}
