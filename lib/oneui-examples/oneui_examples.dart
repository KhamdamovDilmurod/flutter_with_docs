import 'package:flutter/material.dart';

import '../utils/oneui_widgets.dart';

// ============================================================================
// HOME SCREEN - BARCHA WIDGETLARNI KO'RSATISH
// ============================================================================

class OneUiExampleScreen extends StatefulWidget {
  const OneUiExampleScreen({Key? key}) : super(key: key);

  @override
  State<OneUiExampleScreen> createState() => _OneUiExampleScreenState();
}

class _OneUiExampleScreenState extends State<OneUiExampleScreen> {
  bool switchValue = false;
  bool checkboxValue = false;
  String selectedRadio = 'option1';
  final TextEditingController searchController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OneUIAppBar(
        title: 'OneUI Widgets Demo',
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              OneUIUtils.navigateTo(context, const SettingsScreen());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ============================================================
            // BUTTONS SECTION
            // ============================================================
            _sectionTitle('Tugmalar (Buttons)'),
            const SizedBox(height: 12),

            OneUIButton(
              text: 'Oddiy tugma',
              icon: Icons.check,
              onPressed: () {
                OneUISnackBar.showSuccess(
                  context: context,
                  message: 'Tugma bosildi!',
                );
              },
            ),
            const SizedBox(height: 12),

            OneUIButton(
              text: 'Outlined tugma',
              icon: Icons.favorite_border,
              isOutlined: true,
              onPressed: () {
                OneUISnackBar.show(
                  context: context,
                  message: 'Outlined tugma bosildi',
                );
              },
            ),
            const SizedBox(height: 12),

            OneUIButton(
              text: 'Loading holati',
              isLoading: isLoading,
              onPressed: () async {
                setState(() => isLoading = true);
                await Future.delayed(const Duration(seconds: 2));
                setState(() => isLoading = false);
                OneUISnackBar.showSuccess(
                  context: context,
                  message: 'Yuklash tugadi!',
                );
              },
            ),
            const SizedBox(height: 12),

            OneUIButton(
              text: 'Disabled tugma',
              isDisabled: true,
              onPressed: () {},
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: OneUIButton(
                    text: 'Qizil',
                    backgroundColor: OneUIColors.error,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OneUIButton(
                    text: 'Yashil',
                    backgroundColor: OneUIColors.success,
                    onPressed: () {},
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // ============================================================
            // TEXT FIELDS SECTION
            // ============================================================
            _sectionTitle('Matn maydonlari (Text Fields)'),
            const SizedBox(height: 12),

            OneUITextField(
              controller: nameController,
              labelText: 'Ismingiz',
              hintText: 'Ismingizni kiriting',
              prefixIcon: Icons.person,
            ),
            const SizedBox(height: 12),

            OneUITextField(
              hintText: 'Email manzilingiz',
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),

            OneUITextField(
              hintText: 'Parol',
              prefixIcon: Icons.lock,
              obscureText: true,
              suffixIcon: Icons.visibility,
              onSuffixTap: () {
                print('Ko\'rish bosildi');
              },
            ),

            const SizedBox(height: 32),

            // ============================================================
            // SEARCH BAR
            // ============================================================
            _sectionTitle('Qidiruv (Search)'),
            const SizedBox(height: 12),

            OneUISearchBar(
              controller: searchController,
              hintText: 'Qidirish...',
              onChanged: (value) {
                print('Qidirilmoqda: $value');
              },
              onClear: () {
                print('Qidiruv tozalandi');
              },
            ),

            const SizedBox(height: 32),

            // ============================================================
            // CARDS SECTION
            // ============================================================
            _sectionTitle('Kartochkalar (Cards)'),
            const SizedBox(height: 12),

            OneUICard(
              onTap: () {
                OneUISnackBar.show(
                  context: context,
                  message: 'Kartochka bosildi',
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Kartochka sarlavhasi',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: OneUIColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Bu yerda kartochka matni yoziladi. Samsung One UI dizayni bilan.',
                    style: TextStyle(
                      fontSize: 14,
                      color: OneUIColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // ============================================================
            // LIST TILES SECTION
            // ============================================================
            _sectionTitle('Ro\'yxat elementlari (List Tiles)'),
            const SizedBox(height: 12),

            OneUICard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  OneUIListTile(
                    title: 'Sozlamalar',
                    subtitle: 'Ilova sozlamalarini boshqarish',
                    leadingIcon: Icons.settings,
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: OneUIColors.textSecondary,
                    ),
                    onTap: () {
                      OneUIUtils.navigateTo(context, const SettingsScreen());
                    },
                    showDivider: true,
                  ),
                  OneUIListTile(
                    title: 'Profil',
                    subtitle: 'Shaxsiy ma\'lumotlar',
                    leadingIcon: Icons.person,
                    iconColor: OneUIColors.success,
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: OneUIColors.textSecondary,
                    ),
                    onTap: () {},
                    showDivider: true,
                  ),
                  OneUIListTile(
                    title: 'Yordam',
                    subtitle: 'Qo\'llab-quvvatlash',
                    leadingIcon: Icons.help,
                    iconColor: OneUIColors.warning,
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: OneUIColors.textSecondary,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // ============================================================
            // SWITCHES AND CHECKBOXES
            // ============================================================
            _sectionTitle('Switch va Checkbox'),
            const SizedBox(height: 12),

            OneUICard(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Bildirishnomalar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      OneUISwitch(
                        value: switchValue,
                        onChanged: (value) {
                          setState(() => switchValue = value);
                          OneUIUtils.vibrateMedium();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  OneUICheckbox(
                    value: checkboxValue,
                    label: 'Men shartlarga roziman',
                    onChanged: (value) {
                      setState(() => checkboxValue = value ?? false);
                      OneUIUtils.vibrateLight();
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // ============================================================
            // RADIO BUTTONS
            // ============================================================
            _sectionTitle('Radio Buttons'),
            const SizedBox(height: 12),

            OneUICard(
              child: Column(
                children: [
                  OneUIRadioButton<String>(
                    value: 'option1',
                    groupValue: selectedRadio,
                    label: 'Birinchi variant',
                    onChanged: (value) {
                      setState(() => selectedRadio = value!);
                      OneUIUtils.vibrateLight();
                    },
                  ),
                  OneUIRadioButton<String>(
                    value: 'option2',
                    groupValue: selectedRadio,
                    label: 'Ikkinchi variant',
                    onChanged: (value) {
                      setState(() => selectedRadio = value!);
                      OneUIUtils.vibrateLight();
                    },
                  ),
                  OneUIRadioButton<String>(
                    value: 'option3',
                    groupValue: selectedRadio,
                    label: 'Uchinchi variant',
                    onChanged: (value) {
                      setState(() => selectedRadio = value!);
                      OneUIUtils.vibrateLight();
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // ============================================================
            // CHIPS
            // ============================================================
            _sectionTitle('Chiplar (Chips)'),
            const SizedBox(height: 12),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                OneUIChip(
                  label: 'Flutter',
                  icon: Icons.code,
                  isSelected: true,
                  onTap: () {
                    OneUISnackBar.show(
                      context: context,
                      message: 'Flutter chip bosildi',
                    );
                  },
                ),
                OneUIChip(
                  label: 'Dart',
                  icon: Icons.developer_mode,
                  onTap: () {},
                ),
                OneUIChip(
                  label: 'Mobile',
                  icon: Icons.phone_android,
                  onTap: () {},
                ),
                OneUIChip(
                  label: "O'chirish",
                  icon: Icons.close,
                  backgroundColor: OneUIColors.error,
                  onDelete: () {
                    OneUISnackBar.showError(
                      context: context,
                      message: 'Chip o\'chirildi',
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 32),

            // ============================================================
            // BADGES
            // ============================================================
            _sectionTitle('Belgilar (Badges)'),
            const SizedBox(height: 12),

            Row(
              children: const [
                OneUIBadge(text: '5'),
                SizedBox(width: 12),
                OneUIBadge(
                  text: 'Yangi',
                  backgroundColor: OneUIColors.success,
                ),
                SizedBox(width: 12),
                OneUIBadge(
                  text: 'VIP',
                  backgroundColor: OneUIColors.warning,
                ),
              ],
            ),

            const SizedBox(height: 32),

            // ============================================================
            // DIALOGS SECTION
            // ============================================================
            _sectionTitle('Dialoglar (Dialogs)'),
            const SizedBox(height: 12),

            OneUIButton(
              text: 'Oddiy Alert',
              icon: Icons.info,
              onPressed: () {
                OneUIDialog.showAlert(
                  context: context,
                  title: 'Diqqat!',
                  message: 'Bu oddiy alert dialog',
                  confirmText: 'Tushunarli',
                );
              },
            ),
            const SizedBox(height: 12),

            OneUIButton(
              text: 'Tasdiqlash Dialog',
              icon: Icons.help,
              onPressed: () async {
                final result = await OneUIDialog.showConfirm(
                  context: context,
                  title: 'Tasdiqlash',
                  message: 'Rostdan ham davom etmoqchimisiz?',
                  confirmText: 'Ha',
                  cancelText: 'Yo\'q',
                );

                if (result == true) {
                  OneUISnackBar.showSuccess(
                    context: context,
                    message: 'Tasdiqlandi',
                  );
                }
              },
            ),
            const SizedBox(height: 12),

            OneUIButton(
              text: 'Muvaffaqiyat Dialog',
              icon: Icons.check_circle,
              backgroundColor: OneUIColors.success,
              onPressed: () {
                OneUIDialog.showSuccess(
                  context: context,
                  message: 'Amaliyot muvaffaqiyatli bajarildi!',
                );
              },
            ),
            const SizedBox(height: 12),

            OneUIButton(
              text: 'Xato Dialog',
              icon: Icons.error,
              backgroundColor: OneUIColors.error,
              onPressed: () {
                OneUIDialog.showError(
                  context: context,
                  message: 'Nimadadir xatolik yuz berdi!',
                );
              },
            ),

            const SizedBox(height: 32),

            // ============================================================
            // BOTTOM SHEET SECTION
            // ============================================================
            _sectionTitle('Bottom Sheet'),
            const SizedBox(height: 12),

            OneUIButton(
              text: 'Bottom Sheet ko\'rsatish',
              icon: Icons.arrow_upward,
              onPressed: () {
                OneUIBottomSheet.show(
                  context: context,
                  title: 'Variantlarni tanlang',
                  child: Column(
                    children: [
                      OneUIListTile(
                        title: 'Kamera',
                        leadingIcon: Icons.camera_alt,
                        onTap: () {
                          Navigator.pop(context);
                          OneUISnackBar.show(
                            context: context,
                            message: 'Kamera tanlandi',
                          );
                        },
                        showDivider: true,
                      ),
                      OneUIListTile(
                        title: 'Galeriya',
                        leadingIcon: Icons.photo_library,
                        onTap: () {
                          Navigator.pop(context);
                          OneUISnackBar.show(
                            context: context,
                            message: 'Galeriya tanlandi',
                          );
                        },
                        showDivider: true,
                      ),
                      OneUIListTile(
                        title: 'Hujjatlar',
                        leadingIcon: Icons.folder,
                        onTap: () {
                          Navigator.pop(context);
                          OneUISnackBar.show(
                            context: context,
                            message: 'Hujjatlar tanlandi',
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
            // SNACKBARS SECTION
            // ============================================================
            _sectionTitle('Snackbarlar'),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: OneUIButton(
                    text: 'Success',
                    backgroundColor: OneUIColors.success,
                    onPressed: () {
                      OneUISnackBar.showSuccess(
                        context: context,
                        message: 'Muvaffaqiyatli!',
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OneUIButton(
                    text: 'Error',
                    backgroundColor: OneUIColors.error,
                    onPressed: () {
                      OneUISnackBar.showError(
                        context: context,
                        message: 'Xatolik!',
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            OneUIButton(
              text: 'Warning Snackbar',
              backgroundColor: OneUIColors.warning,
              onPressed: () {
                OneUISnackBar.showWarning(
                  context: context,
                  message: 'Ogohlantirish!',
                );
              },
            ),
            const SizedBox(height: 12),

            OneUIButton(
              text: 'Action bilan Snackbar',
              onPressed: () {
                OneUISnackBar.show(
                  context: context,
                  message: 'Element o\'chirildi',
                  actionLabel: 'Bekor qilish',
                  onAction: () {
                    OneUISnackBar.showSuccess(
                      context: context,
                      message: 'Bekor qilindi',
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 32),

            // ============================================================
            // LOADING INDICATOR
            // ============================================================
            _sectionTitle('Loading Indicator'),
            const SizedBox(height: 12),

            const OneUICard(
              child: SizedBox(
                height: 100,
                child: OneUILoading(),
              ),
            ),

            const SizedBox(height: 32),

            // ============================================================
            // DIVIDER
            // ============================================================
            _sectionTitle('Divider'),
            const SizedBox(height: 12),

            OneUICard(
              child: Column(
                children: const [
                  Text('Yuqoridagi matn'),
                  SizedBox(height: 8),
                  OneUIDivider(),
                  SizedBox(height: 8),
                  Text('Pastdagi matn'),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // ============================================================
            // NAVIGATION DEMO
            // ============================================================
            _sectionTitle('Navigatsiya (Navigation)'),
            const SizedBox(height: 12),

            OneUIButton(
              text: 'Yangi ekranga o\'tish',
              icon: Icons.arrow_forward,
              onPressed: () {
                OneUIUtils.navigateTo(context, const SecondScreen());
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
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: OneUIColors.textPrimary,
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    nameController.dispose();
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
    return Scaffold(
      appBar: OneUIAppBar(
        title: 'Ikkinchi Ekran',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            OneUIUtils.navigateBack(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                size: 100,
                color: OneUIColors.success,
              ),
              const SizedBox(height: 24),
              const Text(
                'Bu yangi ekran!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: OneUIColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'OneUIUtils.navigateTo() yordamida bu yerga keldik.',
                style: TextStyle(
                  fontSize: 16,
                  color: OneUIColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              OneUIButton(
                text: 'Orqaga qaytish',
                icon: Icons.arrow_back,
                onPressed: () {
                  OneUIUtils.navigateBack(context);
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
// SETTINGS SCREEN
// ============================================================================

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;
  bool soundEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OneUIAppBar(
        title: 'Sozlamalar',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => OneUIUtils.navigateBack(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),

            OneUICard(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Bildirishnomalar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        OneUISwitch(
                          value: notificationsEnabled,
                          onChanged: (value) {
                            setState(() => notificationsEnabled = value);
                          },
                        ),
                      ],
                    ),
                  ),
                  const OneUIDivider(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Qorong\'u rejim',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        OneUISwitch(
                          value: darkModeEnabled,
                          onChanged: (value) {
                            setState(() => darkModeEnabled = value);
                          },
                        ),
                      ],
                    ),
                  ),
                  const OneUIDivider(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Tovushlar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        OneUISwitch(
                          value: soundEnabled,
                          onChanged: (value) {
                            setState(() => soundEnabled = value);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: OneUIButton(
                text: 'Sozlamalarni saqlash',
                icon: Icons.save,
                onPressed: () async {
                  // Saqlash jarayoni
                  await Future.delayed(const Duration(seconds: 1));

                  OneUIDialog.showSuccess(
                    context: context,
                    message: 'Sozlamalar saqlandi!',
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

// ============================================================================
// LOGIN SCREEN MISOL
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
  bool rememberMe = false;

  Future<void> _handleLogin() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      OneUIDialog.showError(
        context: context,
        message: 'Iltimos, barcha maydonlarni to\'ldiring!',
      );
      return;
    }

    setState(() => isLoading = true);

    // Login jarayonini simulyatsiya qilish
    await Future.delayed(const Duration(seconds: 2));

    setState(() => isLoading = false);

    OneUIDialog.showSuccess(
      context: context,
      message: 'Xush kelibsiz!',
      // onConfirm: () {
      //   OneUIUtils.navigateClearStack(context, const HomeScreen());
      // },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),

              const Icon(
                Icons.lock_outline,
                size: 80,
                color: OneUIColors.primary,
              ),

              const SizedBox(height: 24),

              const Text(
                'Kirish',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: OneUIColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),

              const Text(
                'Hisobingizga kiring',
                style: TextStyle(
                  fontSize: 16,
                  color: OneUIColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              OneUITextField(
                controller: emailController,
                labelText: 'Email',
                hintText: 'example@gmail.com',
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 16),

              OneUITextField(
                controller: passwordController,
                labelText: 'Parol',
                hintText: '••••••••',
                prefixIcon: Icons.lock,
                obscureText: true,
                suffixIcon: Icons.visibility,
              ),

              const SizedBox(height: 16),

              OneUICheckbox(
                value: rememberMe,
                label: 'Meni eslab qol',
                onChanged: (value) {
                  setState(() => rememberMe = value ?? false);
                },
              ),

              const SizedBox(height: 32),

              OneUIButton(
                text: 'Kirish',
                icon: Icons.login,
                isLoading: isLoading,
                onPressed: _handleLogin,
              ),

              const SizedBox(height: 16),

              OneUIButton(
                text: 'Ro\'yxatdan o\'tish',
                isOutlined: true,
                onPressed: () {
                  OneUISnackBar.show(
                    context: context,
                    message: 'Ro\'yxatdan o\'tish sahifasi',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}