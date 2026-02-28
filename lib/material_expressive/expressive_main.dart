import 'package:flutter/material.dart';

import 'custom_expressive_widgets.dart';
import 'examples/dashboard_screen.dart';
import 'examples/expressive_theme.dart';
import 'examples/expressive_transition.dart';
import 'examples/login_screen.dart';
import 'examples/onboarding_screen.dart';

void main() {
  runApp(const ExpressiveApp());
}

class ExpressiveApp extends StatelessWidget {
  const ExpressiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ExpressiveTheme.light(Colors.blue),
      darkTheme: ExpressiveTheme.dark(Colors.blue),
      themeMode: ThemeMode.system,
      home: const ExpressiveHomeScreen(),
    );
  }
}

class ExpressiveHomeScreen extends StatelessWidget {
  const ExpressiveHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ExpressiveAppBar(title: 'Expressive UI Showcase'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ExpressiveButton(
            text: 'Login Screen',
            icon: Icons.login,
            onPressed: () {
              Navigator.push(
                context,
                ExpressivePageRoute(
                  page: const ExpressiveLoginScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          ExpressiveButton(
            text: 'Dashboard Screen',
            icon: Icons.dashboard,
            onPressed: () {
              Navigator.push(
                context,
                ExpressivePageRoute(
                  page: const ExpressiveDashboardScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          ExpressiveButton(
            text: 'Onboarding Screen',
            icon: Icons.slideshow,
            onPressed: () {
              Navigator.push(
                context,
                ExpressivePageRoute(
                  page: const ExpressiveOnboardingScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 24),
          const Text(
            'Components Preview',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const ExpressiveDashboardCard(
            icon: Icons.analytics,
            title: 'Preview Card',
            value: '999',
          ),
          const SizedBox(height: 12),
          const ExpressiveProfileCard(
            name: 'Dilmurodjon',
            subtitle: 'Mobile Developer',
            avatarText: 'D',
          ),
          const SizedBox(height: 12),
          const ExpressiveEmptyState(
            icon: Icons.inbox,
            title: 'No Data',
            subtitle: 'Nothing to show here yet',
          ),
          const SizedBox(height: 24),
          const Center(child: ExpressiveLoading()),
        ],
      ),
    );
  }
}
