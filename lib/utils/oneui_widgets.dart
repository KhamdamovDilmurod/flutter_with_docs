import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ============================================================================
// SAMSUNG ONE UI COLOR PALETTE
// ============================================================================

class OneUIColors {
  // Primary Colors
  static const Color primary = Color(0xFF0080FF);
  static const Color primaryDark = Color(0xFF0066CC);
  static const Color primaryLight = Color(0xFF4DA3FF);

  // Background Colors
  static const Color background = Color(0xFFF5F5F5);
  static const Color backgroundDark = Color(0xFF000000);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1C1C1E);

  // Text Colors
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFFBDBDBD);
  static const Color textWhite = Color(0xFFFFFFFF);

  // Status Colors
  static const Color success = Color(0xFF34C759);
  static const Color error = Color(0xFFFF3B30);
  static const Color warning = Color(0xFFFF9500);
  static const Color info = Color(0xFF007AFF);

  // Divider & Border
  static const Color divider = Color(0xFFE0E0E0);
  static const Color border = Color(0xFFD1D1D6);

  // Shadow
  static const Color shadow = Color(0x1A000000);
}

// ============================================================================
// SAMSUNG ONE UI BUTTON
// ============================================================================

class OneUIButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double height;
  final double borderRadius;
  final IconData? icon;
  final bool isOutlined;
  final bool isDisabled;
  final bool isLoading;

  const OneUIButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height = 56.0,
    this.borderRadius = 28.0,
    this.icon,
    this.isOutlined = false,
    this.isDisabled = false,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = isDisabled
        ? OneUIColors.divider
        : backgroundColor ?? OneUIColors.primary;
    final txtColor = textColor ?? OneUIColors.textWhite;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: isOutlined ? Colors.transparent : bgColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: isOutlined
            ? Border.all(color: bgColor, width: 2)
            : null,
        boxShadow: isOutlined || isDisabled
            ? null
            : [
          BoxShadow(
            color: bgColor.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: isDisabled || isLoading ? null : onPressed,
          child: Center(
            child: isLoading
                ? SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(txtColor),
              ),
            )
                : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(icon, color: isOutlined ? bgColor : txtColor, size: 22),
                  const SizedBox(width: 8),
                ],
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isOutlined ? bgColor : txtColor,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// SAMSUNG ONE UI TEXT FIELD
// ============================================================================

class OneUITextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLength;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool readOnly;
  final VoidCallback? onTap;

  const OneUITextField({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.obscureText = false,
    this.keyboardType,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.validator,
    this.readOnly = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: OneUIColors.textSecondary,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 8),
        ],
        Container(
          decoration: BoxDecoration(
            color: OneUIColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: OneUIColors.divider, width: 1.5),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            maxLines: maxLines,
            maxLength: maxLength,
            onChanged: onChanged,
            validator: validator,
            readOnly: readOnly,
            onTap: onTap,
            style: const TextStyle(
              fontSize: 16,
              color: OneUIColors.textPrimary,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: OneUIColors.textHint,
                fontSize: 16,
              ),
              prefixIcon: prefixIcon != null
                  ? Icon(prefixIcon, color: OneUIColors.textSecondary)
                  : null,
              suffixIcon: suffixIcon != null
                  ? IconButton(
                icon: Icon(suffixIcon, color: OneUIColors.textSecondary),
                onPressed: onSuffixTap,
              )
                  : null,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              counterText: '',
            ),
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// SAMSUNG ONE UI CARD
// ============================================================================

class OneUICard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final double borderRadius;
  final VoidCallback? onTap;
  final bool hasShadow;

  const OneUICard({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderRadius = 16.0,
    this.onTap,
    this.hasShadow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor ?? OneUIColors.surface,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: hasShadow
            ? [
          BoxShadow(
            color: OneUIColors.shadow,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onTap,
          child: Padding(
            padding: padding ?? const EdgeInsets.all(16),
            child: child,
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// SAMSUNG ONE UI LIST TILE
// ============================================================================

class OneUIListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? leadingIcon;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? iconColor;
  final bool showDivider;

  const OneUIListTile({
    Key? key,
    required this.title,
    this.subtitle,
    this.leadingIcon,
    this.trailing,
    this.onTap,
    this.iconColor,
    this.showDivider = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                if (leadingIcon != null) ...[
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: (iconColor ?? OneUIColors.primary).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      leadingIcon,
                      color: iconColor ?? OneUIColors.primary,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: OneUIColors.textPrimary,
                        ),
                      ),
                      if (subtitle != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          subtitle!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: OneUIColors.textSecondary,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (trailing != null) trailing!,
              ],
            ),
          ),
        ),
        if (showDivider)
          const Divider(
            height: 1,
            thickness: 1,
            color: OneUIColors.divider,
            indent: 72,
          ),
      ],
    );
  }
}

// ============================================================================
// SAMSUNG ONE UI SWITCH
// ============================================================================

class OneUISwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color? activeColor;

  const OneUISwitch({
    Key? key,
    required this.value,
    this.onChanged,
    this.activeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
      activeColor: activeColor ?? OneUIColors.primary,
      activeTrackColor: (activeColor ?? OneUIColors.primary).withOpacity(0.5),
      inactiveThumbColor: OneUIColors.surface,
      inactiveTrackColor: OneUIColors.divider,
    );
  }
}

// ============================================================================
// SAMSUNG ONE UI DIALOG
// ============================================================================

class OneUIDialog {
  static Future<void> showAlert({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
    VoidCallback? onConfirm,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: OneUIColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 16,
                      color: OneUIColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  OneUIButton(
                    text: confirmText ?? "Хорошо",
                    onPressed: () {
                      Navigator.pop(context);
                      onConfirm?.call();
                    },
                    height: 48,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<bool?> showConfirm({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
    String? cancelText,
    Color? confirmColor,
  }) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: OneUIColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 16,
                      color: OneUIColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: OneUIButton(
                          text: cancelText ?? "Отмена",
                          onPressed: () => Navigator.pop(context, false),
                          height: 48,
                          isOutlined: true,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OneUIButton(
                          text: confirmText ?? "Да",
                          backgroundColor: confirmColor,
                          onPressed: () => Navigator.pop(context, true),
                          height: 48,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<void> showSuccess({
    required BuildContext context,
    required String message,
    String? title,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: OneUIColors.success.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_circle,
                      color: OneUIColors.success,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    title ?? "Успешно",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: OneUIColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 16,
                      color: OneUIColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  OneUIButton(
                    text: "ОК",
                    onPressed: () => Navigator.pop(context),
                    height: 48,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<void> showError({
    required BuildContext context,
    required String message,
    String? title,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: OneUIColors.error.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.error,
                      color: OneUIColors.error,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    title ?? "Ошибка",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: OneUIColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 16,
                      color: OneUIColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  OneUIButton(
                    text: "ОК",
                    onPressed: () => Navigator.pop(context),
                    height: 48,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// ============================================================================
// SAMSUNG ONE UI BOTTOM SHEET
// ============================================================================

class OneUIBottomSheet {
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          decoration: const BoxDecoration(
            color: OneUIColors.surface,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: OneUIColors.divider,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              if (title != null) ...[
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: OneUIColors.textPrimary,
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 16),
              Flexible(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: child,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// SAMSUNG ONE UI SNACKBAR
// ============================================================================

class OneUISnackBar {
  static void show({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
    IconData? icon,
    Color? backgroundColor,
    VoidCallback? onAction,
    String? actionLabel,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: OneUIColors.textWhite, size: 20),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 15,
                  color: OneUIColors.textWhite,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor ?? OneUIColors.textPrimary,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        action: onAction != null && actionLabel != null
            ? SnackBarAction(
          label: actionLabel,
          textColor: OneUIColors.primary,
          onPressed: onAction,
        )
            : null,
      ),
    );
  }

  static void showSuccess({
    required BuildContext context,
    required String message,
  }) {
    show(
      context: context,
      message: message,
      icon: Icons.check_circle,
      backgroundColor: OneUIColors.success,
    );
  }

  static void showError({
    required BuildContext context,
    required String message,
  }) {
    show(
      context: context,
      message: message,
      icon: Icons.error,
      backgroundColor: OneUIColors.error,
    );
  }

  static void showWarning({
    required BuildContext context,
    required String message,
  }) {
    show(
      context: context,
      message: message,
      icon: Icons.warning,
      backgroundColor: OneUIColors.warning,
    );
  }
}

// ============================================================================
// SAMSUNG ONE UI APP BAR
// ============================================================================

class OneUIAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool centerTitle;
  final Widget? leading;
  final Color? backgroundColor;
  final double elevation;

  const OneUIAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.centerTitle = false,
    this.leading,
    this.backgroundColor,
    this.elevation = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: OneUIColors.textPrimary,
        ),
      ),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? OneUIColors.background,
      elevation: elevation,
      leading: leading,
      actions: actions,
      iconTheme: const IconThemeData(color: OneUIColors.textPrimary),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

// ============================================================================
// SAMSUNG ONE UI LOADING INDICATOR
// ============================================================================

class OneUILoading extends StatelessWidget {
  final Color? color;
  final double size;

  const OneUILoading({
    Key? key,
    this.color,
    this.size = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation<Color>(
            color ?? OneUIColors.primary,
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// SAMSUNG ONE UI CHIP
// ============================================================================

class OneUIChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isSelected;

  const OneUIChip({
    Key? key,
    required this.label,
    this.icon,
    this.onTap,
    this.onDelete,
    this.backgroundColor,
    this.textColor,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = isSelected
        ? (backgroundColor ?? OneUIColors.primary)
        : OneUIColors.divider;
    final txtColor = isSelected
        ? OneUIColors.textWhite
        : (textColor ?? OneUIColors.textPrimary);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 18, color: txtColor),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: txtColor,
              ),
            ),
            if (onDelete != null) ...[
              const SizedBox(width: 6),
              InkWell(
                onTap: onDelete,
                child: Icon(Icons.close, size: 18, color: txtColor),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// SAMSUNG ONE UI DIVIDER
// ============================================================================

class OneUIDivider extends StatelessWidget {
  final double? height;
  final double? thickness;
  final Color? color;
  final double? indent;
  final double? endIndent;

  const OneUIDivider({
    Key? key,
    this.height,
    this.thickness,
    this.color,
    this.indent,
    this.endIndent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height ?? 1,
      thickness: thickness ?? 1,
      color: color ?? OneUIColors.divider,
      indent: indent,
      endIndent: endIndent,
    );
  }
}

// ============================================================================
// SAMSUNG ONE UI SEARCH BAR
// ============================================================================

class OneUISearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Function(String)? onChanged;
  final VoidCallback? onClear;
  final bool autofocus;

  const OneUISearchBar({
    Key? key,
    this.controller,
    this.hintText,
    this.onChanged,
    this.onClear,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: OneUIColors.divider.withOpacity(0.3),
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextField(
        controller: controller,
        autofocus: autofocus,
        onChanged: onChanged,
        style: const TextStyle(
          fontSize: 16,
          color: OneUIColors.textPrimary,
        ),
        decoration: InputDecoration(
          hintText: hintText ?? "Поиск...",
          hintStyle: const TextStyle(
            color: OneUIColors.textHint,
            fontSize: 16,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: OneUIColors.textSecondary,
          ),
          suffixIcon: controller?.text.isNotEmpty ?? false
              ? IconButton(
            icon: const Icon(
              Icons.clear,
              color: OneUIColors.textSecondary,
            ),
            onPressed: () {
              controller?.clear();
              onClear?.call();
            },
          )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}

// ============================================================================
// UTILITY FUNCTIONS
// ============================================================================

class OneUIUtils {
  // Navigation
  static void navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  static void navigateReplacement(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  static void navigateBack(BuildContext context, {dynamic result}) {
    Navigator.pop(context, result);
  }

  static void navigateClearStack(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => screen),
          (route) => false,
    );
  }

  // Focus Management
  static void clearFocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  // Screen Dimensions
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // Haptic Feedback
  static void vibrateLight() {
    HapticFeedback.lightImpact();
  }

  static void vibrateMedium() {
    HapticFeedback.mediumImpact();
  }

  static void vibrateHeavy() {
    HapticFeedback.heavyImpact();
  }

  // System UI Configuration
  static void setLightStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
  }

  static void setDarkStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));
  }

  static void setPortraitOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static void setLandscapeOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  static void setAllOrientations() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
}

// ============================================================================
// SAMSUNG ONE UI BADGE
// ============================================================================

class OneUIBadge extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;

  const OneUIBadge({
    Key? key,
    required this.text,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor ?? OneUIColors.error,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: textColor ?? OneUIColors.textWhite,
        ),
      ),
    );
  }
}

// ============================================================================
// SAMSUNG ONE UI RADIO BUTTON
// ============================================================================

class OneUIRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T?>? onChanged;
  final String? label;

  const OneUIRadioButton({
    Key? key,
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged?.call(value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio<T>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: OneUIColors.primary,
          ),
          if (label != null)
            Text(
              label!,
              style: const TextStyle(
                fontSize: 16,
                color: OneUIColors.textPrimary,
              ),
            ),
        ],
      ),
    );
  }
}

// ============================================================================
// SAMSUNG ONE UI CHECKBOX
// ============================================================================

class OneUICheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final String? label;

  const OneUICheckbox({
    Key? key,
    required this.value,
    this.onChanged,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged?.call(!value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: OneUIColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          if (label != null)
            Text(
              label!,
              style: const TextStyle(
                fontSize: 16,
                color: OneUIColors.textPrimary,
              ),
            ),
        ],
      ),
    );
  }
}