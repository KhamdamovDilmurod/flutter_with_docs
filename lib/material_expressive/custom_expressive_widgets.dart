import 'package:flutter/material.dart';

/// Custom Expressive UI Widgets Library
/// Use this file in any project for Material Expressive style widgets.

// =============================
// EXPRESSIVE BUTTON
// =============================
class ExpressiveButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color? color;

  const ExpressiveButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.color,
  });

  @override
  State<ExpressiveButton> createState() => _ExpressiveButtonState();
}

class _ExpressiveButtonState extends State<ExpressiveButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      lowerBound: 0.0,
      upperBound: 0.1,
    );
    _scale = Tween<double>(begin: 1.0, end: 0.95).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = widget.color ?? Theme.of(context).colorScheme.primary;

    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      onTap: widget.onPressed,
      child: AnimatedBuilder(
        animation: _scale,
        builder: (context, child) {
          return Transform.scale(
            scale: _scale.value,
            child: child,
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          decoration: BoxDecoration(
            color: themeColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: themeColor.withOpacity(0.4),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, color: Colors.white),
                const SizedBox(width: 8),
              ],
              Text(
                widget.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =============================
// EXPRESSIVE CARD
// =============================
class ExpressiveCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const ExpressiveCard({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(28),
          boxShadow: const [
            BoxShadow(
              blurRadius: 20,
              offset: Offset(0, 8),
              color: Colors.black12,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}

// =============================
// EXPRESSIVE APP BAR
// =============================
class ExpressiveAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const ExpressiveAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      actions: actions,
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// =============================
// EXPRESSIVE FAB
// =============================
class ExpressiveFAB extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const ExpressiveFAB({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      icon: Icon(icon),
      label: const Text("Action"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}


// =============================
// EXPRESSIVE TEXT FIELD
// =============================
class ExpressiveTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final IconData? icon;

  const ExpressiveTextField({
    super.key,
    this.controller,
    required this.hint,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon != null ? Icon(icon) : null,
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

// =============================
// EXPRESSIVE LIST TILE
// =============================
class ExpressiveListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? leading;
  final VoidCallback? onTap;

  const ExpressiveListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ExpressiveCard(
      onTap: onTap,
      child: Row(
        children: [
          if (leading != null)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .primary
                    .withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(leading,
                  color: Theme.of(context).colorScheme.primary),
            ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}

// =============================
// EXPRESSIVE CHIP
// =============================
class ExpressiveChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onTap;

  const ExpressiveChip({
    super.key,
    required this.label,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: onTap,
      avatar: icon != null ? Icon(icon, size: 18) : null,
      label: Text(label),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }
}

// =============================
// EXPRESSIVE AVATAR
// =============================
class ExpressiveAvatar extends StatelessWidget {
  final String text;
  final double size;

  const ExpressiveAvatar({
    super.key,
    required this.text,
    this.size = 48,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: size * 0.35,
        ),
      ),
    );
  }
}

// =============================
// EXPRESSIVE DIALOG
// =============================
Future<void> showExpressiveDialog(
    BuildContext context, {
      required String title,
      required String message,
      required VoidCallback onConfirm,
    }) {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ExpressiveButton(
          text: "OK",
          onPressed: () {
            Navigator.pop(context);
            onConfirm();
          },
        ),
      ],
    ),
  );
}

// =============================
// EXPRESSIVE BOTTOM SHEET
// =============================
void showExpressiveBottomSheet(
    BuildContext context, {
      required Widget child,
    }) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
    ),
    builder: (_) => Padding(
      padding: const EdgeInsets.all(16),
      child: child,
    ),
  );
}


// =============================
// EXPRESSIVE LOADING
// =============================
class ExpressiveLoading extends StatelessWidget {
  final Color? color;
  final double size;

  const ExpressiveLoading({
    super.key,
    this.color,
    this.size = 48,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: 4,
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}

// =============================
// EXPRESSIVE SNACKBAR
// =============================
void showExpressiveSnackBar(
    BuildContext context, {
      required String message,
      Color? backgroundColor,
    }) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor:
    backgroundColor ?? Theme.of(context).colorScheme.primary,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

// =============================
// EXPRESSIVE TAB BAR
// =============================
class ExpressiveTabBar extends StatelessWidget {
  final List<Tab> tabs;
  final TabController controller;
  final Color? indicatorColor;

  const ExpressiveTabBar({
    super.key,
    required this.tabs,
    required this.controller,
    this.indicatorColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: TabBar(
        controller: controller,
        tabs: tabs,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: indicatorColor ??
              Theme.of(context).colorScheme.primary.withOpacity(0.15),
        ),
        labelColor: Theme.of(context).colorScheme.primary,
        unselectedLabelColor: Colors.grey,
      ),
    );
  }
}

// =============================
// EXPRESSIVE NAVIGATION BAR
// =============================
class ExpressiveNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomNavigationBarItem> items;
  final Color? selectedColor;

  const ExpressiveNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: items,
      type: BottomNavigationBarType.fixed,
      selectedItemColor:
      selectedColor ?? Theme.of(context).colorScheme.primary,
      unselectedItemColor: Colors.grey,
      elevation: 12,
    );
  }
}

// =============================
// EXPRESSIVE EMPTY STATE
// =============================
class ExpressiveEmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color? color;

  const ExpressiveEmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final c = color ?? Theme.of(context).colorScheme.primary;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 64, color: c.withOpacity(0.7)),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
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

// =============================
// EXPRESSIVE PROFILE CARD
// =============================
class ExpressiveProfileCard extends StatelessWidget {
  final String name;
  final String subtitle;
  final String avatarText;
  final Color? accentColor;

  const ExpressiveProfileCard({
    super.key,
    required this.name,
    required this.subtitle,
    required this.avatarText,
    this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    final c = accentColor ?? Theme.of(context).colorScheme.primary;

    return ExpressiveCard(
      child: Row(
        children: [
          ExpressiveAvatar(text: avatarText),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          Icon(Icons.more_vert, color: c),
        ],
      ),
    );
  }
}

// =============================
// EXPRESSIVE DASHBOARD CARD
// =============================
class ExpressiveDashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color? color;

  const ExpressiveDashboardCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final c = color ?? Theme.of(context).colorScheme.primary;

    return ExpressiveCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: c, size: 28),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
