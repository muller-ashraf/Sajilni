import 'package:flutter/material.dart';
import 'package:sajilni/theme/app_colors.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(17),
    this.borderColor = AppColors.borderMuted,
    this.accentBorder,
    this.accentWidth = 4,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color borderColor;
  final Color? accentBorder;
  final double accentWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Padding(padding: padding, child: child),
            if (accentBorder != null)
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  width: accentWidth,
                  color: accentBorder,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
