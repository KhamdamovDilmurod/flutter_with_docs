import 'package:flutter/material.dart';
import 'package:flutter_with_docs/widget_service/widget_service.dart';
import 'package:home_widget/home_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Widget Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
    _checkAndAddWidget();
  }

  // Birinchi marta ochganda widget qo'shishni so'rash
  Future<void> _checkAndAddWidget() async {
    final prefs = await SharedPreferences.getInstance();
    final hasAsked = prefs.getBool('has_asked_for_widget') ?? false;

    if (!hasAsked) {
      // 1 soniya kutamiz (UI yuklangunga qadar)
      await Future.delayed(Duration(seconds: 1));

      final supported = await WidgetPinService.isSupported();
      if (supported && mounted) {
        _showWidgetDialog();
        await prefs.setBool('has_asked_for_widget', true);
      }
    }
  }

  // Dialog ko'rsatish
  void _showWidgetDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.widgets, color: Colors.blue),
            SizedBox(width: 10),
            Text('Widget qo\'shish'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Home screeningizga widget qo\'shmoqchimisiz?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Text(
              'Bu widget counter qiymatini doimiy ko\'rsatib turadi va tezkor kirish imkonini beradi.',
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Keyinroq'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              await _addWidgetToHomeScreen();
            },
            child: Text('Ha, qo\'shish'),
          ),
        ],
      ),
    );
  }

  // Widget qo'shish
  Future<void> _addWidgetToHomeScreen() async {
    final supported = await WidgetPinService.isSupported();

    if (!supported) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.warning, color: Colors.white),
                SizedBox(width: 10),
                Expanded(
                  child: Text('Qurilma widget pinlashni qo\'llab-quvvatlamaydi'),
                ),
              ],
            ),
            backgroundColor: Colors.orange,
            duration: Duration(seconds: 3),
          ),
        );
      }
      return;
    }

    final success = await WidgetPinService.pinWidget();

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                success ? Icons.check_circle : Icons.error,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  success
                      ? 'Widget qo\'shilmoqda... Tasdiqni bosing!'
                      : 'Widget qo\'shib bo\'lmadi. Qaytadan urinib ko\'ring.',
                ),
              ),
            ],
          ),
          backgroundColor: success ? Colors.green : Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  // Saqlangan counterni yuklash
  Future<void> _loadCounter() async {
    try {
      final counter = await HomeWidget.getWidgetData<int>('counter');
      if (counter != null && mounted) {
        setState(() {
          _counter = counter;
        });
      }
    } catch (e) {
      print('Xatolik: $e');
    }
  }

  // Widget'ni yangilash
  Future<void> _updateWidget() async {
    try {
      await HomeWidget.saveWidgetData<int>('counter', _counter);
      await HomeWidget.saveWidgetData<String>('title', 'Counter Widget');

      await HomeWidget.updateWidget(
        name: 'HomeWidgetProvider',
        iOSName: 'HomeWidgetProvider',
      );

      print('Widget yangilandi!');
    } catch (e) {
      print('Xatolik: $e');
    }
  }

  // Counterni oshirish
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _updateWidget();
  }

  // Counterni resetlash
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
    _updateWidget();
  }

  // Widget qo'shish holatini reset qilish (test uchun)
  Future<void> _resetWidgetPrompt() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('has_asked_for_widget', false);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Widget so\'rovi qayta tiklandi. Ilovani qaytadan ishga tushiring.'),
          backgroundColor: Colors.blue,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Widget Demo'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          // Debug uchun: Widget so'rovini qayta tiklash
          IconButton(
            icon: Icon(Icons.refresh),
            tooltip: 'Widget so\'rovini qayta tiklash',
            onPressed: _resetWidgetPrompt,
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.widgets,
                size: 80,
                color: Colors.blue,
              ),
              SizedBox(height: 30),
              Text(
                'Counter qiymati:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                '$_counter',
                style: TextStyle(
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 40),

              // Asosiy tugmalar
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: _incrementCounter,
                    icon: Icon(Icons.add),
                    label: Text('Oshirish'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(width: 15),
                  OutlinedButton.icon(
                    onPressed: _resetCounter,
                    icon: Icon(Icons.refresh),
                    label: Text('Reset'),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Qo'shimcha: Qo'lda widget qo'shish tugmasi
              OutlinedButton.icon(
                onPressed: _addWidgetToHomeScreen,
                icon: Icon(Icons.add_to_home_screen),
                label: Text('Widget qo\'shish'),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                  foregroundColor: Colors.green,
                  side: BorderSide(color: Colors.green),
                ),
              ),

              SizedBox(height: 40),

              // Qo'llanma
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.blue),
                        SizedBox(width: 8),
                        Text(
                          'Qo\'lda qo\'shish',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      '1. Home screenda bo\'sh joyni bosib turing\n'
                          '2. Widgets bo\'limini tanlang\n'
                          '3. "Home Widget Demo" ni toping va qo\'shing',
                      style: TextStyle(fontSize: 14, height: 1.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}