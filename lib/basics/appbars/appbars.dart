import 'package:flutter/material.dart';

class AppBarExamplesHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar Namunalari'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildCard(context, '1. Oddiy AppBar', SimpleAppBarPage()),
          _buildCard(context, '2. Rangli AppBar', ColoredAppBarPage()),
          _buildCard(context, '3. Gradient AppBar', GradientAppBarPage()),
          _buildCard(context, '4. AppBar + TabBar', TabBarAppBarPage()),
          _buildCard(context, '5. AppBar + Search', SearchAppBarPage()),
          _buildCard(context, '6. AppBar + Actions', ActionsAppBarPage()),
          _buildCard(context, '7. Transparent AppBar', TransparentAppBarPage()),
          _buildCard(context, '8. Katta AppBar (SliverAppBar)', SliverAppBarPage()),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, Widget page) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        },
      ),
    );
  }
}

// 1. Oddiy AppBar
class SimpleAppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oddiy AppBar'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Bu eng oddiy AppBar'),
      ),
    );
  }
}

// 2. Rangli AppBar
class ColoredAppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: Text('Rangli AppBar'),
        centerTitle: true,
        elevation: 4,
      ),
      body: Center(
        child: Text('Rangli AppBar namunasi'),
      ),
    );
  }
}

// 3. Gradient AppBar
class GradientAppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text('Gradient AppBar'),
            centerTitle: true,
          ),
        ),
      ),
      body: Center(
        child: Text('Gradient fon bilan AppBar'),
      ),
    );
  }
}

// 4. AppBar + TabBar
class TabBarAppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('AppBar + TabBar'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Bosh'),
              Tab(icon: Icon(Icons.search), text: 'Qidiruv'),
              Tab(icon: Icon(Icons.person), text: 'Profil'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Bosh sahifa')),
            Center(child: Text('Qidiruv sahifasi')),
            Center(child: Text('Profil sahifasi')),
          ],
        ),
      ),
    );
  }
}

// 5. AppBar + Search
class SearchAppBarPage extends StatefulWidget {
  @override
  _SearchAppBarPageState createState() => _SearchAppBarPageState();
}

class _SearchAppBarPageState extends State<SearchAppBarPage> {
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Qidirish...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white70),
          ),
          style: TextStyle(color: Colors.white),
        )
            : Text('Search AppBar'),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Qidiruv funksiyasi bilan AppBar'),
      ),
    );
  }
}

// 6. AppBar + Actions
class ActionsAppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actions bilan AppBar'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Favorit bosildi')),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Ulashish bosildi')),
              );
            },
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(child: Text('Sozlamalar'), value: 1),
              PopupMenuItem(child: Text('Yordam'), value: 2),
              PopupMenuItem(child: Text('Chiqish'), value: 3),
            ],
            onSelected: (value) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Menyu $value tanlandi')),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Ko\'p action tugmalari bilan'),
      ),
    );
  }
}

// 7. Transparent AppBar
class TransparentAppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Transparent AppBar'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade300, Colors.purple.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Text(
            'Shaffof AppBar',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// 8. SliverAppBar (Katta AppBar)
class SliverAppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Katta AppBar'),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.teal, Colors.green],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Text('Element ${index + 1}'),
                subtitle: Text('Scroll qilsangiz AppBar kichrayadi'),
              ),
              childCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}