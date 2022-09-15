import 'package:flutter/material.dart';
import 'package:simple_hive_note/core/utils/theme/app_theme.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        constraints: const BoxConstraints(minWidth: 40),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade600,
        ),
        child: Theme(
          data: AppTheme.dark,
          child: child,
        ),
      ),
    );
  }
}
