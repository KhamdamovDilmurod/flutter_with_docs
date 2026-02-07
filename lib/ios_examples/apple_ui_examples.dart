import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'apple_ui_widgets.dart';

// ============================================================================
// EXAMPLE 1: SIMPLE LOGIN SCREEN
// ============================================================================

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const AppleNavBar(
        title: "Login",
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              const Icon(
                CupertinoIcons.lock_shield_fill,
                size: 80,
                color: AppleColors.systemBlue,
              ),
              const SizedBox(height: 40),

              // Email Field
              AppleTextField(
                controller: emailController,
                placeholder: "Email address",
                label: "Email",
                prefixIcon: CupertinoIcons.mail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              // Password Field
              AppleTextField(
                controller: passwordController,
                placeholder: "Password",
                label: "Password",
                prefixIcon: CupertinoIcons.lock,
                obscureText: obscurePassword,
                suffix: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                  child: Icon(
                    obscurePassword
                        ? CupertinoIcons.eye
                        : CupertinoIcons.eye_slash,
                    color: AppleColors.systemGray,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Login Button
              AppleButton(
                text: "Sign In",
                onPressed: () async {
                  setState(() => isLoading = true);
                  await Future.delayed(const Duration(seconds: 2));
                  setState(() => isLoading = false);

                  if (mounted) {
                    AppleBanner.showSuccess(
                      context: context,
                      message: "Successfully logged in!",
                    );
                  }
                },
                isLoading: isLoading,
                width: double.infinity,
              ),
              const SizedBox(height: 12),

              // Sign Up Button
              AppleButton(
                text: "Create Account",
                onPressed: () {
                  AppleUtils.navigateTo(context, const SignUpScreen());
                },
                isFilled: false,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// EXAMPLE 2: SETTINGS SCREEN
// ============================================================================

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;
  bool autoPlayVideos = false;
  double volumeLevel = 0.7;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const AppleNavBar(
        title: "Settings",
      ),
      backgroundColor: AppleColors.systemGroupedBackground,
      child: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 20),

            // Profile Section
            AppleCard(
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppleColors.systemBlue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Icon(
                        CupertinoIcons.person_fill,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "John Doe",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.5,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "john.doe@example.com",
                          style: TextStyle(
                            fontSize: 15,
                            color: AppleColors.secondaryLabel,
                            letterSpacing: -0.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    CupertinoIcons.chevron_forward,
                    color: AppleColors.systemGray3,
                    size: 20,
                  ),
                ],
              ),
              onTap: () {
                AppleBanner.show(
                  context: context,
                  message: "Profile tapped",
                  icon: CupertinoIcons.person_circle,
                );
              },
            ),

            const SizedBox(height: 24),

            // Preferences Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "PREFERENCES",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppleColors.secondaryLabel,
                  letterSpacing: -0.1,
                ),
              ),
            ),
            const SizedBox(height: 8),

            AppleCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  AppleListTile(
                    title: "Notifications",
                    leadingIcon: CupertinoIcons.bell_fill,
                    leadingIconColor: AppleColors.systemRed,
                    trailing: AppleSwitch(
                      value: notificationsEnabled,
                      onChanged: (value) {
                        setState(() => notificationsEnabled = value);
                      },
                    ),
                    showDivider: true,
                  ),
                  AppleListTile(
                    title: "Dark Mode",
                    leadingIcon: CupertinoIcons.moon_fill,
                    leadingIconColor: AppleColors.systemIndigo,
                    trailing: AppleSwitch(
                      value: darkModeEnabled,
                      onChanged: (value) {
                        setState(() => darkModeEnabled = value);
                      },
                    ),
                    showDivider: true,
                  ),
                  AppleListTile(
                    title: "Auto-play Videos",
                    leadingIcon: CupertinoIcons.play_circle_fill,
                    leadingIconColor: AppleColors.systemPurple,
                    trailing: AppleSwitch(
                      value: autoPlayVideos,
                      onChanged: (value) {
                        setState(() => autoPlayVideos = value);
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Volume Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "VOLUME",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppleColors.secondaryLabel,
                  letterSpacing: -0.1,
                ),
              ),
            ),
            const SizedBox(height: 8),

            AppleCard(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.volume_down,
                        color: AppleColors.systemGray,
                      ),
                      Expanded(
                        child: AppleSlider(
                          value: volumeLevel,
                          onChanged: (value) {
                            setState(() => volumeLevel = value);
                          },
                        ),
                      ),
                      const Icon(
                        CupertinoIcons.volume_up,
                        color: AppleColors.systemGray,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${(volumeLevel * 100).toInt()}%",
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppleColors.secondaryLabel,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Account Actions
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "ACCOUNT",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppleColors.secondaryLabel,
                  letterSpacing: -0.1,
                ),
              ),
            ),
            const SizedBox(height: 8),

            AppleCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  AppleListTile(
                    title: "Privacy",
                    leadingIcon: CupertinoIcons.lock_shield_fill,
                    leadingIconColor: AppleColors.systemBlue,
                    showChevron: true,
                    showDivider: true,
                    onTap: () {},
                  ),
                  AppleListTile(
                    title: "Security",
                    leadingIcon: CupertinoIcons.shield_fill,
                    leadingIconColor: AppleColors.systemGreen,
                    showChevron: true,
                    showDivider: true,
                    onTap: () {},
                  ),
                  AppleListTile(
                    title: "Help & Support",
                    leadingIcon: CupertinoIcons.question_circle_fill,
                    leadingIconColor: AppleColors.systemOrange,
                    showChevron: true,
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Logout Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppleButton(
                text: "Sign Out",
                color: AppleColors.systemRed,
                onPressed: () {
                  AppleDialog.showConfirm(
                    context: context,
                    title: "Sign Out",
                    message: "Are you sure you want to sign out?",
                    confirmText: "Sign Out",
                    isDestructive: true,
                  ).then((result) {
                    if (result == true) {
                      AppleBanner.show(
                        context: context,
                        message: "Signed out successfully",
                        icon: CupertinoIcons.check_mark,
                      );
                    }
                  });
                },
                width: double.infinity,
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// EXAMPLE 3: PRODUCT LIST WITH SEARCH
// ============================================================================

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final TextEditingController searchController = TextEditingController();
  List<Product> filteredProducts = products;

  void filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredProducts = products;
      } else {
        filteredProducts = products
            .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const AppleNavBar(
        title: "Products",
        trailing: [
          Icon(CupertinoIcons.cart, size: 24),
        ],
      ),
      backgroundColor: AppleColors.systemGroupedBackground,
      child: SafeArea(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: AppleSearchBar(
                controller: searchController,
                placeholder: "Search products",
                onChanged: filterProducts,
                showCancel: true,
                onCancel: () {
                  searchController.clear();
                  filterProducts('');
                },
              ),
            ),

            // Products List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return AppleCard(
                    margin: const EdgeInsets.only(bottom: 12),
                    onTap: () {
                      AppleBanner.show(
                        context: context,
                        message: 'Selected: ${product.name}',
                      );
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppleColors.systemGray6,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            product.icon,
                            color: AppleColors.systemBlue,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.4,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '\$${product.price.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: AppleColors.secondaryLabel,
                                  letterSpacing: -0.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          CupertinoIcons.chevron_forward,
                          color: AppleColors.systemGray3,
                          size: 20,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  final IconData icon;

  Product({required this.name, required this.price, required this.icon});
}

final List<Product> products = [
  Product(name: 'iPhone 15 Pro', price: 999.99, icon: CupertinoIcons.device_phone_portrait),
  Product(name: 'MacBook Pro', price: 1999.99, icon: CupertinoIcons.device_laptop),
  Product(name: 'iPad Air', price: 599.99, icon: CupertinoIcons.device_desktop),
  Product(name: 'AirPods Pro', price: 249.99, icon: CupertinoIcons.headphones),
  Product(name: 'Apple Watch', price: 399.99, icon: CupertinoIcons.time),
];

// ============================================================================
// EXAMPLE 4: ALL WIDGETS IN ONE SCREEN (COMPLETE DEMO)
// ============================================================================

class AppleWidgetsDemo extends StatefulWidget {
  const AppleWidgetsDemo({Key? key}) : super(key: key);

  @override
  State<AppleWidgetsDemo> createState() => _AppleWidgetsDemoState();
}

class _AppleWidgetsDemoState extends State<AppleWidgetsDemo> {
  bool switchValue = false;
  bool darkModeEnabled = false;
  bool autoPlayVideos = false;
  double volumeLevel = 0.7;
  int selectedSegment = 0;
  String selectedCategory = 'all';
  final TextEditingController searchController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: AppleNavBar(
        title: 'Apple Widgets Demo',
        trailing: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              AppleUtils.navigateTo(context, const SettingsScreen());
            },
            child: const Icon(
              CupertinoIcons.settings,
              size: 24,
            ),
          ),
        ],
      ),
      backgroundColor: AppleColors.systemGroupedBackground,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // ============================================================
            // BUTTONS SECTION
            // ============================================================
            _sectionTitle('Buttons'),
            const SizedBox(height: 12),

            AppleButton(
              text: "Primary Button",
              icon: CupertinoIcons.checkmark_alt,
              onPressed: () {
                AppleBanner.showSuccess(
                  context: context,
                  message: "Button pressed!",
                );
              },
            ),
            const SizedBox(height: 12),

            AppleButton(
              text: "Outlined Button",
              icon: CupertinoIcons.heart,
              isFilled: false,
              onPressed: () {
                AppleBanner.show(
                  context: context,
                  message: "Outlined button pressed",
                );
              },
            ),
            const SizedBox(height: 12),

            AppleButton(
              text: "Loading State",
              isLoading: isLoading,
              onPressed: () async {
                setState(() => isLoading = true);
                await Future.delayed(const Duration(seconds: 2));
                setState(() => isLoading = false);
                if (mounted) {
                  AppleBanner.showSuccess(
                    context: context,
                    message: "Loading complete!",
                  );
                }
              },
            ),
            const SizedBox(height: 12),

            AppleButton(
              text: "Disabled Button",
              isDisabled: true,
              onPressed: () {},
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: AppleButton(
                    text: "Red",
                    color: AppleColors.systemRed,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AppleButton(
                    text: "Green",
                    color: AppleColors.systemGreen,
                    onPressed: () {},
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // ============================================================
            // TEXT FIELDS SECTION
            // ============================================================
            _sectionTitle('Text Fields'),
            const SizedBox(height: 12),

            AppleTextField(
              controller: nameController,
              placeholder: "Enter your name",
              label: "Name",
              prefixIcon: CupertinoIcons.person,
            ),
            const SizedBox(height: 12),

            AppleTextField(
              controller: emailController,
              placeholder: "your@email.com",
              label: "Email",
              prefixIcon: CupertinoIcons.mail,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),

            AppleTextField(
              placeholder: "Password",
              label: "Password",
              prefixIcon: CupertinoIcons.lock,
              obscureText: obscurePassword,
              suffix: CupertinoButton(
                padding: EdgeInsets.zero,
                minSize: 0,
                onPressed: () {
                  setState(() => obscurePassword = !obscurePassword);
                },
                child: Icon(
                  obscurePassword
                      ? CupertinoIcons.eye
                      : CupertinoIcons.eye_slash,
                  color: AppleColors.systemGray,
                  size: 22,
                ),
              ),
            ),

            const SizedBox(height: 32),

            // ============================================================
            // SEARCH BAR
            // ============================================================
            _sectionTitle('Search'),
            const SizedBox(height: 12),

            AppleSearchBar(
              controller: searchController,
              placeholder: "Search...",
              onChanged: (value) {
                print('Searching: $value');
              },
              showCancel: true,
              onCancel: () {
                searchController.clear();
              },
            ),

            const SizedBox(height: 32),

            // ============================================================
            // SEGMENTED CONTROL
            // ============================================================
            _sectionTitle('Segmented Control'),
            const SizedBox(height: 12),

            // AppleSegmentedControl<int>(
            //   children: const {
            //     0: Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            //       child: Text('All'),
            //     ),
            //     1: Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            //       child: Text('Active'),
            //     ),
            //     2: Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            //       child: Text('Done'),
            //     ),
            //   },
            //   groupValue: selectedSegment,
            //   onValueChanged: (value) {
            //     setState(() => selectedSegment = value);
            //     AppleUtils.vibrateLight();
            //   },
            // ),

            const SizedBox(height: 32),

            // ============================================================
            // CARDS SECTION
            // ============================================================
            _sectionTitle('Cards'),
            const SizedBox(height: 12),

            AppleCard(
              onTap: () {
                AppleBanner.show(
                  context: context,
                  message: "Card tapped",
                );
              },
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Card Title',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'This is a card component with Apple design guidelines. Clean, minimal, and elegant.',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppleColors.secondaryLabel,
                      letterSpacing: -0.2,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // ============================================================
            // LIST TILES SECTION
            // ============================================================
            _sectionTitle('List Tiles'),
            const SizedBox(height: 12),

            AppleCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  AppleListTile(
                    title: 'Settings',
                    subtitle: 'Manage app settings',
                    leadingIcon: CupertinoIcons.settings,
                    leadingIconColor: AppleColors.systemGray,
                    showChevron: true,
                    showDivider: true,
                    onTap: () {
                      AppleUtils.navigateTo(context, const SettingsScreen());
                    },
                  ),
                  AppleListTile(
                    title: 'Profile',
                    subtitle: 'Personal information',
                    leadingIcon: CupertinoIcons.person_circle,
                    leadingIconColor: AppleColors.systemBlue,
                    showChevron: true,
                    showDivider: true,
                    onTap: () {},
                  ),
                  AppleListTile(
                    title: 'Help',
                    subtitle: 'Get support',
                    leadingIcon: CupertinoIcons.question_circle,
                    leadingIconColor: AppleColors.systemOrange,
                    showChevron: true,
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // ============================================================
            // SWITCHES
            // ============================================================
            _sectionTitle('Switches'),
            const SizedBox(height: 12),

            AppleCard(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Notifications',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.4,
                        ),
                      ),
                      AppleSwitch(
                        value: switchValue,
                        onChanged: (value) {
                          setState(() => switchValue = value);
                          AppleUtils.vibrateMedium();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const AppleDivider(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Dark Mode',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.4,
                        ),
                      ),
                      AppleSwitch(
                        value: darkModeEnabled,
                        onChanged: (value) {
                          setState(() => darkModeEnabled = value);
                          AppleUtils.vibrateLight();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // ============================================================
            // SLIDER
            // ============================================================
            _sectionTitle('Slider'),
            const SizedBox(height: 12),

            AppleCard(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.volume_down,
                        color: AppleColors.systemGray,
                        size: 20,
                      ),
                      Expanded(
                        child: AppleSlider(
                          value: volumeLevel,
                          onChanged: (value) {
                            setState(() => volumeLevel = value);
                          },
                        ),
                      ),
                      const Icon(
                        CupertinoIcons.volume_up,
                        color: AppleColors.systemGray,
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Volume: ${(volumeLevel * 100).toInt()}%',
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppleColors.secondaryLabel,
                      letterSpacing: -0.2,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // ============================================================
            // BADGES
            // ============================================================
            _sectionTitle('Badges'),
            const SizedBox(height: 12),

            Row(
              children: [
                AppleBadge(
                  text: "5",
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppleColors.systemBlue,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(
                      CupertinoIcons.bell,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                AppleBadge(
                  text: "NEW",
                  color: AppleColors.systemGreen,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppleColors.systemPurple,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(
                      CupertinoIcons.star_fill,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                AppleBadge(
                  text: "99+",
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppleColors.systemOrange,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(
                      CupertinoIcons.mail,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // ============================================================
            // DIALOGS SECTION
            // ============================================================
            _sectionTitle('Dialogs'),
            const SizedBox(height: 12),

            AppleButton(
              text: "Simple Alert",
              icon: CupertinoIcons.info_circle,
              onPressed: () {
                AppleDialog.showAlert(
                  context: context,
                  title: "Attention!",
                  message: "This is a simple alert dialog",
                  confirmText: "Got it",
                );
              },
            ),
            const SizedBox(height: 12),

            AppleButton(
              text: "Confirmation Dialog",
              icon: CupertinoIcons.question_circle,
              onPressed: () async {
                final result = await AppleDialog.showConfirm(
                  context: context,
                  title: "Confirm Action",
                  message: "Are you sure you want to continue?",
                  confirmText: "Yes",
                  cancelText: "No",
                );

                if (result == true && mounted) {
                  AppleBanner.showSuccess(
                    context: context,
                    message: "Confirmed!",
                  );
                }
              },
            ),
            const SizedBox(height: 12),

            AppleButton(
              text: "Destructive Dialog",
              color: AppleColors.systemRed,
              icon: CupertinoIcons.delete,
              onPressed: () async {
                final result = await AppleDialog.showConfirm(
                  context: context,
                  title: "Delete Item",
                  message: "This action cannot be undone.",
                  confirmText: "Delete",
                  isDestructive: true,
                );

                if (result == true && mounted) {
                  AppleBanner.show(
                    context: context,
                    message: "Item deleted",
                    icon: CupertinoIcons.trash,
                  );
                }
              },
            ),

            const SizedBox(height: 32),

            // ============================================================
            // ACTION SHEET
            // ============================================================
            _sectionTitle('Action Sheet'),
            const SizedBox(height: 12),

            AppleButton(
              text: "Show Action Sheet",
              icon: CupertinoIcons.ellipsis_circle,
              onPressed: () {
                AppleDialog.showActionSheet(
                  context: context,
                  title: "Choose an option",
                  message: "Select one of the following actions",
                  actions: [
                    AppleActionSheetItem(
                      text: "Camera",
                      onPressed: () {
                        AppleBanner.show(
                          context: context,
                          message: "Camera selected",
                          icon: CupertinoIcons.camera,
                        );
                      },
                    ),
                    AppleActionSheetItem(
                      text: "Photo Library",
                      onPressed: () {
                        AppleBanner.show(
                          context: context,
                          message: "Photo library selected",
                          icon: CupertinoIcons.photo,
                        );
                      },
                    ),
                    AppleActionSheetItem(
                      text: "Delete",
                      onPressed: () {
                        AppleBanner.showError(
                          context: context,
                          message: "Deleted",
                        );
                      },
                      isDestructive: true,
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 32),

            // ============================================================
            // BOTTOM SHEET
            // ============================================================
            _sectionTitle('Bottom Sheet'),
            const SizedBox(height: 12),

            AppleButton(
              text: "Show Bottom Sheet",
              icon: CupertinoIcons.arrow_up_circle,
              onPressed: () {
                AppleBottomSheet.show(
                  context: context,
                  title: "Select Option",
                  child: Column(
                    children: [
                      AppleListTile(
                        title: 'Camera',
                        leadingIcon: CupertinoIcons.camera,
                        showChevron: true,
                        showDivider: true,
                        onTap: () {
                          Navigator.pop(context);
                          AppleBanner.show(
                            context: context,
                            message: "Camera selected",
                          );
                        },
                      ),
                      AppleListTile(
                        title: 'Gallery',
                        leadingIcon: CupertinoIcons.photo,
                        showChevron: true,
                        showDivider: true,
                        onTap: () {
                          Navigator.pop(context);
                          AppleBanner.show(
                            context: context,
                            message: "Gallery selected",
                          );
                        },
                      ),
                      AppleListTile(
                        title: 'Documents',
                        leadingIcon: CupertinoIcons.folder,
                        showChevron: true,
                        onTap: () {
                          Navigator.pop(context);
                          AppleBanner.show(
                            context: context,
                            message: "Documents selected",
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 32),

            // ============================================================
            // PICKER
            // ============================================================
            _sectionTitle('Picker'),
            const SizedBox(height: 12),

            AppleButton(
              text: "Show Picker",
              icon: CupertinoIcons.list_bullet,
              onPressed: () async {
                final categories = ['All', 'Electronics', 'Clothing', 'Food', 'Books'];
                final result = await ApplePicker.show<String>(
                  context: context,
                  items: categories,
                  itemBuilder: (item) => item,
                  title: "Select Category",
                );

                if (result != null && mounted) {
                  AppleBanner.show(
                    context: context,
                    message: "Selected: $result",
                  );
                }
              },
            ),

            const SizedBox(height: 32),

            // ============================================================
            // DATE PICKER
            // ============================================================
            _sectionTitle('Date Picker'),
            const SizedBox(height: 12),

            AppleButton(
              text: "Show Date Picker",
              icon: CupertinoIcons.calendar,
              onPressed: () async {
                final date = await AppleDatePicker.show(
                  context: context,
                  mode: CupertinoDatePickerMode.date,
                );

                if (date != null && mounted) {
                  AppleBanner.show(
                    context: context,
                    message: "Selected: ${date.day}/${date.month}/${date.year}",
                  );
                }
              },
            ),

            const SizedBox(height: 32),

            // ============================================================
            // BANNERS (SNACKBARS)
            // ============================================================
            _sectionTitle('Banners'),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: AppleButton(
                    text: "Success",
                    color: AppleColors.systemGreen,
                    onPressed: () {
                      AppleBanner.showSuccess(
                        context: context,
                        message: "Success!",
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AppleButton(
                    text: "Error",
                    color: AppleColors.systemRed,
                    onPressed: () {
                      AppleBanner.showError(
                        context: context,
                        message: "Error occurred!",
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            AppleButton(
              text: "Custom Banner",
              color: AppleColors.systemPurple,
              onPressed: () {
                AppleBanner.show(
                  context: context,
                  message: "This is a custom banner",
                  icon: CupertinoIcons.star_fill,
                  backgroundColor: AppleColors.systemPurple.withOpacity(0.1),
                );
              },
            ),

            const SizedBox(height: 32),

            // ============================================================
            // LOADING INDICATOR
            // ============================================================
            _sectionTitle('Loading Indicator'),
            const SizedBox(height: 12),

            const AppleCard(
              child: SizedBox(
                height: 80,
                child: AppleLoading(),
              ),
            ),

            const SizedBox(height: 32),

            // ============================================================
            // NAVIGATION DEMO
            // ============================================================
            _sectionTitle('Navigation'),
            const SizedBox(height: 12),

            AppleButton(
              text: "Go to Second Screen",
              icon: CupertinoIcons.arrow_right,
              onPressed: () {
                AppleUtils.navigateTo(context, const SecondScreen());
              },
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title.toUpperCase(),
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: AppleColors.secondaryLabel,
        letterSpacing: -0.1,
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}

// ============================================================================
// SECOND SCREEN - NAVIGATION DEMO
// ============================================================================

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: AppleNavBar(
        title: "Second Screen",
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            AppleUtils.navigateBack(context);
          },
          child: const Icon(
            CupertinoIcons.back,
            size: 30,
          ),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                CupertinoIcons.checkmark_circle_fill,
                size: 100,
                color: AppleColors.systemGreen,
              ),
              const SizedBox(height: 24),
              const Text(
                'This is a new screen!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.7,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'We navigated here using AppleUtils.navigateTo()',
                style: TextStyle(
                  fontSize: 17,
                  color: AppleColors.secondaryLabel,
                  letterSpacing: -0.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              AppleButton(
                text: "Go Back",
                icon: CupertinoIcons.back,
                onPressed: () {
                  AppleUtils.navigateBack(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// SIGN UP SCREEN
// ============================================================================

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool agreeToTerms = false;

  Future<void> _handleSignUp() async {
    if (!agreeToTerms) {
      AppleDialog.showAlert(
        context: context,
        title: "Terms Required",
        message: "Please agree to the terms and conditions",
      );
      return;
    }

    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => isLoading = false);

    if (mounted) {
      AppleDialog.showAlert(
        context: context,
        title: "Success!",
        message: "Account created successfully",
        onConfirm: () {
          AppleUtils.navigateBack(context);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: AppleNavBar(
        title: "Create Account",
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => AppleUtils.navigateBack(context),
          child: const Icon(CupertinoIcons.back, size: 30),
        ),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const SizedBox(height: 20),
            const Icon(
              CupertinoIcons.person_badge_plus,
              size: 80,
              color: AppleColors.systemBlue,
            ),
            const SizedBox(height: 24),
            const Text(
              'Join Us',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.9,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Create your account to get started',
              style: TextStyle(
                fontSize: 17,
                color: AppleColors.secondaryLabel,
                letterSpacing: -0.4,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            AppleTextField(
              controller: nameController,
              placeholder: "Full Name",
              label: "Name",
              prefixIcon: CupertinoIcons.person,
            ),
            const SizedBox(height: 16),
            AppleTextField(
              controller: emailController,
              placeholder: "your@email.com",
              label: "Email",
              prefixIcon: CupertinoIcons.mail,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            AppleTextField(
              controller: passwordController,
              placeholder: "Create password",
              label: "Password",
              prefixIcon: CupertinoIcons.lock,
              obscureText: true,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                CupertinoSwitch(
                  value: agreeToTerms,
                  onChanged: (value) {
                    setState(() => agreeToTerms = value);
                  },
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'I agree to the Terms and Conditions',
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: -0.2,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            AppleButton(
              text: "Create Account",
              icon: CupertinoIcons.checkmark_alt,
              isLoading: isLoading,
              onPressed: _handleSignUp,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}