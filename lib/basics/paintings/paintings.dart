import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math' as math;


class PaintingEffectsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Painting & Effect Widgets'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.deepPurple],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purple.shade900, Colors.blue.shade900],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            // BackdropFilter
            _buildCard(
              title: '1. BackdropFilter',
              description: 'Rasmga blur va boshqa filterlar qo\'llaydi',
              child: BackdropFilterExample(),
            ),
            SizedBox(height: 20),

            // ClipOval
            _buildCard(
              title: '2. ClipOval',
              description: 'Widgetni oval shaklda kesib ko\'rsatadi',
              child: ClipOvalExample(),
            ),
            SizedBox(height: 20),

            // ClipPath
            _buildCard(
              title: '3. ClipPath',
              description: 'Custom path bilan kesish',
              child: ClipPathExample(),
            ),
            SizedBox(height: 20),

            // ClipRect
            _buildCard(
              title: '4. ClipRect',
              description: 'To\'rtburchak shaklda kesish',
              child: ClipRectExample(),
            ),
            SizedBox(height: 20),

            // CustomPaint
            _buildCard(
              title: '5. CustomPaint',
              description: 'Canvas ustida erkin chizish',
              child: CustomPaintExample(),
            ),
            SizedBox(height: 20),

            // DecoratedBox
            _buildCard(
              title: '6. DecoratedBox',
              description: 'Widget atrofiga dekoratsiya qo\'shish',
              child: DecoratedBoxExample(),
            ),
            SizedBox(height: 20),

            // FractionalTranslation
            _buildCard(
              title: '7. FractionalTranslation',
              description: 'Widget o\'lchamiga nisbatan ko\'chirish',
              child: FractionalTranslationExample(),
            ),
            SizedBox(height: 20),

            // Opacity
            _buildCard(
              title: '8. Opacity',
              description: 'Widgetni shaffof qilish',
              child: OpacityExample(),
            ),
            SizedBox(height: 20),

            // RotatedBox
            _buildCard(
              title: '9. RotatedBox',
              description: '90° ko\'paytmalarida aylantirish',
              child: RotatedBoxExample(),
            ),
            SizedBox(height: 20),

            // Transform
            _buildCard(
              title: '10. Transform',
              description: 'Murakkab transformatsiyalar',
              child: TransformExample(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String description,
    required Widget child,
  }) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
            SizedBox(height: 20),
            Center(child: child),
          ],
        ),
      ),
    );
  }
}

// 1. BackdropFilter Example
class BackdropFilterExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.purple, Colors.pink],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              '🌟 Orqa fon',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.white.withOpacity(0.2),
                child: Center(
                  child: Text(
                    'Blur Effect',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 2. ClipOval Example
class ClipOvalExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyan, Colors.blue],
          ),
        ),
        child: Center(
          child: Text(
            'Oval Shape',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// 3. ClipPath Example
class ClipPathExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TriangleClipper(),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.red],
          ),
        ),
        child: Center(
          child: Text(
            'Triangle',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// 4. ClipRect Example
class ClipRectExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Align(
        alignment: Alignment.center,
        widthFactor: 0.7,
        heightFactor: 0.7,
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.teal],
            ),
          ),
          child: Center(
            child: Text(
              'Clipped Rectangle',
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

// 5. CustomPaint Example
class CustomPaintExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(250, 250),
      painter: CirclePainter(),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint1 = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    Paint paint2 = Paint()
      ..color = Colors.purple
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    Paint paint3 = Paint()
      ..color = Colors.pink
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 80, paint1);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 60, paint2);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 40, paint3);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// 6. DecoratedBox Example
class DecoratedBoxExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple, Colors.purpleAccent],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.5),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Text(
          'Chiroyli Box 🎨',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
    );
  }
}

// 7. FractionalTranslation Example
class FractionalTranslationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              border: Border.all(color: Colors.white54, width: 2),
            ),
            child: Center(child: Text('Original', style: TextStyle(fontSize: 12))),
          ),
          FractionalTranslation(
            translation: Offset(1.5, 0.5),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, Colors.lightGreen],
                ),
              ),
              child: Center(
                child: Text('Moved', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 8. Opacity Example
class OpacityExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Opacity(
          opacity: 1.0,
          child: _buildBox('100%'),
        ),
        Opacity(
          opacity: 0.7,
          child: _buildBox('70%'),
        ),
        Opacity(
          opacity: 0.4,
          child: _buildBox('40%'),
        ),
        Opacity(
          opacity: 0.2,
          child: _buildBox('20%'),
        ),
      ],
    );
  }

  Widget _buildBox(String label) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// 9. RotatedBox Example
class RotatedBoxExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildRotatedBox(0, '0°'),
        _buildRotatedBox(1, '90°'),
        _buildRotatedBox(2, '180°'),
        _buildRotatedBox(3, '270°'),
      ],
    );
  }

  Widget _buildRotatedBox(int quarterTurns, String label) {
    return RotatedBox(
      quarterTurns: quarterTurns,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.deepOrange],
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    );
  }
}

// 10. Transform Example
class TransformExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: [
        // Rotate
        Transform.rotate(
          angle: math.pi / 6,
          child: _buildBox('Rotate', Colors.purple),
        ),
        // Scale
        Transform.scale(
          scale: 1.3,
          child: _buildBox('Scale', Colors.pink),
        ),
        // Translate
        Transform.translate(
          offset: Offset(0, -10),
          child: _buildBox('Move', Colors.indigo),
        ),
      ],
    );
  }

  Widget _buildBox(String label, Color color) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}