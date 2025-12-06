import 'package:flutter/material.dart';


class ButtonsHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Tugmalar Kolleksiyasi'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildCard(context, '1. Asosiy Tugmalar', BasicButtonsPage(), Colors.blue),
          _buildCard(context, '2. Rangli Tugmalar', ColoredButtonsPage(), Colors.red),
          _buildCard(context, '3. Icon Tugmalar', IconButtonsPage(), Colors.green),
          _buildCard(context, '4. Gradient Tugmalar', GradientButtonsPage(), Colors.purple),
          _buildCard(context, '5. Animatsiyali Tugmalar', AnimatedButtonsPage(), Colors.orange),
          _buildCard(context, '6. Custom Dizayn Tugmalar', CustomButtonsPage(), Colors.teal),
          _buildCard(context, '7. Loading Tugmalar', LoadingButtonsPage(), Colors.indigo),
          _buildCard(context, '8. Social Media Tugmalar', SocialButtonsPage(), Colors.pink),
          _buildCard(context, '9. Shaklli Tugmalar', ShapedButtonsPage(), Colors.cyan),
          _buildCard(context, '10. Badge Tugmalar', BadgeButtonsPage(), Colors.amber),
          _buildCard(context, '11. Segmented Tugmalar', SegmentedButtonsPage(), Colors.lime),
          _buildCard(context, '12. Toggle Tugmalar', ToggleButtonsPage(), Colors.brown),
          _buildCard(context, '13. Chip Tugmalar', ChipButtonsPage(), Colors.deepOrange),
          _buildCard(context, '14. Hoverli Tugmalar', HoverButtonsPage(), Colors.blueGrey),
          _buildCard(context, '15. Mor Effektli Tugmalar', MorphButtonsPage(), Colors.deepPurple.shade300),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, Widget page, Color color) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.1), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.touch_app, color: Colors.white, size: 24),
          ),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios, size: 16, color: color),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => page));
          },
        ),
      ),
    );
  }
}

// 1. Asosiy Tugmalar
class BasicButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Asosiy Tugmalar'), backgroundColor: Colors.blue),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Material 3 Tugmalari', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),

            ElevatedButton(onPressed: () {}, child: Text('ElevatedButton')),
            SizedBox(height: 12),

            FilledButton(onPressed: () {}, child: Text('FilledButton')),
            SizedBox(height: 12),

            FilledButton.tonal(onPressed: () {}, child: Text('FilledButton.tonal')),
            SizedBox(height: 12),

            OutlinedButton(onPressed: () {}, child: Text('OutlinedButton')),
            SizedBox(height: 12),

            TextButton(onPressed: () {}, child: Text('TextButton')),
            SizedBox(height: 12),

            ElevatedButton(onPressed: null, child: Text('Disabled Button')),

            SizedBox(height: 30),
            Text('O\'lchamlar', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              onPressed: () {},
              child: Text('Kichik'),
            ),
            SizedBox(height: 12),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: () {},
              child: Text('O\'rtacha'),
            ),
            SizedBox(height: 12),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              onPressed: () {},
              child: Text('Katta', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('To\'liq kenglik', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 2. Rangli Tugmalar
class ColoredButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rangli Tugmalar'), backgroundColor: Colors.red),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _colorButton('Qizil', Colors.red, Colors.white),
            _colorButton('Yashil', Colors.green, Colors.white),
            _colorButton('Ko\'k', Colors.blue, Colors.white),
            _colorButton('Sariq', Colors.yellow, Colors.black),
            _colorButton('Pushti', Colors.pink, Colors.white),
            _colorButton('Binafsha', Colors.purple, Colors.white),
            _colorButton('To\'q sariq', Colors.orange, Colors.white),
            _colorButton('Ko\'k-yashil', Colors.teal, Colors.white),
            _colorButton('Indigo', Colors.indigo, Colors.white),
            _colorButton('Jigarrang', Colors.brown, Colors.white),

            SizedBox(height: 20),
            Text('Gradient Kombinatsiyalar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            _gradientColorButton('Osmonda', [Colors.blue.shade400, Colors.lightBlue.shade200]),
            _gradientColorButton('Quyosh', [Colors.orange, Colors.yellow]),
            _gradientColorButton('Dengiz', [Colors.cyan, Colors.blue]),
            _gradientColorButton('Tog\'', [Colors.green.shade700, Colors.green.shade300]),
            _gradientColorButton('Qorongʻi', [Colors.grey.shade900, Colors.grey.shade700]),
          ],
        ),
      ),
    );
  }

  Widget _colorButton(String text, Color bg, Color fg) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: () {},
        child: Text(text, style: TextStyle(fontSize: 16)),
      ),
    );
  }

  Widget _gradientColorButton(String text, List<Color> colors) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: () {},
          child: Text(text, style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
      ),
    );
  }
}

// 3. Icon Tugmalar
class IconButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Icon Tugmalar'), backgroundColor: Colors.green),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Icon bilan tugmalar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text('Qo\'shish'),
            ),
            SizedBox(height: 12),

            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.edit),
              label: Text('Tahrirlash'),
            ),
            SizedBox(height: 12),

            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.delete),
              label: Text('O\'chirish'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
            SizedBox(height: 12),

            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.download),
              label: Text('Yuklab olish'),
            ),
            SizedBox(height: 12),

            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.share),
              label: Text('Ulashish'),
            ),

            SizedBox(height: 30),
            Text('Icon tugmalar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(icon: Icon(Icons.favorite, color: Colors.red, size: 35), onPressed: () {}),
                IconButton(icon: Icon(Icons.star, color: Colors.amber, size: 35), onPressed: () {}),
                IconButton(icon: Icon(Icons.bookmark, color: Colors.blue, size: 35), onPressed: () {}),
                IconButton(icon: Icon(Icons.thumb_up, color: Colors.green, size: 35), onPressed: () {}),
              ],
            ),
            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton.filled(icon: Icon(Icons.add), onPressed: () {}),
                IconButton.filledTonal(icon: Icon(Icons.edit), onPressed: () {}),
                IconButton.outlined(icon: Icon(Icons.delete), onPressed: () {}),
                IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
              ],
            ),

            SizedBox(height: 30),
            Text('FAB Tugmalar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton.small(
                  onPressed: () {},
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.add),
                ),
                FloatingActionButton.large(
                  onPressed: () {},
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 20),

            FloatingActionButton.extended(
              onPressed: () {},
              icon: Icon(Icons.navigation),
              label: Text('Yo\'nalish'),
            ),
            SizedBox(height: 12),

            FloatingActionButton.extended(
              onPressed: () {},
              icon: Icon(Icons.message),
              label: Text('Xabar yuborish'),
              backgroundColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

// 4. Gradient Tugmalar
class GradientButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gradient Tugmalar'), backgroundColor: Colors.purple),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _gradientBtn('Ko\'k Gradient', [Colors.blue, Colors.cyan]),
            _gradientBtn('Qizil Gradient', [Colors.red, Colors.orange]),
            _gradientBtn('Yashil Gradient', [Colors.green, Colors.lightGreen]),
            _gradientBtn('Pushti Gradient', [Colors.pink, Colors.purple]),
            _gradientBtn('Sariq Gradient', [Colors.orange, Colors.yellow]),

            SizedBox(height: 20),
            Text('Shadow bilan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            _gradientBtnWithShadow('Neon Ko\'k', [Colors.blue, Colors.cyan], Colors.blue),
            _gradientBtnWithShadow('Neon Pushti', [Colors.pink, Colors.purple], Colors.pink),
            _gradientBtnWithShadow('Neon Yashil', [Colors.green, Colors.teal], Colors.green),

            SizedBox(height: 20),
            Text('Diagonal Gradient', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            _diagonalGradient('Quyosh chiqishi', [Colors.orange, Colors.pink, Colors.purple]),
            _diagonalGradient('Dengiz', [Colors.blue, Colors.cyan, Colors.teal]),
            _diagonalGradient('Qora tog\'', [Colors.grey.shade900, Colors.grey.shade600, Colors.grey.shade400]),
          ],
        ),
      ),
    );
  }

  Widget _gradientBtn(String text, List<Color> colors) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: () {},
          child: Text(text, style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
      ),
    );
  }

  Widget _gradientBtnWithShadow(String text, List<Color> colors, Color shadowColor) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.5),
              blurRadius: 15,
              spreadRadius: 2,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          ),
          onPressed: () {},
          child: Text(text, style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _diagonalGradient(String text, List<Color> colors) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: () {},
          child: Text(text, style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
      ),
    );
  }
}

// 5. Animatsiyali Tugmalar
class AnimatedButtonsPage extends StatefulWidget {
  @override
  _AnimatedButtonsPageState createState() => _AnimatedButtonsPageState();
}

class _AnimatedButtonsPageState extends State<AnimatedButtonsPage> {
  bool _pressed1 = false;
  bool _pressed2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animatsiyali Tugmalar'), backgroundColor: Colors.orange),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Scale animatsiya', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            GestureDetector(
              onTapDown: (_) => setState(() => _pressed1 = true),
              onTapUp: (_) => setState(() => _pressed1 = false),
              onTapCancel: () => setState(() => _pressed1 = false),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                transform: Matrix4.identity()..scale(_pressed1 ? 0.95 : 1.0),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text('Bosing!', style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
              ),
            ),

            SizedBox(height: 30),
            Text('Bounce animatsiya', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            _BounceButton(),

            SizedBox(height: 30),
            Text('Pulse animatsiya', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            _PulseButton(),

            SizedBox(height: 30),
            Text('Ripple effect', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                splashColor: Colors.purple.withOpacity(0.3),
                highlightColor: Colors.purple.withOpacity(0.1),
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text('Ripple Effect', style: TextStyle(color: Colors.purple, fontSize: 16)),
                  ),
                ),
              ),
            ),

            SizedBox(height: 30),
            Text('Shake animatsiya', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            _ShakeButton(),

            SizedBox(height: 30),
            Text('Rotate animatsiya', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            _RotateButton(),
          ],
        ),
      ),
    );
  }
}

class _BounceButton extends StatefulWidget {
  @override
  __BounceButtonState createState() => __BounceButtonState();
}

class __BounceButtonState extends State<_BounceButton> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    _anim = Tween<double>(begin: 1.0, end: 1.2).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _ctrl.forward().then((_) => _ctrl.reverse());
      },
      child: ScaleTransition(
        scale: _anim,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text('Bounce!', style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ),
      ),
    );
  }
}

class _PulseButton extends StatefulWidget {
  @override
  __PulseButtonState createState() => __PulseButtonState();
}

class __PulseButtonState extends State<_PulseButton> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(duration: Duration(seconds: 1), vsync: this)..repeat(reverse: true);
    _anim = Tween<double>(begin: 1.0, end: 1.1).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _anim,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text('Pulse', style: TextStyle(color: Colors.white, fontSize: 16)),
        ),
      ),
    );
  }
}

class _ShakeButton extends StatefulWidget {
  @override
  __ShakeButtonState createState() => __ShakeButtonState();
}

class __ShakeButtonState extends State<_ShakeButton> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _anim = Tween<double>(begin: 0, end: 10).animate(CurvedAnimation(parent: _ctrl, curve: Curves.elasticIn));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _shake() {
    _ctrl.forward().then((_) => _ctrl.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_anim.value * ((_ctrl.value * 4).floor() % 2 == 0 ? 1 : -1), 0),
          child: child,
        );
      },
      child: GestureDetector(
        onTap: _shake,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text('Shake!', style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ),
      ),
    );
  }
}

class _RotateButton extends StatefulWidget {
  @override
  __RotateButtonState createState() => __RotateButtonState();
}

class __RotateButtonState extends State<_RotateButton> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _rotate() {
    _ctrl.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _rotate,
      child: RotationTransition(
        turns: _ctrl,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text('Rotate!', style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ),
      ),
    );
  }
}

// 6. Custom Dizayn Tugmalar
class CustomButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Dizayn'), backgroundColor: Colors.teal),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Neon tugmalar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            _neonButton('Neon Ko\'k', Colors.cyan),
            _neonButton('Neon Pushti', Colors.pink),
            _neonButton('Neon Yashil', Colors.green),

            SizedBox(height: 30),
            Text('3D tugmalar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            _3dButton('3D Ko\'k', Colors.blue, Colors.blue.shade900),
            _3dButton('3D Qizil', Colors.red, Colors.red.shade900),
            _3dButton('3D Yashil', Colors.green, Colors.green.shade900),

            SizedBox(height: 30),
            Text('Glass tugmalar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            _glassButton('Glass Effect'),
            _glassButton('Frosted Glass'),

            SizedBox(height: 30),
            Text('Neumorphism', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            _neumorphicButton('Neumorphic 1'),
            _neumorphicButton('Neumorphic 2'),
          ],
        ),
      ),
    );
  }

  Widget _neonButton(String text, Color color) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: color.withOpacity(0.6), blurRadius: 20, spreadRadius: 2),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: color,
            padding: EdgeInsets.symmetric(vertical: 15),
            side: BorderSide(color: color, width: 2),
          ),
          onPressed: () {},
          child: Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _3dButton(String text, Color topColor, Color bottomColor) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: bottomColor, offset: Offset(0, 6))],
        ),
        child: Material(
          color: topColor,
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: Text(text, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _glassButton(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white.withOpacity(0.2), Colors.white.withOpacity(0.1)],
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: Text(text, style: TextStyle(color: Colors.black87, fontSize: 16)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _neumorphicButton(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(color: Colors.grey.shade500, offset: Offset(4, 4), blurRadius: 15),
            BoxShadow(color: Colors.white, offset: Offset(-4, -4), blurRadius: 15),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: Text(text, style: TextStyle(color: Colors.black87, fontSize: 16)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// 7. Loading Tugmalar
class LoadingButtonsPage extends StatefulWidget {
  @override
  _LoadingButtonsPageState createState() => _LoadingButtonsPageState();
}

class _LoadingButtonsPageState extends State<LoadingButtonsPage> {
  bool _loading1 = false;
  bool _loading2 = false;
  bool _loading3 = false;
  bool _loading4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loading Tugmalar'), backgroundColor: Colors.indigo),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Spinner bilan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            ElevatedButton(
              style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 15)),
              onPressed: _loading1 ? null : () {
                setState(() => _loading1 = true);
                Future.delayed(Duration(seconds: 3), () => setState(() => _loading1 = false));
              },
              child: _loading1
                  ? SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation(Colors.white)))
                  : Text('Yuklash 1'),
            ),

            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, padding: EdgeInsets.symmetric(vertical: 15)),
              onPressed: _loading2 ? null : () {
                setState(() => _loading2 = true);
                Future.delayed(Duration(seconds: 3), () => setState(() => _loading2 = false));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_loading2) ...[
                    SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation(Colors.white))),
                    SizedBox(width: 10),
                  ],
                  Text(_loading2 ? 'Yuklanmoqda...' : 'Yuborish'),
                ],
              ),
            ),

            SizedBox(height: 30),
            Text('Progress bar bilan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            _ProgressButton(),

            SizedBox(height: 30),
            Text('Dots animatsiya', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple, padding: EdgeInsets.symmetric(vertical: 15)),
              onPressed: _loading3 ? null : () {
                setState(() => _loading3 = true);
                Future.delayed(Duration(seconds: 3), () => setState(() => _loading3 = false));
              },
              child: _loading3 ? _DotsLoader() : Text('Dots Loading'),
            ),

            SizedBox(height: 30),
            Text('Success animatsiya', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            _SuccessButton(),
          ],
        ),
      ),
    );
  }
}

class _DotsLoader extends StatefulWidget {
  @override
  __DotsLoaderState createState() => __DotsLoaderState();
}

class __DotsLoaderState extends State<_DotsLoader> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(duration: Duration(milliseconds: 1200), vsync: this)..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (i) {
        return AnimatedBuilder(
          animation: _ctrl,
          builder: (context, child) {
            final delay = i * 0.2;
            final opacity = ((_ctrl.value + delay) % 1.0) > 0.5 ? 1.0 : 0.3;
            return Opacity(
              opacity: opacity,
              child: Container(
                width: 8,
                height: 8,
                margin: EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              ),
            );
          },
        );
      }),
    );
  }
}

class _ProgressButton extends StatefulWidget {
  @override
  __ProgressButtonState createState() => __ProgressButtonState();
}

class __ProgressButtonState extends State<_ProgressButton> {
  double _progress = 0;
  bool _isLoading = false;

  void _startLoading() {
    setState(() {
      _isLoading = true;
      _progress = 0;
    });

    Future.doWhile(() async {
      await Future.delayed(Duration(milliseconds: 50));
      setState(() => _progress += 0.02);
      return _progress < 1.0;
    }).then((_) {
      setState(() => _isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: _progress,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: _isLoading ? null : _startLoading,
              child: Center(
                child: Text(
                  _isLoading ? '${(_progress * 100).toInt()}%' : 'Progress Button',
                  style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SuccessButton extends StatefulWidget {
  @override
  __SuccessButtonState createState() => __SuccessButtonState();
}

class __SuccessButtonState extends State<_SuccessButton> {
  bool _loading = false;
  bool _success = false;

  void _process() {
    setState(() {
      _loading = true;
      _success = false;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _loading = false;
        _success = true;
      });
      Future.delayed(Duration(seconds: 2), () {
        setState(() => _success = false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _success ? Colors.green : Colors.blue,
        padding: EdgeInsets.symmetric(vertical: 15),
      ),
      onPressed: (_loading || _success) ? null : _process,
      child: _loading
          ? SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation(Colors.white)))
          : _success
          ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(Icons.check, color: Colors.white), SizedBox(width: 8), Text('Muvaffaqiyatli!')],
      )
          : Text('Success Button'),
    );
  }
}

// 8. Social Media Tugmalar
class SocialButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Social Media'), backgroundColor: Colors.pink),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _socialBtn('Facebook', Colors.blue.shade900, Icons.facebook),
            _socialBtn('Twitter', Colors.blue.shade400, Icons.close),
            _socialBtn('Instagram', Colors.purple, Icons.camera_alt),
            _socialBtn('LinkedIn', Colors.blue.shade700, Icons.business),
            _socialBtn('YouTube', Colors.red, Icons.play_arrow),
            _socialBtn('WhatsApp', Colors.green, Icons.chat),
            _socialBtn('Telegram', Colors.blue, Icons.send),
            _socialBtn('TikTok', Colors.black, Icons.music_note),
            _socialBtn('Pinterest', Colors.red.shade700, Icons.push_pin),
            _socialBtn('Snapchat', Colors.yellow.shade600, Icons.camera),
          ],
        ),
      ),
    );
  }

  Widget _socialBtn(String name, Color color, IconData icon) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: SizedBox(
        height: 50,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onPressed: () {},
          icon: Icon(icon),
          label: Text('$name bilan kirish'),
        ),
      ),
    );
  }
}

// 9. Shaklli Tugmalar
class ShapedButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shaklli Tugmalar'), backgroundColor: Colors.cyan),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Turli shakllar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            // Doira
            Center(
              child: Container(
                width: 80,
                height: 80,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {},
                  child: Icon(Icons.add, color: Colors.white, size: 30),
                ),
              ),
            ),

            SizedBox(height: 20),
            // Kvadrat
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                padding: EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.red,
              ),
              onPressed: () {},
              child: Text('Kvadrat'),
            ),

            SizedBox(height: 16),
            // Dumaloq
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.green,
              ),
              onPressed: () {},
              child: Text('Juda dumaloq'),
            ),

            SizedBox(height: 16),
            // Stadium
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.purple,
              ),
              onPressed: () {},
              child: Text('Stadium shakl'),
            ),

            SizedBox(height: 16),
            // Beveled
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.orange,
              ),
              onPressed: () {},
              child: Text('Beveled shakl'),
            ),

            SizedBox(height: 30),
            Text('Chiziqli tugmalar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.blue, width: 2),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {},
              child: Text('Chiziqli'),
            ),

            SizedBox(height: 16),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.red, width: 3),
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {},
              child: Text('Qalin chiziqli'),
            ),

            SizedBox(height: 16),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.green, width: 2, style: BorderStyle.solid),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {},
              child: Text('Dumaloq chiziqli'),
            ),
          ],
        ),
      ),
    );
  }
}

// 10. Badge Tugmalar
class BadgeButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Badge Tugmalar'), backgroundColor: Colors.amber),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Notification badge', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _badgeIconButton(Icons.notifications, 5),
                _badgeIconButton(Icons.message, 12),
                _badgeIconButton(Icons.email, 99),
                _badgeIconButton(Icons.shopping_cart, 3),
              ],
            ),

            SizedBox(height: 30),
            Text('Badge tugmalar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),

            _badgeButton('Xabarlar', Icons.message, 5, Colors.blue),
            SizedBox(height: 16),
            _badgeButton('Bildirishnomalar', Icons.notifications, 12, Colors.red),
            SizedBox(height: 16),
            _badgeButton('Savatcha', Icons.shopping_cart, 3, Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _badgeIconButton(IconData icon, int count) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          icon: Icon(icon, size: 30),
          onPressed: () {},
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            constraints: BoxConstraints(minWidth: 20, minHeight: 20),
            child: Text(
              count > 99 ? '99+' : '$count',
              style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget _badgeButton(String text, IconData icon, int count, Color color) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            minimumSize: Size(double.infinity, 50),
          ),
          onPressed: () {},
          icon: Icon(icon),
          label: Text(text),
        ),
        Positioned(
          right: 10,
          top: -5,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '$count',
              style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

// 11. Segmented Tugmalar
class SegmentedButtonsPage extends StatefulWidget {
  @override
  _SegmentedButtonsPageState createState() => _SegmentedButtonsPageState();
}

class _SegmentedButtonsPageState extends State<SegmentedButtonsPage> {
  int _selected1 = 0;
  Set<int> _multiSelected = {0};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Segmented Tugmalar'), backgroundColor: Colors.lime),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bitta tanlov', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            Row(
              children: List.generate(3, (i) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _selected1 == i ? Colors.blue : Colors.grey.shade300,
                        foregroundColor: _selected1 == i ? Colors.white : Colors.black,
                      ),
                      onPressed: () => setState(() => _selected1 = i),
                      child: Text(['Bir', 'Ikki', 'Uch'][i]),
                    ),
                  ),
                );
              }),
            ),

            SizedBox(height: 30),
            Text('Ko\'p tanlov', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            Wrap(
              spacing: 8,
              children: List.generate(5, (i) {
                final isSelected = _multiSelected.contains(i);
                return FilterChip(
                  label: Text('Variant ${i + 1}'),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _multiSelected.add(i);
                      } else {
                        _multiSelected.remove(i);
                      }
                    });
                  },
                );
              }),
            ),

            SizedBox(height: 30),
            Text('Segmented Button (Material 3)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            SegmentedButton<int>(
              segments: [
                ButtonSegment(value: 0, label: Text('Barchasi'), icon: Icon(Icons.list)),
                ButtonSegment(value: 1, label: Text('Aktiv'), icon: Icon(Icons.check_circle)),
                ButtonSegment(value: 2, label: Text('Arxiv'), icon: Icon(Icons.archive)),
              ],
              selected: {_selected1},
              onSelectionChanged: (Set<int> selected) {
                setState(() => _selected1 = selected.first);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// 12. Toggle Tugmalar
class ToggleButtonsPage extends StatefulWidget {
  @override
  _ToggleButtonsPageState createState() => _ToggleButtonsPageState();
}

class _ToggleButtonsPageState extends State<ToggleButtonsPage> {
  List<bool> _selections1 = [true, false, false];
  List<bool> _selections2 = [false, false, false];
  bool _switch1 = false;
  bool _switch2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Toggle Tugmalar'), backgroundColor: Colors.brown),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Toggle Buttons', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            ToggleButtons(
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Icon(Icons.format_bold)),
                Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Icon(Icons.format_italic)),
                Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Icon(Icons.format_underlined)),
              ],
              isSelected: _selections1,
              onPressed: (int index) {
                setState(() => _selections1[index] = !_selections1[index]);
              },
            ),

            SizedBox(height: 30),
            Text('Switch', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            SwitchListTile(
              title: Text('Bildirishnomalar'),
              subtitle: Text('Yangilanishlardan xabardor bo\'ling'),
              value: _switch1,
              onChanged: (val) => setState(() => _switch1 = val),
            ),

            SwitchListTile(
              title: Text('Qorong\'i rejim'),
              subtitle: Text('Tungi ko\'rinish'),
              value: _switch2,
              onChanged: (val) => setState(() => _switch2 = val),
            ),

            SizedBox(height: 30),
            Text('Radio Buttons', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            ...List.generate(3, (i) {
              return RadioListTile<int>(
                title: Text('Variant ${i + 1}'),
                value: i,
                groupValue: _selections2.indexOf(true),
                onChanged: (val) {
                  setState(() {
                    _selections2 = [false, false, false];
                    _selections2[val!] = true;
                  });
                },
              );
            }),

            SizedBox(height: 30),
            Text('Checkbox', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            CheckboxListTile(
              title: Text('Birinchi variant'),
              value: _selections2[0],
              onChanged: (val) => setState(() => _selections2[0] = val!),
            ),
            CheckboxListTile(
              title: Text('Ikkinchi variant'),
              value: _selections2[1],
              onChanged: (val) => setState(() => _selections2[1] = val!),
            ),
            CheckboxListTile(
              title: Text('Uchinchi variant'),
              value: _selections2[2],
              onChanged: (val) => setState(() => _selections2[2] = val!),
            ),
          ],
        ),
      ),
    );
  }
}

// 13. Chip Tugmalar
class ChipButtonsPage extends StatefulWidget {
  @override
  _ChipButtonsPageState createState() => _ChipButtonsPageState();
}

class _ChipButtonsPageState extends State<ChipButtonsPage> {
  Set<int> _selected = {0};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chip Tugmalar'), backgroundColor: Colors.deepOrange),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Action Chips', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            Wrap(
              spacing: 8,
              children: [
                ActionChip(label: Text('Qo\'shish'), avatar: Icon(Icons.add, size: 18), onPressed: () {}),
                ActionChip(label: Text('O\'chirish'), avatar: Icon(Icons.delete, size: 18), onPressed: () {}),
                ActionChip(label: Text('Tahrirlash'), avatar: Icon(Icons.edit, size: 18), onPressed: () {}),
                ActionChip(label: Text('Ulashish'), avatar: Icon(Icons.share, size: 18), onPressed: () {}),
              ],
            ),

            SizedBox(height: 30),
            Text('Filter Chips', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            Wrap(
              spacing: 8,
              children: List.generate(6, (i) {
                return FilterChip(
                  label: Text(['Sport', 'Texnologiya', 'Musiqa', 'San\'at', 'Sayohat', 'Ovqat'][i]),
                  selected: _selected.contains(i),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selected.add(i);
                      } else {
                        _selected.remove(i);
                      }
                    });
                  },
                );
              }),
            ),

            SizedBox(height: 30),
            Text('Choice Chips', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            Wrap(
              spacing: 8,
              children: List.generate(4, (i) {
                return ChoiceChip(
                  label: Text(['XS', 'S', 'M', 'L'][i]),
                  selected: _selected.contains(i + 10),
                  onSelected: (selected) {
                    setState(() {
                      _selected.removeWhere((item) => item >= 10 && item < 20);
                      if (selected) _selected.add(i + 10);
                    });
                  },
                );
              }),
            ),

            SizedBox(height: 30),
            Text('Input Chips', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            Wrap(
              spacing: 8,
              children: [
                InputChip(label: Text('Flutter'), onDeleted: () {}, avatar: CircleAvatar(child: Text('F'))),
                InputChip(label: Text('Dart'), onDeleted: () {}, avatar: CircleAvatar(child: Text('D'))),
                InputChip(label: Text('Mobile'), onDeleted: () {}, avatar: CircleAvatar(child: Text('M'))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 14. Hoverli Tugmalar
class HoverButtonsPage extends StatefulWidget {
  @override
  _HoverButtonsPageState createState() => _HoverButtonsPageState();
}

class _HoverButtonsPageState extends State<HoverButtonsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hover Effektli Tugmalar'), backgroundColor: Colors.blueGrey),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Hover animatsiyalar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            _HoverScaleButton(),
            SizedBox(height: 16),

            _HoverShadowButton(),
            SizedBox(height: 16),

            _HoverColorButton(),
            SizedBox(height: 16),

            _HoverSlideButton(),
            SizedBox(height: 16),

            _HoverRotateButton(),
          ],
        ),
      ),
    );
  }
}

class _HoverScaleButton extends StatefulWidget {
  @override
  __HoverScaleButtonState createState() => __HoverScaleButtonState();
}

class __HoverScaleButtonState extends State<_HoverScaleButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          onPressed: () {},
          child: Text('Hover Scale Effect', style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}

class _HoverShadowButton extends StatefulWidget {
  @override
  __HoverShadowButtonState createState() => __HoverShadowButtonState();
}

class __HoverShadowButtonState extends State<_HoverShadowButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: _isHovered
              ? [BoxShadow(color: Colors.purple.withOpacity(0.5), blurRadius: 20, spreadRadius: 5)]
              : [BoxShadow(color: Colors.purple.withOpacity(0.2), blurRadius: 5)],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          onPressed: () {},
          child: Text('Hover Shadow Effect', style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}

class _HoverColorButton extends StatefulWidget {
  @override
  __HoverColorButtonState createState() => __HoverColorButtonState();
}

class __HoverColorButtonState extends State<_HoverColorButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: _isHovered ? Colors.green.shade700 : Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: Text('Hover Color Change', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HoverSlideButton extends StatefulWidget {
  @override
  __HoverSlideButtonState createState() => __HoverSlideButtonState();
}

class __HoverSlideButtonState extends State<_HoverSlideButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Stack(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            left: _isHovered ? 0 : -400,
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Center(
                  child: Text('Hover Slide Effect', style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HoverRotateButton extends StatefulWidget {
  @override
  __HoverRotateButtonState createState() => __HoverRotateButtonState();
}

class __HoverRotateButtonState extends State<_HoverRotateButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        transform: Matrix4.identity()..rotateZ(_isHovered ? 0.02 : 0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          onPressed: () {},
          child: Text('Hover Rotate Effect', style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}

// 15. Morph Effektli Tugmalar
class MorphButtonsPage extends StatefulWidget {
  @override
  _MorphButtonsPageState createState() => _MorphButtonsPageState();
}

class _MorphButtonsPageState extends State<MorphButtonsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Morph Effektli Tugmalar'), backgroundColor: Colors.deepPurple.shade300),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Shakl o\'zgarishi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            _MorphShapeButton(),
            SizedBox(height: 30),

            Text('Tugmadan doiraga', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            _MorphCircleButton(),
            SizedBox(height: 30),

            Text('Kengayuvchi tugma', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            _ExpandingButton(),
            SizedBox(height: 30),

            Text('Flip tugma', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            _FlipButton(),
            SizedBox(height: 30),

            Text('Split tugma', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            _SplitButton(),
          ],
        ),
      ),
    );
  }
}

class _MorphShapeButton extends StatefulWidget {
  @override
  __MorphShapeButtonState createState() => __MorphShapeButtonState();
}

class __MorphShapeButtonState extends State<_MorphShapeButton> {
  bool _morphed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _morphed = !_morphed),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: _morphed ? Colors.green : Colors.blue,
          borderRadius: BorderRadius.circular(_morphed ? 25 : 10),
        ),
        child: Center(
          child: Text(
            _morphed ? 'Morf qilindi!' : 'Bosib ko\'ring',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class _MorphCircleButton extends StatefulWidget {
  @override
  __MorphCircleButtonState createState() => __MorphCircleButtonState();
}

class __MorphCircleButtonState extends State<_MorphCircleButton> {
  bool _isCircle = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => setState(() => _isCircle = !_isCircle),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          width: _isCircle ? 80 : 200,
          height: _isCircle ? 80 : 50,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(_isCircle ? 40 : 10),
          ),
          child: Center(
            child: _isCircle
                ? Icon(Icons.check, color: Colors.white, size: 30)
                : Text('Doiraga aylantir', style: TextStyle(color: Colors.white, fontSize: 14)),
          ),
        ),
      ),
    );
  }
}

class _ExpandingButton extends StatefulWidget {
  @override
  __ExpandingButtonState createState() => __ExpandingButtonState();
}

class __ExpandingButtonState extends State<_ExpandingButton> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: double.infinity,
        height: _expanded ? 200 : 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            _expanded ? 'Kengaydi!\n\nBu yerda ko\'proq\nma\'lumot bo\'lishi mumkin' : 'Kengaytirish',
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class _FlipButton extends StatefulWidget {
  @override
  __FlipButtonState createState() => __FlipButtonState();
}

class __FlipButtonState extends State<_FlipButton> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  bool _showFront = true;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(duration: Duration(milliseconds: 600), vsync: this);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _flip() {
    if (_showFront) {
      _ctrl.forward();
    } else {
      _ctrl.reverse();
    }
    setState(() => _showFront = !_showFront);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flip,
      child: AnimatedBuilder(
        animation: _ctrl,
        builder: (context, child) {
          final angle = _ctrl.value * 3.14159;
          final showFront = angle < 1.5708;

          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angle),
            alignment: Alignment.center,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: showFront ? Colors.blue : Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Transform(
                  transform: Matrix4.identity()..rotateY(showFront ? 0 : 3.14159),
                  alignment: Alignment.center,
                  child: Text(
                    showFront ? 'Old tomon' : 'Orqa tomon',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SplitButton extends StatefulWidget {
  @override
  __SplitButtonState createState() => __SplitButtonState();
}

class __SplitButtonState extends State<_SplitButton> {
  bool _split = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _split = !_split),
      child: SizedBox(
        height: 50,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              left: 0,
              right: _split ? MediaQuery.of(context).size.width / 2 + 4 : 0,
              top: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text('Chap', style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              left: _split ? MediaQuery.of(context).size.width / 2 - 24 : 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text('O\'ng', style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}