import 'package:flutter/material.dart';
import 'package:flutter_with_docs/accessibility/accessibility.dart';
import 'package:flutter_with_docs/oneui-examples/oneui_examples.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'basics/appbars/appbars.dart';
import 'basics/buttons/buttons.dart';
import 'basics/layouts/layouts.dart';
import 'basics/paintings/paintings.dart';
import 'basics/scrollings/scrollings.dart';
import 'ios_examples/apple_ui_examples.dart';
import 'notifications/notifications.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  // Timezone sozlash
  tz.initializeTimeZones();

  // Bildirishnomani sozlash
  await initializeNotifications();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Bu semantics chegaralarini ko'rsatadi
      // showSemanticsDebugger: true,
      title: 'Namer App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("namunalar")),
      body: Center(
        child: Column(
          mainAxisAlignment :MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AppBarExamplesHome()),
                );
              },
              child: Text('App bars'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ButtonsHomePage()),
                );
              },
              child: Text('Buttons'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LayoutListPage()),
                );
              },
              child: Text('Layouts'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PaintingEffectsDemo()),
                );
              },
              child: Text('Paintings'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ScrollingDemo()),
                );
              },
              child: Text('Scrollings'),
            ),
            ElevatedButton(
              onPressed: () {
                // some code
              },
              child: Text('theme'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) =>  const NotificationDemo()));
              },
              child: Text('Notifications'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) =>  const OneUiExampleScreen()));
              },
              child: Text('OneUi Examples'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) =>  const AppleWidgetsDemo()));
              },
              child: Text('AppleUi Examples'),
            ),
          ],
        ),
      ),
    );
  }
}
