import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppButtonType { elevated, outlined, text }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final AppButtonType type;
  final IconData? icon;
  final bool fullWidth;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.type = AppButtonType.elevated,
    this.icon,
    this.fullWidth = true,
  });
  @override
  Widget build(BuildContext context) {
    final style = customButtonStyle(context, type);
    final Widget content = Row(
      mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[Icon(icon, size: 18), const SizedBox(width: 8)],
        Text(label, style: GoogleFonts.cairo(fontWeight: FontWeight.bold)),
      ],
    );

    switch (type) {
      case AppButtonType.outlined:
        return OutlinedButton(
          onPressed: onPressed,
          style: style,
          child: content,
        );
      case AppButtonType.text:
        return TextButton(onPressed: onPressed, style: style, child: content);
      case AppButtonType.elevated:
        return ElevatedButton(
          onPressed: onPressed,
          style: style,
          child: content,
        );
    }
  }
}

ButtonStyle customButtonStyle(BuildContext context, AppButtonType type) {
  final scheme = Theme.of(context).colorScheme;

  switch (type) {
    case AppButtonType.elevated:
      return ElevatedButton.styleFrom(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        shadowColor: scheme.shadow,
        elevation: 4,
      );
    case AppButtonType.outlined:
      return OutlinedButton.styleFrom(
        foregroundColor: scheme.secondary,
        side: BorderSide(color: scheme.secondary, width: 1.5),
      );
    case AppButtonType.text:
      return TextButton.styleFrom(foregroundColor: scheme.tertiary);
  }
}
