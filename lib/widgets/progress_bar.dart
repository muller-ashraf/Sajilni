import 'package:flutter/material.dart';
import 'package:sajilni/theme/app_colors.dart';

class MiniProgressBar extends StatelessWidget {
  const MiniProgressBar({
    super.key,
    required this.value,
    this.color = AppColors.primaryLight,
    this.width = 64,
  });

  final double value;
  final Color color;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 6,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(999),
        child: Stack(
          children: [
            const ColoredBox(color: AppColors.borderMuted),
            FractionallySizedBox(
              widthFactor: value.clamp(0, 1),
              child: ColoredBox(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
