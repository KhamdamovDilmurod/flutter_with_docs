import 'package:flutter/material.dart';

class ScrollingDemo extends StatelessWidget {
  const ScrollingDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade400, Colors.purple.shade400],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: Text(
                  '📱 Flutter Scrolling Widgets',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    _buildCard(
                      context,
                      'ListView',
                      'Oddiy vertikal ro\'yxat',
                      Icons.list,
                      Colors.orange,
                          () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ListViewExample())),
                    ),
                    _buildCard(
                      context,
                      'GridView',
                      'Grid layout - kartochkalar',
                      Icons.grid_view,
                      Colors.green,
                          () => Navigator.push(context, MaterialPageRoute(builder: (_) => const GridViewExample())),
                    ),
                    _buildCard(
                      context,
                      'PageView',
                      'Sahifama-sahifa slayder',
                      Icons.swipe_down_alt_rounded,
                      Colors.purple,
                          () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PageViewExample())),
                    ),
                    _buildCard(
                      context,
                      'SingleChildScrollView',
                      'Bitta widget scroll qilish',
                      Icons.vertical_align_center,
                      Colors.blue,
                          () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SingleScrollExample())),
                    ),
                    _buildCard(
                      context,
                      'CustomScrollView',
                      'Slivers bilan custom scroll',
                      Icons.dynamic_feed,
                      Colors.red,
                          () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CustomScrollExample())),
                    ),
                    _buildCard(
                      context,
                      'RefreshIndicator',
                      'Pull-to-refresh funksiyasi',
                      Icons.refresh,
                      Colors.teal,
                          () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RefreshExample())),
                    ),
                    _buildCard(
                      context,
                      'ReorderableListView',
                      'Drag qilib tartiblash',
                      Icons.reorder,
                      Colors.indigo,
                          () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ReorderableExample())),
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

  Widget _buildCard(BuildContext context, String title, String subtitle, IconData icon, Color color, VoidCallback onTap) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 32),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.grey.shade400, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// 1. ListView Example
class ListViewExample extends StatelessWidget {
  const ListViewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = List.generate(20, (i) => 'Element ${i + 1}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Misoli'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange.shade100,
                child: Text('${index + 1}', style: const TextStyle(color: Colors.orange)),
              ),
              title: Text(items[index], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Bu ${index + 1}-element haqida qisqa ma\'lumot'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}

// 2. GridView Example
class GridViewExample extends StatelessWidget {
  const GridViewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.red, Colors.blue, Colors.green, Colors.orange,
      Colors.purple, Colors.teal, Colors.pink, Colors.indigo,
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView Misoli'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          final color = colors[index % colors.length];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color.shade300, color.shade600],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.image, size: 48, color: Colors.white),
                  const SizedBox(height: 8),
                  Text(
                    'Element ${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// 3. PageView Example
class PageViewExample extends StatefulWidget {
  const PageViewExample({Key? key}) : super(key: key);

  @override
  State<PageViewExample> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      {'title': 'Birinchi Sahifa', 'icon': Icons.home, 'color': Colors.blue},
      {'title': 'Ikkinchi Sahifa', 'icon': Icons.favorite, 'color': Colors.red},
      {'title': 'Uchinchi Sahifa', 'icon': Icons.star, 'color': Colors.amber},
      {'title': 'To\'rtinchi Sahifa', 'icon': Icons.settings, 'color': Colors.green},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView Misoli'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemCount: pages.length,
              itemBuilder: (context, index) {
                final page = pages[index];
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.green,
                        Colors.black,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(page['icon'] as IconData, size: 100, color: Colors.white),
                      const SizedBox(height: 24),
                      Text(
                        page['title'] as String,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Sahifa ${index + 1} / ${pages.length}',
                        style: const TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                    (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.purple : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
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

// 4. SingleChildScrollView Example
class SingleScrollExample extends StatelessWidget {
  const SingleScrollExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleChildScrollView'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade300, Colors.blue.shade600],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Text(
                    'Bitta Widget\nScroll Qilish',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Lorem Ipsum',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.\n\n'
                  'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\n'
                  'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.\n\n'
                  'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
              style: TextStyle(fontSize: 16, height: 1.5, color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}

// 5. CustomScrollView with Slivers
class CustomScrollExample extends StatelessWidget {
  const CustomScrollExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            backgroundColor: Colors.red,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('CustomScrollView'),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.red.shade400, Colors.red.shade800],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Icon(Icons.dynamic_feed, size: 80, color: Colors.white54),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.red.shade100,
                        child: Text('${index + 1}'),
                      ),
                      title: Text('Sliver Element ${index + 1}'),
                      subtitle: const Text('CustomScrollView bilan yaratilgan'),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                  );
                },
                childCount: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 6. RefreshIndicator Example
class RefreshExample extends StatefulWidget {
  const RefreshExample({Key? key}) : super(key: key);

  @override
  State<RefreshExample> createState() => _RefreshExampleState();
}

class _RefreshExampleState extends State<RefreshExample> {
  List<String> items = List.generate(10, (i) => 'Element ${i + 1}');

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      items = List.generate(10, (i) => 'Yangilangan ${i + 1}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RefreshIndicator'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        color: Colors.teal,
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2,
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.teal.shade100,
                  child: const Icon(Icons.refresh, color: Colors.teal),
                ),
                title: Text(items[index], style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('Pastga torting va yangilang'),
              ),
            );
          },
        ),
      ),
    );
  }
}

// 7. ReorderableListView Example
class ReorderableExample extends StatefulWidget {
  const ReorderableExample({Key? key}) : super(key: key);

  @override
  State<ReorderableExample> createState() => _ReorderableExampleState();
}

class _ReorderableExampleState extends State<ReorderableExample> {
  List<String> items = List.generate(8, (i) => 'Element ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReorderableListView'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ReorderableListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) newIndex--;
            final item = items.removeAt(oldIndex);
            items.insert(newIndex, item);
          });
        },
        itemBuilder: (context, index) {
          return Card(
            key: ValueKey(items[index]),
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigo.shade100,
                child: const Icon(Icons.drag_handle, color: Colors.indigo),
              ),
              title: Text(items[index], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Bosib ushlab torting'),
              trailing: const Icon(Icons.reorder, color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}