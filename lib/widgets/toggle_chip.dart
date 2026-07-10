
import 'package:flutter/material.dart';
import 'package:sajilni/theme/app_colors.dart';

class ToggleChip extends StatelessWidget {
  const ToggleChip({
    super.key,
    required this.label,
    required this.icon,
    required this.selected,
    required this.selectedColor,
    required this.onTap,
    this.outlined = false,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final Color selectedColor;
  final VoidCallback onTap;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    final bg = selected
        ? (outlined ? selectedColor.withValues(alpha: 0.15) : selectedColor)
        : AppColors.cardSolid;
    final fg = selected
        ? (outlined ? selectedColor : AppColors.primaryDark)
        : AppColors.textSecondary;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(8),
          border: outlined
              ? Border.all(color: selected ? selectedColor : AppColors.border)
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 16, color: fg),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(color: fg, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
