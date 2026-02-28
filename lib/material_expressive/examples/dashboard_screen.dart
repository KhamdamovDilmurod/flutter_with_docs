import 'package:flutter/material.dart';
import '../custom_expressive_widgets.dart';

class ExpressiveDashboardScreen extends StatelessWidget {
  const ExpressiveDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ExpressiveAppBar(title: 'Dashboard'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: const [
            ExpressiveDashboardCard(
              icon: Icons.show_chart,
              title: 'Revenue',
              value: '\$12K',
            ),
            ExpressiveDashboardCard(
              icon: Icons.people,
              title: 'Users',
              value: '1.2K',
            ),
            ExpressiveDashboardCard(
              icon: Icons.shopping_cart,
              title: 'Orders',
              value: '320',
            ),
            ExpressiveDashboardCard(
              icon: Icons.star,
              title: 'Rating',
              value: '4.8',
            ),
          ],
        ),
      ),
    );
  }
}
