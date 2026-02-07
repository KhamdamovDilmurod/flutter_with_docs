import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ============================================================================
// APPLE iOS COLOR PALETTE
// ============================================================================

class AppleColors {
  // System Colors (Light Mode)
  static const Color systemBlue = Color(0xFF007AFF);
  static const Color systemGreen = Color(0xFF34C759);
  static const Color systemIndigo = Color(0xFF5856D6);
  static const Color systemOrange = Color(0xFFFF9500);
  static const Color systemPink = Color(0xFFFF2D55);
  static const Color systemPurple = Color(0xFFAF52DE);
  static const Color systemRed = Color(0xFFFF3B30);
  static const Color systemTeal = Color(0xFF5AC8FA);
  static const Color systemYellow = Color(0xFFFFCC00);

  // Gray Scale
  static const Color systemGray = Color(0xFF8E8E93);
  static const Color systemGray2 = Color(0xFFAEAEB2);
  static const Color systemGray3 = Color(0xFFC7C7CC);
  static const Color systemGray4 = Color(0xFFD1D1D6);
  static const Color systemGray5 = Color(0xFFE5E5EA);
  static const Color systemGray6 = Color(0xFFF2F2F7);

  // Background Colors
  static const Color systemBackground = Color(0xFFFFFFFF);
  static const Color secondarySystemBackground = Color(0xFFF2F2F7);
  static const Color tertiarySystemBackground = Color(0xFFFFFFFF);

  // Grouped Background
  static const Color systemGroupedBackground = Color(0xFFF2F2F7);
  static const Color secondarySystemGroupedBackground = Color(0xFFFFFFFF);
  static const Color tertiarySystemGroupedBackground = Color(0xFFF2F2F7);

  // Label Colors
  static const Color label = Color(0xFF000000);
  static const Color secondaryLabel = Color(0x993C3C43);
  static const Color tertiaryLabel = Color(0x4C3C3C43);
  static const Color quaternaryLabel = Color(0x2D3C3C43);

  // Fill Colors
  static const Color systemFill = Color(0x33787880);
  static const Color secondarySystemFill = Color(0x28787880);
  static const Color tertiarySystemFill = Color(0x1E767680);
  static const Color quaternarySystemFill = Color(0x14747480);

  // Separator
  static const Color separator = Color(0x493C3C43);
  static const Color opaqueSeparator = Color(0xFFC6C6C8);

  // Dark Mode Colors
  static const Color darkSystemBackground = Color(0xFF000000);
  static const Color darkSecondarySystemBackground = Color(0xFF1C1C1E);
  static const Color darkTertiarySystemBackground = Color(0xFF2C2C2E);
}

// ============================================================================
// APPLE iOS BUTTON
// ============================================================================

class AppleButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final double? width;
  final double height;
  final double borderRadius;
  final IconData? icon;
  final bool isFilled;
  final bool isDisabled;
  final bool isLoading;
  final AppleButtonSize size;

  const AppleButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.color,
    this.textColor,
    this.width,
    this.height = 50.0,
    this.borderRadius = 12.0,
    this.icon,
    this.isFilled = true,
    this.isDisabled = false,
    this.isLoading = false,
    this.size = AppleButtonSize.medium,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonColor = isDisabled
        ? AppleColors.systemGray4
        : (color ?? AppleColors.systemBlue);

    final textColorFinal = isFilled
        ? (textColor ?? CupertinoColors.white)
        : buttonColor;

    double fontSize;
    double paddingHorizontal;

    switch (size) {
      case AppleButtonSize.small:
        fontSize = 14;
        paddingHorizontal = 16;
        break;
      case AppleButtonSize.large:
        fontSize = 18;
        paddingHorizontal = 24;
        break;
      case AppleButtonSize.medium:
      default:
        fontSize = 16;
        paddingHorizontal = 20;
    }

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: isDisabled || isLoading ? null : onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isFilled ? buttonColor : Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
          border: !isFilled
              ? Border.all(color: buttonColor, width: 1.5)
              : null,
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
            width: 20,
            height: 20,
            child: CupertinoActivityIndicator(
              color: textColorFinal,
            ),
          )
              : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, color: textColorFinal, size: 20),
                const SizedBox(width: 8),
              ],
              Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600,
                    color: textColorFinal,
                    letterSpacing: -0.3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum AppleButtonSize { small, medium, large }

// ============================================================================
// APPLE iOS TEXT FIELD
// ============================================================================

class AppleTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final String? label;
  final IconData? prefixIcon;
  final Widget? suffix;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLength;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool autofocus;

  const AppleTextField({
    Key? key,
    this.controller,
    this.placeholder,
    this.label,
    this.prefixIcon,
    this.suffix,
    this.obscureText = false,
    this.keyboardType,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.validator,
    this.readOnly = false,
    this.onTap,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppleColors.secondaryLabel,
              letterSpacing: -0.1,
            ),
          ),
          const SizedBox(height: 8),
        ],
        Container(
          decoration: BoxDecoration(
            color: AppleColors.tertiarySystemFill,
            borderRadius: BorderRadius.circular(10),
          ),
          child: CupertinoTextField(
            controller: controller,
            placeholder: placeholder,
            obscureText: obscureText,
            keyboardType: keyboardType,
            maxLines: maxLines,
            maxLength: maxLength,
            onChanged: onChanged,
            readOnly: readOnly,
            onTap: onTap,
            autofocus: autofocus,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            style: const TextStyle(
              fontSize: 17,
              color: AppleColors.label,
              letterSpacing: -0.4,
            ),
            placeholderStyle: const TextStyle(
              fontSize: 17,
              color: AppleColors.tertiaryLabel,
              letterSpacing: -0.4,
            ),
            decoration: BoxDecoration(
              color: AppleColors.tertiarySystemFill,
              borderRadius: BorderRadius.circular(10),
            ),
            prefix: prefixIcon != null
                ? Padding(
              padding: const EdgeInsets.only(left: 12, right: 8),
              child: Icon(
                prefixIcon,
                color: AppleColors.secondaryLabel,
                size: 22,
              ),
            )
                : null,
            suffix: suffix,
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// APPLE iOS CARD
// ============================================================================

class AppleCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final double borderRadius;
  final VoidCallback? onTap;
  final bool hasShadow;

  const AppleCard({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderRadius = 12.0,
    this.onTap,
    this.hasShadow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppleColors.secondarySystemGroupedBackground,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: hasShadow
            ? [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
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
// APPLE iOS LIST TILE
// ============================================================================

class AppleListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? leadingIcon;
  final Color? leadingIconColor;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool showChevron;
  final bool showDivider;

  const AppleListTile({
    Key? key,
    required this.title,
    this.subtitle,
    this.leadingIcon,
    this.leadingIconColor,
    this.leading,
    this.trailing,
    this.onTap,
    this.showChevron = false,
    this.showDivider = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoListTile(
          onTap: onTap,
          leading: leading ??
              (leadingIcon != null
                  ? Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: (leadingIconColor ?? AppleColors.systemBlue)
                      .withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  leadingIcon,
                  color: leadingIconColor ?? AppleColors.systemBlue,
                  size: 20,
                ),
              )
                  : null),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: AppleColors.label,
              letterSpacing: -0.4,
            ),
          ),
          subtitle: subtitle != null
              ? Text(
            subtitle!,
            style: const TextStyle(
              fontSize: 15,
              color: AppleColors.secondaryLabel,
              letterSpacing: -0.2,
            ),
          )
              : null,
          trailing: trailing ??
              (showChevron
                  ? const Icon(
                CupertinoIcons.chevron_forward,
                color: AppleColors.systemGray3,
                size: 20,
              )
                  : null),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        if (showDivider)
          Container(
            height: 0.5,
            margin: const EdgeInsets.only(left: 60),
            color: AppleColors.separator,
          ),
      ],
    );
  }
}

// ============================================================================
// APPLE iOS SWITCH
// ============================================================================

class AppleSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color? activeColor;

  const AppleSwitch({
    Key? key,
    required this.value,
    this.onChanged,
    this.activeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
      activeColor: activeColor ?? AppleColors.systemGreen,
    );
  }
}

// ============================================================================
// APPLE iOS DIALOG
// ============================================================================

class AppleDialog {
  static Future<void> showAlert({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
    VoidCallback? onConfirm,
  }) async {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.4,
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 13,
                letterSpacing: -0.1,
              ),
            ),
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
                onConfirm?.call();
              },
              isDefaultAction: true,
              child: Text(confirmText ?? "OK"),
            ),
          ],
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
    bool isDestructive = false,
  }) async {
    return showCupertinoDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.4,
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 13,
                letterSpacing: -0.1,
              ),
            ),
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context, false),
              child: Text(cancelText ?? "Cancel"),
            ),
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context, true),
              isDestructiveAction: isDestructive,
              isDefaultAction: !isDestructive,
              child: Text(confirmText ?? "Confirm"),
            ),
          ],
        );
      },
    );
  }

  static void showActionSheet({
    required BuildContext context,
    required String title,
    String? message,
    required List<AppleActionSheetItem> actions,
    String? cancelText,
  }) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.1,
            ),
          ),
          message: message != null
              ? Text(
            message,
            style: const TextStyle(
              fontSize: 13,
              letterSpacing: -0.1,
            ),
          )
              : null,
          actions: actions
              .map((action) => CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              action.onPressed();
            },
            isDestructiveAction: action.isDestructive,
            isDefaultAction: action.isDefault,
            child: Text(action.text),
          ))
              .toList(),
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: Text(cancelText ?? "Cancel"),
          ),
        );
      },
    );
  }
}

class AppleActionSheetItem {
  final String text;
  final VoidCallback onPressed;
  final bool isDestructive;
  final bool isDefault;

  AppleActionSheetItem({
    required this.text,
    required this.onPressed,
    this.isDestructive = false,
    this.isDefault = false,
  });
}

// ============================================================================
// APPLE iOS BOTTOM SHEET
// ============================================================================

class AppleBottomSheet {
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    bool isDismissible = true,
    double? height,
  }) {
    return showCupertinoModalPopup<T>(
      context: context,
      builder: (context) => Container(
        height: height ?? MediaQuery.of(context).size.height * 0.6,
        decoration: const BoxDecoration(
          color: AppleColors.systemBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Column(
          children: [
            if (title != null) ...[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppleColors.separator,
                      width: 0.5,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 60),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.4,
                      ),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Done"),
                    ),
                  ],
                ),
              ),
            ],
            Expanded(
              child: SingleChildScrollView(
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// APPLE iOS SNACKBAR (BANNER)
// ============================================================================

class AppleBanner {
  static void show({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
    IconData? icon,
    Color? backgroundColor,
    VoidCallback? onTap,
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 10,
        left: 10,
        right: 10,
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () {
              overlayEntry.remove();
              onTap?.call();
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: backgroundColor ??
                    AppleColors.secondarySystemGroupedBackground,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  if (icon != null) ...[
                    Icon(icon, color: AppleColors.systemBlue, size: 24),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: Text(
                      message,
                      style: const TextStyle(
                        fontSize: 15,
                        color: AppleColors.label,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
    Future.delayed(duration, () {
      overlayEntry.remove();
    });
  }

  static void showSuccess({
    required BuildContext context,
    required String message,
  }) {
    show(
      context: context,
      message: message,
      icon: CupertinoIcons.check_mark_circled_solid,
      backgroundColor: AppleColors.systemGreen.withOpacity(0.1),
    );
  }

  static void showError({
    required BuildContext context,
    required String message,
  }) {
    show(
      context: context,
      message: message,
      icon: CupertinoIcons.xmark_circle_fill,
      backgroundColor: AppleColors.systemRed.withOpacity(0.1),
    );
  }
}

// ============================================================================
// APPLE iOS NAVIGATION BAR
// ============================================================================

class AppleNavBar extends StatelessWidget implements ObstructingPreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? trailing;
  final bool largeTitle;
  final Color? backgroundColor;

  const AppleNavBar({
    Key? key,
    required this.title,
    this.leading,
    this.trailing,
    this.largeTitle = false,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      middle: Text(
        title,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.4,
        ),
      ),
      leading: leading,
      trailing: trailing != null && trailing!.isNotEmpty
          ? Row(
        mainAxisSize: MainAxisSize.min,
        children: trailing!,
      )
          : null,
      backgroundColor: backgroundColor ?? AppleColors.systemBackground,
      border: const Border(
        bottom: BorderSide(
          color: AppleColors.separator,
          width: 0.5,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(44);

  @override
  bool shouldFullyObstruct(BuildContext context) => true;
}

// ============================================================================
// APPLE iOS LOADING INDICATOR
// ============================================================================

class AppleLoading extends StatelessWidget {
  final Color? color;
  final double radius;

  const AppleLoading({
    Key? key,
    this.color,
    this.radius = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: color ?? AppleColors.systemGray,
        radius: radius,
      ),
    );
  }
}

// ============================================================================
// APPLE iOS SEGMENTED CONTROL
// ============================================================================

// class AppleSegmentedControl<T extends Object> extends StatelessWidget {
//   final Map<T, Widget> children;
//   final T groupValue;
//   final ValueChanged<T>? onValueChanged;
//
//   const AppleSegmentedControl({
//     Key? key,
//     required this.children,
//     required this.groupValue,
//     this.onValueChanged,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoSlidingSegmentedControl<T>(
//       children: children,
//       groupValue: groupValue,
//       onValueChanged: onValueChanged,
//       backgroundColor: AppleColors.tertiarySystemFill,
//       thumbColor: AppleColors.systemBackground,
//     );
//   }
// }

// ============================================================================
// APPLE iOS PICKER
// ============================================================================

class ApplePicker {
  static Future<T?> show<T>({
    required BuildContext context,
    required List<T> items,
    required String Function(T) itemBuilder,
    T? initialItem,
    String? title,
  }) async {
    T? selectedItem = initialItem ?? items.first;

    return showCupertinoModalPopup<T>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          color: AppleColors.systemBackground,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppleColors.separator,
                      width: 0.5,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel"),
                    ),
                    if (title != null)
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.4,
                        ),
                      ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.pop(context, selectedItem),
                      child: const Text("Done"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 40,
                  onSelectedItemChanged: (index) {
                    selectedItem = items[index];
                  },
                  children: items
                      .map((item) => Center(
                    child: Text(
                      itemBuilder(item),
                      style: const TextStyle(
                        fontSize: 17,
                        letterSpacing: -0.4,
                      ),
                    ),
                  ))
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ============================================================================
// APPLE iOS SEARCH BAR
// ============================================================================

class AppleSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final Function(String)? onChanged;
  final VoidCallback? onCancel;
  final bool autofocus;
  final bool showCancel;

  const AppleSearchBar({
    Key? key,
    this.controller,
    this.placeholder,
    this.onChanged,
    this.onCancel,
    this.autofocus = false,
    this.showCancel = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 36,
            decoration: BoxDecoration(
              color: AppleColors.tertiarySystemFill,
              borderRadius: BorderRadius.circular(10),
            ),
            child: CupertinoTextField(
              controller: controller,
              autofocus: autofocus,
              onChanged: onChanged,
              placeholder: placeholder ?? "Search",
              placeholderStyle: const TextStyle(
                fontSize: 17,
                color: AppleColors.tertiaryLabel,
                letterSpacing: -0.4,
              ),
              style: const TextStyle(
                fontSize: 17,
                color: AppleColors.label,
                letterSpacing: -0.4,
              ),
              prefix: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(
                  CupertinoIcons.search,
                  color: AppleColors.secondaryLabel,
                  size: 20,
                ),
              ),
              suffix: controller?.text.isNotEmpty ?? false
                  ? CupertinoButton(
                padding: const EdgeInsets.only(right: 8),
                minSize: 0,
                onPressed: () {
                  controller?.clear();
                  onChanged?.call('');
                },
                child: const Icon(
                  CupertinoIcons.clear_thick_circled,
                  color: AppleColors.secondaryLabel,
                  size: 18,
                ),
              )
                  : null,
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            ),
          ),
        ),
        if (showCancel) ...[
          CupertinoButton(
            onPressed: onCancel,
            child: const Text("Cancel"),
          ),
        ],
      ],
    );
  }
}

// ============================================================================
// APPLE iOS TAB BAR
// ============================================================================

class AppleTabBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<AppleTabBarItem> items;
  final Color? activeColor;
  final Color? inactiveColor;

  const AppleTabBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.activeColor,
    this.inactiveColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
      currentIndex: currentIndex,
      onTap: onTap,
      activeColor: activeColor ?? AppleColors.systemBlue,
      inactiveColor: inactiveColor ?? AppleColors.systemGray,
      items: items
          .map((item) => BottomNavigationBarItem(
        icon: Icon(item.icon),
        activeIcon: Icon(item.activeIcon ?? item.icon),
        label: item.label,
      ))
          .toList(),
    );
  }
}

class AppleTabBarItem {
  final IconData icon;
  final IconData? activeIcon;
  final String label;

  AppleTabBarItem({
    required this.icon,
    this.activeIcon,
    required this.label,
  });
}

// ============================================================================
// APPLE iOS SLIDER
// ============================================================================

class AppleSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double>? onChanged;
  final double min;
  final double max;
  final Color? activeColor;

  const AppleSlider({
    Key? key,
    required this.value,
    this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.activeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSlider(
      value: value,
      onChanged: onChanged,
      min: min,
      max: max,
      activeColor: activeColor ?? AppleColors.systemBlue,
    );
  }
}

// ============================================================================
// UTILITY FUNCTIONS
// ============================================================================

class AppleUtils {
  // Navigation
  static void navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => screen),
    );
  }

  static void navigateReplacement(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => screen),
    );
  }

  static void navigateBack(BuildContext context, {dynamic result}) {
    Navigator.pop(context, result);
  }

  static void navigateClearStack(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(builder: (context) => screen),
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

  static EdgeInsets safeAreaPadding(BuildContext context) {
    return MediaQuery.of(context).padding;
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

  static void vibrateSelection() {
    HapticFeedback.selectionClick();
  }

  // System UI Configuration
  static void setLightStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  static void setDarkStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
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
// APPLE iOS CONTEXT MENU
// ============================================================================

class AppleContextMenu extends StatelessWidget {
  final Widget child;
  final List<AppleContextMenuAction> actions;

  const AppleContextMenu({
    Key? key,
    required this.child,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) {
            return CupertinoActionSheet(
              actions: actions
                  .map((action) => CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  action.onPressed();
                },
                isDestructiveAction: action.isDestructive,
                child: Row(
                  children: [
                    if (action.icon != null) ...[
                      Icon(action.icon, size: 20),
                      const SizedBox(width: 12),
                    ],
                    Text(action.text),
                  ],
                ),
              ))
                  .toList(),
              cancelButton: CupertinoActionSheetAction(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
            );
          },
        );
      },
      child: child,
    );
  }
}

class AppleContextMenuAction {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;
  final bool isDestructive;

  AppleContextMenuAction({
    required this.text,
    this.icon,
    required this.onPressed,
    this.isDestructive = false,
  });
}

// ============================================================================
// APPLE iOS BADGE
// ============================================================================

class AppleBadge extends StatelessWidget {
  final String? text;
  final Color? color;
  final Widget child;

  const AppleBadge({
    Key? key,
    this.text,
    this.color,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        if (text != null && text!.isNotEmpty)
          Positioned(
            right: -6,
            top: -6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: color ?? AppleColors.systemRed,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppleColors.systemBackground,
                  width: 2,
                ),
              ),
              constraints: const BoxConstraints(
                minWidth: 20,
                minHeight: 20,
              ),
              child: Center(
                child: Text(
                  text!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

// ============================================================================
// APPLE iOS DATE PICKER
// ============================================================================

class AppleDatePicker {
  static Future<DateTime?> show({
    required BuildContext context,
    DateTime? initialDateTime,
    DateTime? minimumDate,
    DateTime? maximumDate,
    CupertinoDatePickerMode mode = CupertinoDatePickerMode.date,
  }) async {
    DateTime? selectedDate = initialDateTime ?? DateTime.now();

    return showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          color: AppleColors.systemBackground,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppleColors.separator,
                      width: 0.5,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel"),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.pop(context, selectedDate),
                      child: const Text("Done"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: mode,
                  initialDateTime: initialDateTime ?? DateTime.now(),
                  minimumDate: minimumDate,
                  maximumDate: maximumDate,
                  onDateTimeChanged: (DateTime newDate) {
                    selectedDate = newDate;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ============================================================================
// APPLE iOS DIVIDER
// ============================================================================

class AppleDivider extends StatelessWidget {
  final double? height;
  final double? thickness;
  final Color? color;
  final double? indent;
  final double? endIndent;

  const AppleDivider({
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
      height: height ?? 0.5,
      thickness: thickness ?? 0.5,
      color: color ?? AppleColors.separator,
      indent: indent,
      endIndent: endIndent,
    );
  }
}