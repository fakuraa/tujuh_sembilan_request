import 'package:flutter/material.dart';

class CustomCarouselButton extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final VoidCallback onPressed;

  const CustomCarouselButton({
    super.key,
    required this.title,
    required this.titleColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: titleColor,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final Color? backgroundColor;
  final Widget? icon;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.titleColor,
    this.backgroundColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: backgroundColor ?? Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: icon != null,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon ?? const SizedBox.shrink(),
                const SizedBox(width: 8),
              ],
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: titleColor ?? Theme.of(context).colorScheme.surface,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
