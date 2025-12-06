import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 1. AppColors - Semantic nomlar bilan
class AppColors extends ThemeExtension<AppColors> {
  // Asosiy ranglar
  final Color primary;
  final Color secondary;
  final Color background;
  final Color surface;
  final Color error;

  // Matn ranglari
  final Color textPrimary;
  final Color textSecondary;
  final Color textDisabled;

  // UI element ranglari
  final Color border;
  final Color divider;
  final Color shadow;

  // Holat ranglari
  final Color success;
  final Color warning;
  final Color info;

  // Interactive ranglari
  final Color selected;
  final Color unselected;
  final Color hover;
  final Color pressed;

  AppColors({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.error,
    required this.textPrimary,
    required this.textSecondary,
    required this.textDisabled,
    required this.border,
    required this.divider,
    required this.shadow,
    required this.success,
    required this.warning,
    required this.info,
    required this.selected,
    required this.unselected,
    required this.hover,
    required this.pressed,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? surface,
    Color? error,
    Color? textPrimary,
    Color? textSecondary,
    Color? textDisabled,
    Color? border,
    Color? divider,
    Color? shadow,
    Color? success,
    Color? warning,
    Color? info,
    Color? selected,
    Color? unselected,
    Color? hover,
    Color? pressed,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      error: error ?? this.error,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textDisabled: textDisabled ?? this.textDisabled,
      border: border ?? this.border,
      divider: divider ?? this.divider,
      shadow: shadow ?? this.shadow,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      selected: selected ?? this.selected,
      unselected: unselected ?? this.unselected,
      hover: hover ?? this.hover,
      pressed: pressed ?? this.pressed,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      error: Color.lerp(error, other.error, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      border: Color.lerp(border, other.border, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
      selected: Color.lerp(selected, other.selected, t)!,
      unselected: Color.lerp(unselected, other.unselected, t)!,
      hover: Color.lerp(hover, other.hover, t)!,
      pressed: Color.lerp(pressed, other.pressed, t)!,
    );
  }

  // Light mode
  static final light = AppColors(
    primary: Colors.blue,
    secondary: Colors.green,
    background: Colors.white,
    surface: Colors.grey[100]!,
    error: Colors.red,
    textPrimary: Colors.black87,
    textSecondary: Colors.black54,
    textDisabled: Colors.black26,
    border: Colors.grey[300]!,
    divider: Colors.grey[200]!,
    shadow: Colors.black12,
    success: Colors.green,
    warning: Colors.orange,
    info: Colors.blue,
    selected: Colors.blue,
    unselected: Colors.grey,
    hover: Colors.blue.withOpacity(0.1),
    pressed: Colors.blue.withOpacity(0.2),
  );

  // Dark mode
  static final dark = AppColors(
    primary: Colors.blueAccent,
    secondary: Colors.greenAccent,
    background: Color(0xFF121212),
    surface: Color(0xFF1E1E1E),
    error: Colors.redAccent,
    textPrimary: Colors.white,
    textSecondary: Colors.white70,
    textDisabled: Colors.white38,
    border: Colors.grey[700]!,
    divider: Colors.grey[800]!,
    shadow: Colors.black54,
    success: Colors.greenAccent,
    warning: Colors.orangeAccent,
    info: Colors.blueAccent,
    selected: Colors.blueAccent,
    unselected: Colors.grey[600]!,
    hover: Colors.blueAccent.withOpacity(0.1),
    pressed: Colors.blueAccent.withOpacity(0.2),
  );
}

// 2. Extension - super oson ishlatish
extension ThemeExt on BuildContext {
  AppColors get c => Theme.of(this).extension<AppColors>()!;
}

// 3. Theme Provider
class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;
  bool get isDark => _themeMode == ThemeMode.dark;

  void toggle() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void setMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}

// 4. Main App
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeProvider _theme = ThemeProvider();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _theme,
      builder: (context, _) {
        return MaterialApp(
          title: 'Theme Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            extensions: [AppColors.light],
          ),
          darkTheme: ThemeData.dark().copyWith(
            extensions: [AppColors.dark],
          ),
          themeMode: _theme.themeMode,
          home: HomePage(theme: _theme),
        );
      },
    );
  }
}

// 5. Home Page - Juda sodda ishlatish misollari
class HomePage extends StatefulWidget {
  final ThemeProvider theme;
  const HomePage({super.key, required this.theme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTab = 0;
  bool isChecked = false;
  String selectedOption = 'option1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.c.background,
      appBar: AppBar(
        title: Text('Theme Demo', style: TextStyle(color: context.c.textPrimary)),
        backgroundColor: context.c.primary,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              widget.theme.isDark ? Icons.light_mode : Icons.dark_mode,
              color: Colors.white,
            ),
            onPressed: widget.theme.toggle,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Oddiy matn - logika yo'q!
            Text(
              'Salom, Flutter!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: context.c.textPrimary),
            ),
            SizedBox(height: 4),
            Text(
              'Hech qanday isSelected logika kerak emas',
              style: TextStyle(fontSize: 14, color: context.c.textSecondary),
            ),
            SizedBox(height: 24),

            // Tab'lar - selected/unselected avtomatik
            Text('Tab misollar:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: context.c.textPrimary)),
            SizedBox(height: 12),
            Row(
              children: [
                _tab('Bosh sahifa', 0),
                SizedBox(width: 8),
                _tab('Sozlamalar', 1),
                SizedBox(width: 8),
                _tab('Profil', 2),
              ],
            ),
            SizedBox(height: 24),

            // Checkbox - hech qanday rang logikasi yo'q
            Text('Checkbox misol:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: context.c.textPrimary)),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: context.c.surface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: context.c.border),
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (val) => setState(() => isChecked = val!),
                    activeColor: context.c.selected,
                  ),
                  Text('Shartlarga roziman', style: TextStyle(color: context.c.textPrimary)),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Radio - avtomatik ranglar
            Text('Radio misollar:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: context.c.textPrimary)),
            SizedBox(height: 12),
            _radioOption('Variant 1', 'option1'),
            _radioOption('Variant 2', 'option2'),
            _radioOption('Variant 3', 'option3'),
            SizedBox(height: 24),

            // Card - hover effect bilan
            Text('Card misol:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: context.c.textPrimary)),
            SizedBox(height: 12),
            _card('Mahsulot 1', 'Narxi: 50,000 so\'m'),
            SizedBox(height: 8),
            _card('Mahsulot 2', 'Narxi: 75,000 so\'m'),
            SizedBox(height: 24),

            // Tugmalar - turli holatlar
            Text('Tugma misollari:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: context.c.textPrimary)),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.c.primary,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text('Primary'),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.c.success,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text('Success'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.c.warning,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text('Warning'),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.c.error,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text('Error'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

            // Divider
            Divider(color: context.c.divider, thickness: 1),
            SizedBox(height: 24),

            // Status card'lar
            Text('Status card\'lar:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: context.c.textPrimary)),
            SizedBox(height: 12),
            _statusCard('Muvaffaqiyatli!', 'Amal bajarildi', context.c.success, Icons.check_circle),
            SizedBox(height: 8),
            _statusCard('Ogohlantirish', 'Diqqat qiling', context.c.warning, Icons.warning),
            SizedBox(height: 8),
            _statusCard('Xatolik', 'Qaytadan urinib ko\'ring', context.c.error, Icons.error),
          ],
        ),
      ),
    );
  }

  Widget _tab(String title, int index) {
    final isActive = selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? context.c.selected : context.c.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isActive ? context.c.selected : context.c.border,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : context.c.textSecondary,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _radioOption(String title, String value) {
    final isSelected = selectedOption == value;
    return GestureDetector(
      onTap: () => setState(() => selectedOption = value),
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.c.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? context.c.selected : context.c.border,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? context.c.selected : context.c.unselected,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.c.selected,
                  ),
                ),
              )
                  : null,
            ),
            SizedBox(width: 12),
            Text(title, style: TextStyle(color: context.c.textPrimary)),
          ],
        ),
      ),
    );
  }

  Widget _card(String title, String subtitle) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.c.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.c.border),
        boxShadow: [
          BoxShadow(
            color: context.c.shadow,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: context.c.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.shopping_bag, color: context.c.primary),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: context.c.textPrimary)),
                SizedBox(height: 4),
                Text(subtitle, style: TextStyle(fontSize: 14, color: context.c.textSecondary)),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: context.c.textSecondary),
        ],
      ),
    );
  }

  Widget _statusCard(String title, String message, Color statusColor, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: statusColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: statusColor, size: 28),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: statusColor)),
                SizedBox(height: 2),
                Text(message, style: TextStyle(fontSize: 14, color: context.c.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}