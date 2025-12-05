import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AnimationExamplesPage(),
    );
  }
}


class AnimationExamplesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Barcha Animatsiyalar')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildButton(context, 'AlignTransition', AlignTransitionExample()),
          _buildButton(context, 'AnimatedAlign', AnimatedAlignExample()),
          _buildButton(context, 'AnimatedBuilder', AnimatedBuilderExample()),
          _buildButton(context, 'AnimatedContainer', AnimatedContainerExample()),
          _buildButton(context, 'AnimatedCrossFade', AnimatedCrossFadeExample()),
          _buildButton(context, 'AnimatedDefaultTextStyle', AnimatedDefaultTextStyleExample()),
          _buildButton(context, 'AnimatedList', AnimatedListExample()),
          _buildButton(context, 'AnimatedModalBarrier', AnimatedModalBarrierExample()),
          _buildButton(context, 'AnimatedOpacity', AnimatedOpacityExample()),
          _buildButton(context, 'AnimatedPhysicalModel', AnimatedPhysicalModelExample()),
          _buildButton(context, 'AnimatedPositioned', AnimatedPositionedExample()),
          _buildButton(context, 'AnimatedSize', AnimatedSizeExample()),
          _buildButton(context, 'AnimatedWidget', AnimatedWidgetExample()),
          _buildButton(context, 'DecoratedBoxTransition', DecoratedBoxTransitionExample()),
          _buildButton(context, 'DefaultTextStyleTransition', DefaultTextStyleTransitionExample()),
          _buildButton(context, 'FadeTransition', FadeTransitionExample()),
          _buildButton(context, 'Hero', HeroAnimationExample()),
          _buildButton(context, 'MatrixTransition', MatrixTransitionExample()),
          _buildButton(context, 'PositionedTransition', PositionedTransitionExample()),
          _buildButton(context, 'RelativePositionedTransition', RelativePositionedTransitionExample()),
          _buildButton(context, 'RotationTransition', RotationTransitionExample()),
          _buildButton(context, 'ScaleTransition', ScaleTransitionExample()),
          _buildButton(context, 'SizeTransition', SizeTransitionExample()),
          _buildButton(context, 'SlideTransition', SlideTransitionExample()),
          _buildButton(context, 'SliverFadeTransition', SliverFadeTransitionExample()),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String title, Widget page) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
        child: Text(title),
      ),
    );
  }
}

// 1. AlignTransition
class AlignTransitionExample extends StatefulWidget {
  @override
  _AlignTransitionExampleState createState() => _AlignTransitionExampleState();
}

class _AlignTransitionExampleState extends State<AlignTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<AlignmentGeometry> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animation = Tween<AlignmentGeometry>(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AlignTransition')),
      body: AlignTransition(
        alignment: _animation,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
          child: Center(child: Text('Box', style: TextStyle(color: Colors.white))),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.status == AnimationStatus.completed) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

// 2. AnimatedAlign
class AnimatedAlignExample extends StatefulWidget {
  @override
  _AnimatedAlignExampleState createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  AlignmentGeometry _alignment = Alignment.topLeft;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedAlign')),
      body: AnimatedAlign(
        alignment: _alignment,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
          child: Center(child: Text('Box')),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _alignment = _alignment == Alignment.topLeft
                ? Alignment.bottomRight
                : Alignment.topLeft;
          });
        },
        child: Icon(Icons.swap_horiz),
      ),
    );
  }
}

// 3. AnimatedBuilder
class AnimatedBuilderExample extends StatefulWidget {
  @override
  _AnimatedBuilderExampleState createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedBuilder')),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * 3.14159,
              child: child,
            );
          },
          child: Container(
            width: 150,
            height: 150,
            color: Colors.purple,
            child: Center(child: Text('Rotating', style: TextStyle(color: Colors.white))),
          ),
        ),
      ),
    );
  }
}

// 4. AnimatedContainer
class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedContainer')),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          width: _isExpanded ? 300 : 100,
          height: _isExpanded ? 300 : 100,
          decoration: BoxDecoration(
            color: _isExpanded ? Colors.blue : Colors.red,
            borderRadius: BorderRadius.circular(_isExpanded ? 50 : 10),
          ),
          child: Center(
            child: Text('Tap!', style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _isExpanded = !_isExpanded),
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

// 5. AnimatedCrossFade
class AnimatedCrossFadeExample extends StatefulWidget {
  @override
  _AnimatedCrossFadeExampleState createState() => _AnimatedCrossFadeExampleState();
}

class _AnimatedCrossFadeExampleState extends State<AnimatedCrossFadeExample> {
  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedCrossFade')),
      body: Center(
        child: AnimatedCrossFade(
          firstChild: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: Center(child: Text('First', style: TextStyle(fontSize: 30))),
          ),
          secondChild: Container(
            width: 300,
            height: 100,
            color: Colors.red,
            child: Center(child: Text('Second', style: TextStyle(fontSize: 30))),
          ),
          crossFadeState: _showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: Duration(milliseconds: 500),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _showFirst = !_showFirst),
        child: Icon(Icons.swap_horiz),
      ),
    );
  }
}

// 6. AnimatedDefaultTextStyle
class AnimatedDefaultTextStyleExample extends StatefulWidget {
  @override
  _AnimatedDefaultTextStyleExampleState createState() =>
      _AnimatedDefaultTextStyleExampleState();
}

class _AnimatedDefaultTextStyleExampleState extends State<AnimatedDefaultTextStyleExample> {
  bool _large = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedDefaultTextStyle')),
      body: Center(
        child: AnimatedDefaultTextStyle(
          duration: Duration(milliseconds: 500),
          style: TextStyle(
            fontSize: _large ? 48 : 24,
            color: _large ? Colors.blue : Colors.red,
            fontWeight: _large ? FontWeight.bold : FontWeight.normal,
          ),
          child: Text('Animated Text'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _large = !_large),
        child: Icon(Icons.text_fields),
      ),
    );
  }
}

// 7. AnimatedList
class AnimatedListExample extends StatefulWidget {
  @override
  _AnimatedListExampleState createState() => _AnimatedListExampleState();
}

class _AnimatedListExampleState extends State<AnimatedListExample> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<int> _items = [0, 1, 2];
  int _nextItem = 3;

  void _addItem() {
    _items.insert(0, _nextItem++);
    _listKey.currentState?.insertItem(0);
  }

  void _removeItem(int index) {
    final item = _items.removeAt(index);
    _listKey.currentState?.removeItem(
      index,
          (context, animation) => _buildItem(item, animation),
    );
  }

  Widget _buildItem(int item, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        margin: EdgeInsets.all(8),
        child: ListTile(
          title: Text('Item $item'),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _removeItem(_items.indexOf(item)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedList')),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _items.length,
        itemBuilder: (context, index, animation) {
          return _buildItem(_items[index], animation);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: Icon(Icons.add),
      ),
    );
  }
}

// 8. AnimatedModalBarrier
class AnimatedModalBarrierExample extends StatefulWidget {
  @override
  _AnimatedModalBarrierExampleState createState() =>
      _AnimatedModalBarrierExampleState();
}

class _AnimatedModalBarrierExampleState extends State<AnimatedModalBarrierExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _showBarrier = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedModalBarrier')),
      body: Stack(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() => _showBarrier = true);
                _controller.forward();
              },
              child: Text('Show Barrier'),
            ),
          ),
          if (_showBarrier)
            AnimatedModalBarrier(
              color: _controller.drive(ColorTween(
                begin: Colors.transparent,
                end: Colors.black54,
              )),
              dismissible: true,
              onDismiss: () {
                _controller.reverse().then((_) {
                  setState(() => _showBarrier = false);
                });
              },
            ),
          if (_showBarrier)
            Center(
              child: Material(
                color: Colors.white,
                elevation: 8,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: EdgeInsets.all(32),
                  child: Text('Modal Content', style: TextStyle(fontSize: 24)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// 9. AnimatedOpacity
class AnimatedOpacityExample extends StatefulWidget {
  @override
  _AnimatedOpacityExampleState createState() => _AnimatedOpacityExampleState();
}

class _AnimatedOpacityExampleState extends State<AnimatedOpacityExample> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedOpacity')),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
            child: Center(child: Text('Fade Me', style: TextStyle(fontSize: 24))),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _visible = !_visible),
        child: Icon(_visible ? Icons.visibility_off : Icons.visibility),
      ),
    );
  }
}

// 10. AnimatedPhysicalModel
class AnimatedPhysicalModelExample extends StatefulWidget {
  @override
  _AnimatedPhysicalModelExampleState createState() =>
      _AnimatedPhysicalModelExampleState();
}

class _AnimatedPhysicalModelExampleState extends State<AnimatedPhysicalModelExample> {
  bool _elevated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedPhysicalModel')),
      body: Center(
        child: AnimatedPhysicalModel(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          elevation: _elevated ? 20 : 0,
          shape: BoxShape.rectangle,
          shadowColor: Colors.black,
          color: _elevated ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(_elevated ? 50 : 10),
          child: Container(
            width: 200,
            height: 200,
            child: Center(child: Text('Elevation', style: TextStyle(fontSize: 20))),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _elevated = !_elevated),
        child: Icon(Icons.layers),
      ),
    );
  }
}

// 11. AnimatedPositioned
class AnimatedPositionedExample extends StatefulWidget {
  @override
  _AnimatedPositionedExampleState createState() => _AnimatedPositionedExampleState();
}

class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  bool _moved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedPositioned')),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            left: _moved ? 200 : 50,
            top: _moved ? 400 : 100,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.orange,
              child: Center(child: Text('Move')),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _moved = !_moved),
        child: Icon(Icons.open_with),
      ),
    );
  }
}

// 12. AnimatedSize
class AnimatedSizeExample extends StatefulWidget {
  @override
  _AnimatedSizeExampleState createState() => _AnimatedSizeExampleState();
}

class _AnimatedSizeExampleState extends State<AnimatedSizeExample>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedSize')),
      body: Center(
        child: AnimatedSize(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: Container(
            width: _expanded ? 300 : 100,
            height: _expanded ? 300 : 100,
            color: Colors.teal,
            child: Center(child: Text('Size', style: TextStyle(fontSize: 24))),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _expanded = !_expanded),
        child: Icon(Icons.aspect_ratio),
      ),
    );
  }
}

// 13. AnimatedWidget Example (Custom)
class SpinningContainer extends AnimatedWidget {
  const SpinningContainer({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Transform.rotate(
      angle: animation.value * 2 * 3.14159,
      child: Container(
        width: 150,
        height: 150,
        color: Colors.indigo,
        child: Center(child: Text('Custom', style: TextStyle(color: Colors.white))),
      ),
    );
  }
}

class AnimatedWidgetExample extends StatefulWidget {
  @override
  _AnimatedWidgetExampleState createState() => _AnimatedWidgetExampleState();
}

class _AnimatedWidgetExampleState extends State<AnimatedWidgetExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 2), vsync: this)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedWidget')),
      body: Center(child: SpinningContainer(animation: _controller)),
    );
  }
}

// 14. DecoratedBoxTransition
class DecoratedBoxTransitionExample extends StatefulWidget {
  @override
  _DecoratedBoxTransitionExampleState createState() =>
      _DecoratedBoxTransitionExampleState();
}

class _DecoratedBoxTransitionExampleState extends State<DecoratedBoxTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Decoration> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animation = DecorationTween(
      begin: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      end: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 20)],
      ),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DecoratedBoxTransition')),
      body: Center(
        child: DecoratedBoxTransition(
          decoration: _animation,
          child: Container(
            width: 200,
            height: 200,
            child: Center(child: Text('Decoration', style: TextStyle(fontSize: 20))),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.status == AnimationStatus.completed) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

// 15. DefaultTextStyleTransition
class DefaultTextStyleTransitionExample extends StatefulWidget {
  @override
  _DefaultTextStyleTransitionExampleState createState() =>
      _DefaultTextStyleTransitionExampleState();
}

class _DefaultTextStyleTransitionExampleState
    extends State<DefaultTextStyleTransitionExample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<TextStyle> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animation = TextStyleTween(
      begin: TextStyle(fontSize: 20, color: Colors.black),
      end: TextStyle(fontSize: 48, color: Colors.red, fontWeight: FontWeight.bold),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DefaultTextStyleTransition')),
      body: Center(
        child: DefaultTextStyleTransition(
          style: _animation,
          child: Text('Text Style'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.status == AnimationStatus.completed) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

// 16. FadeTransition
class FadeTransitionExample extends StatefulWidget {
  @override
  _FadeTransitionExampleState createState() => _FadeTransitionExampleState();
}

class _FadeTransitionExampleState extends State<FadeTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FadeTransition')),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.purple,
            child: Center(child: Text('Fading...', style: TextStyle(fontSize: 24))),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.status == AnimationStatus.completed) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

// 17. Hero Animation
class HeroAnimationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero Animation')),
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => HeroDetailPage()),
          ),
          child: Hero(
            tag: 'hero-image',
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.image, size: 50),
            ),
          ),
        ),
      ),
    );
  }
}

class HeroDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail')),
      body: Center(
        child: Hero(
          tag: 'hero-image',
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(Icons.image, size: 200),
          ),
        ),
      ),
    );
  }
}

// 18. MatrixTransition
class MatrixTransitionExample extends StatefulWidget {
  @override
  _MatrixTransitionExampleState createState() => _MatrixTransitionExampleState();
}

class _MatrixTransitionExampleState extends State<MatrixTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MatrixTransition')),
      body: Center(
        child: MatrixTransition(
          animation: _animation,
          onTransform: (value) {
            return Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(value * 3.14159);
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.cyan,
            child: Center(child: Text('3D Rotate', style: TextStyle(fontSize: 24))),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.status == AnimationStatus.completed) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

// 19. PositionedTransition
class PositionedTransitionExample extends StatefulWidget {
  @override
  _PositionedTransitionExampleState createState() =>
      _PositionedTransitionExampleState();
}

class _PositionedTransitionExampleState extends State<PositionedTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<RelativeRect> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(50, 100, 250, 500),
      end: RelativeRect.fromLTRB(200, 400, 100, 200),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PositionedTransition')),
      body: Stack(
        children: [
          PositionedTransition(
            rect: _animation,
            child: Container(
              color: Colors.deepOrange,
              child: Center(child: Text('Positioned', style: TextStyle(color: Colors.white))),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.status == AnimationStatus.completed) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

// 20. RelativePositionedTransition
class RelativePositionedTransitionExample extends StatefulWidget {
  @override
  _RelativePositionedTransitionExampleState createState() =>
      _RelativePositionedTransitionExampleState();
}

class _RelativePositionedTransitionExampleState
    extends State<RelativePositionedTransitionExample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Rect?> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animation = RectTween(
      begin: Rect.fromLTWH(0, 0, 100, 100),
      end: Rect.fromLTWH(200, 400, 150, 150),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RelativePositionedTransition')),
      body: Stack(
        children: [
          RelativePositionedTransition(
            rect: _animation,
            size: Size(400, 800),
            child: Container(
              color: Colors.lime,
              child: Center(child: Text('Relative', style: TextStyle(fontSize: 18))),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.status == AnimationStatus.completed) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

// 21. RotationTransition
class RotationTransitionExample extends StatefulWidget {
  @override
  _RotationTransitionExampleState createState() => _RotationTransitionExampleState();
}

class _RotationTransitionExampleState extends State<RotationTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 2), vsync: this)..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RotationTransition')),
      body: Center(
        child: RotationTransition(
          turns: _controller,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(Icons.star, size: 100, color: Colors.white),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
          } else {
            _controller.repeat();
          }
        },
        child: Icon(_controller.isAnimating ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}

// 22. ScaleTransition
class ScaleTransitionExample extends StatefulWidget {
  @override
  _ScaleTransitionExampleState createState() => _ScaleTransitionExampleState();
}

class _ScaleTransitionExampleState extends State<ScaleTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 800), vsync: this);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ScaleTransition')),
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(color: Colors.teal, shape: BoxShape.circle),
            child: Center(child: Text('Scale!', style: TextStyle(fontSize: 24))),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.status == AnimationStatus.completed) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: Icon(Icons.zoom_in),
      ),
    );
  }
}

// 23. SizeTransition
class SizeTransitionExample extends StatefulWidget {
  @override
  _SizeTransitionExampleState createState() => _SizeTransitionExampleState();
}

class _SizeTransitionExampleState extends State<SizeTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 1), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SizeTransition')),
      body: Center(
        child: SizeTransition(
          sizeFactor: _animation,
          axis: Axis.vertical,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.brown,
            child: Center(child: Text('Expand', style: TextStyle(fontSize: 24, color: Colors.white))),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.status == AnimationStatus.completed) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: Icon(Icons.unfold_more),
      ),
    );
  }
}

// 24. SlideTransition
class SlideTransitionExample extends StatefulWidget {
  @override
  _SlideTransitionExampleState createState() => _SlideTransitionExampleState();
}

class _SlideTransitionExampleState extends State<SlideTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 1), vsync: this);
    _animation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SlideTransition')),
      body: Center(
        child: SlideTransition(
          position: _animation,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.orange,
            child: Center(child: Text('Sliding!', style: TextStyle(fontSize: 24))),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.status == AnimationStatus.completed) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

// 25. SliverFadeTransition
class SliverFadeTransitionExample extends StatefulWidget {
  @override
  _SliverFadeTransitionExampleState createState() =>
      _SliverFadeTransitionExampleState();
}

class _SliverFadeTransitionExampleState extends State<SliverFadeTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SliverFadeTransition')),
      body: CustomScrollView(
        slivers: [
          SliverFadeTransition(
            opacity: _animation,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                  height: 80,
                  margin: EdgeInsets.all(8),
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: Center(
                    child: Text('Item $index', style: TextStyle(fontSize: 24, color: Colors.white)),
                  ),
                ),
                childCount: 20,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.status == AnimationStatus.completed) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}