import 'package:flutter/material.dart';
import '../custom_expressive_widgets.dart';

class ExpressiveLoginScreen extends StatelessWidget {
  const ExpressiveLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: const ExpressiveAppBar(title: 'Welcome'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ExpressiveAvatar(text: 'U', size: 80),
            const SizedBox(height: 24),
            ExpressiveTextField(
              controller: emailController,
              hint: 'Email',
              icon: Icons.email,
            ),
            const SizedBox(height: 12),
            ExpressiveTextField(
              controller: passwordController,
              hint: 'Password',
              icon: Icons.lock,
            ),
            const SizedBox(height: 24),
            ExpressiveButton(
              text: 'Login',
              icon: Icons.login,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
