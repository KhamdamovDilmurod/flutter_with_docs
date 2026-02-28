import 'package:flutter/material.dart';

import '../custom_expressive_widgets.dart';

class ExpressiveOnboardingScreen extends StatefulWidget {
  const ExpressiveOnboardingScreen({super.key});

  @override
  State<ExpressiveOnboardingScreen> createState() =>
      _ExpressiveOnboardingScreenState();
}

class _ExpressiveOnboardingScreenState
    extends State<ExpressiveOnboardingScreen> {
  final controller = PageController();
  int index = 0;

  final pages = const [
    _OnboardPage(
      icon: Icons.flash_on,
      title: 'Fast',
      subtitle: 'Experience expressive speed',
    ),
    _OnboardPage(
      icon: Icons.palette,
      title: 'Beautiful',
      subtitle: 'Modern expressive UI',
    ),
    _OnboardPage(
      icon: Icons.rocket_launch,
      title: 'Ready',
      subtitle: 'Build amazing apps',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: pages.length,
              onPageChanged: (i) => setState(() => index = i),
              itemBuilder: (_, i) => pages[i],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ExpressiveButton(
              text: index == pages.length - 1 ? 'Start' : 'Next',
              onPressed: () {
                if (index == pages.length - 1) return;
                controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardPage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _OnboardPage({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 100, color: c),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
