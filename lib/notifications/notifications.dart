import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

// Global plugin object
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> initializeNotifications() async {
  // Android sozlamalari
  const AndroidInitializationSettings androidSettings =
  AndroidInitializationSettings('@mipmap/ic_launcher');

  // iOS sozlamalari
  const DarwinInitializationSettings iosSettings =
  DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  // Umumiy sozlamalar
  const InitializationSettings settings = InitializationSettings(
    android: androidSettings,
    iOS: iosSettings,
  );

  // Pluginni ishga tushirish
  await flutterLocalNotificationsPlugin.initialize(
    settings,
    onDidReceiveNotificationResponse: onNotificationTap,
  );

  // Android 13+ uchun ruxsat so'rash
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();
}

// Bildirishnomaga bosilganda chaqiriladi
void onNotificationTap(NotificationResponse response) {
  print('Bildirishnoma bosildi!');
  print('Payload: ${response.payload}');
  print('Action ID: ${response.actionId}');

  // Bu yerda navigatsiya yoki boshqa amallarni bajarishingiz mumkin
  if (response.actionId == 'accept') {
    print('Qabul qilindi');
  } else if (response.actionId == 'reject') {
    print('Rad etildi');
  }
}

class NotificationDemo extends StatelessWidget {
  const NotificationDemo({super.key});

  // 1. Oddiy bildirishnoma
  Future<void> showSimpleNotification() async {
    const AndroidNotificationDetails androidDetails =
    AndroidNotificationDetails(
      'simple_channel',
      'Oddiy bildirishnomalar',
      channelDescription: 'Oddiy bildirishnomalar uchun kanal',
      importance: Importance.max,
      priority: Priority.high,
    );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      'Salom!',
      'Bu oddiy bildirishnoma',
      notificationDetails,
      payload: 'simple_notification',
    );
  }

  // 2. Rejalashtirilgan bildirishnoma (5 sekunddan keyin)
  Future<void> scheduleNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      1,
      'Rejalashtirilgan xabar',
      '60 sekund o\'tdi!',
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 60)),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'scheduled_channel',
          'Rejalashtirilgan bildirishnomalar',
          importance: Importance.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  // 3. Kunlik bildirishnoma (har kuni 9:00 da)
  Future<void> scheduleDailyNotification() async {
    var scheduledTime = tz.TZDateTime(
      tz.local,
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      9, // Soat
      0, // Daqiqa
    );

    // Agar bugun 9:00 o'tib ketgan bo'lsa, ertaga rejalashtir
    if (scheduledTime.isBefore(DateTime.now())) {
      scheduledTime = scheduledTime.add(const Duration(days: 1));
    }

    await flutterLocalNotificationsPlugin.zonedSchedule(
      2,
      'Kunlik eslatma',
      'Har kuni soat 9:00 da',
      scheduledTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_channel',
          'Kunlik bildirishnomalar',
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  // 4. Amallar bilan bildirishnoma (tugmalar)
  Future<void> showNotificationWithActions() async {
    const AndroidNotificationDetails androidDetails =
    AndroidNotificationDetails(
      'action_channel',
      'Amallar bilan bildirishnomalar',
      importance: Importance.max,
      priority: Priority.high,
      actions: <AndroidNotificationAction>[
        AndroidNotificationAction(
          'accept',
          'Qabul qilish',
          showsUserInterface: true,
        ),
        AndroidNotificationAction(
          'reject',
          'Rad etish',
          cancelNotification: true,
        ),
      ],
    );

    await flutterLocalNotificationsPlugin.show(
      3,
      'Yangi taklif',
      'Taklifni qabul qilasizmi?',
      const NotificationDetails(android: androidDetails),
      payload: 'action_notification',
    );
  }

  // 5. Katta matn bilan bildirishnoma
  Future<void> showBigTextNotification() async {
    const AndroidNotificationDetails androidDetails =
    AndroidNotificationDetails(
      'big_text_channel',
      'Katta matn bildirishnomalari',
      styleInformation: BigTextStyleInformation(
        'Bu juda uzun matn. U bildirishnomani kengaytirganda to\'liq ko\'rinadi. '
            'Bir necha qator matn yozishingiz mumkin va foydalanuvchi bildirishnomani '
            'pastga tortganda barcha matnni o\'qiy oladi.',
        contentTitle: 'Katta matn',
        summaryText: 'Qisqacha xulosa',
      ),
    );

    await flutterLocalNotificationsPlugin.show(
      4,
      'Sarlavha',
      'Qisqa matn',
      const NotificationDetails(android: androidDetails),
    );
  }

  // 6. Progress bar bilan bildirishnoma
  Future<void> showProgressNotification() async {
    const int maxProgress = 10;

    for (int i = 0; i <= maxProgress; i++) {
      await Future.delayed(const Duration(seconds: 1));

      final AndroidNotificationDetails androidDetails =
      AndroidNotificationDetails(
        'progress_channel',
        'Progress bildirishnomalari',
        channelShowBadge: false,
        importance: Importance.max,
        priority: Priority.high,
        onlyAlertOnce: true,
        showProgress: true,
        maxProgress: maxProgress,
        progress: i,
      );

      await flutterLocalNotificationsPlugin.show(
        5,
        'Yuklanmoqda...',
        'Fayl yuklanmoqda: ${(i / maxProgress * 100).toInt()}%',
        NotificationDetails(android: androidDetails),
      );
    }

    // Yuklanish tugagach
    await Future.delayed(const Duration(seconds: 1));
    await flutterLocalNotificationsPlugin.cancel(5);
  }

  // 7. Barcha bildirishnomalarni o'chirish
  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  // 8. Rejalashtirilgan bildirishnomalarni ko'rish
  Future<void> showPendingNotifications(BuildContext context) async {
    final List<PendingNotificationRequest> pendingNotifications =
    await flutterLocalNotificationsPlugin.pendingNotificationRequests();

    if (pendingNotifications.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Rejalashtirilgan bildirishnomalar yo\'q')),
      );
      return;
    }

    String message = 'Rejalashtirilgan bildirishnomalar:\n';
    for (var notification in pendingNotifications) {
      message += 'ID: ${notification.id}, Title: ${notification.title}\n';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bildirishnoma Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1. Oddiy bildirishnoma
              ElevatedButton.icon(
                onPressed: showSimpleNotification,
                icon: const Icon(Icons.notifications),
                label: const Text('Oddiy bildirishnoma'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
              const SizedBox(height: 12),

              // 2. Rejalashtirilgan (5 sekund)
              ElevatedButton.icon(
                onPressed: scheduleNotification,
                icon: const Icon(Icons.schedule),
                label: const Text('60 sekunddan keyin'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
              const SizedBox(height: 12),

              // 3. Kunlik bildirishnoma
              ElevatedButton.icon(
                onPressed: scheduleDailyNotification,
                icon: const Icon(Icons.today),
                label: const Text('Kunlik (har kuni 9:00)'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
              const SizedBox(height: 12),

              // 4. Amallar bilan
              ElevatedButton.icon(
                onPressed: showNotificationWithActions,
                icon: const Icon(Icons.touch_app),
                label: const Text('Tugmalar bilan'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
              const SizedBox(height: 12),

              // 5. Katta matn
              ElevatedButton.icon(
                onPressed: showBigTextNotification,
                icon: const Icon(Icons.text_fields),
                label: const Text('Katta matn bilan'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
              const SizedBox(height: 12),

              // 6. Progress bar
              ElevatedButton.icon(
                onPressed: showProgressNotification,
                icon: const Icon(Icons.downloading),
                label: const Text('Progress bar bilan'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
              const SizedBox(height: 24),

              const Divider(),
              const SizedBox(height: 12),

              // 7. Rejalashtirilganlarni ko'rish
              OutlinedButton.icon(
                onPressed: () => showPendingNotifications(context),
                icon: const Icon(Icons.list),
                label: const Text('Rejalashtirilganlarni ko\'rish'),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
              const SizedBox(height: 12),

              // 8. Hammasini o'chirish
              OutlinedButton.icon(
                onPressed: () async {
                  await cancelAllNotifications();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Barcha bildirishnomalar o\'chirildi'),
                    ),
                  );
                },
                icon: const Icon(Icons.clear_all),
                label: const Text('Hammasini o\'chirish'),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  foregroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}