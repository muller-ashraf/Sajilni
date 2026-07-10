import 'package:flutter/material.dart';
import 'package:sajilni/theme/app_colors.dart';

enum AppTab { home, groups, reports, profile }

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.current,
    required this.onChanged,
  });

  final AppTab current;
  final ValueChanged<AppTab> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xCC0E1511),
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                icon: Icons.home_rounded,
                label: 'الرئيسية',
                selected: current == AppTab.home,
                onTap: () => onChanged(AppTab.home),
              ),
              _NavItem(
                icon: Icons.groups_rounded,
                label: 'تسجيل الحضور',
                selected: current == AppTab.groups,
                onTap: () => onChanged(AppTab.groups),
              ),
              _NavItem(
                icon: Icons.bar_chart_rounded,
                label: 'التقارير',
                selected: current == AppTab.reports,
                onTap: () => onChanged(AppTab.reports),
              ),
              _NavItem(
                icon: Icons.person_rounded,
                label: 'الملف الشخصي',
                selected: current == AppTab.profile,
                onTap: () => onChanged(AppTab.profile),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.primaryLight : AppColors.textSecondary;

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 48,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 20, color: color),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 13,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 6,
                child: selected
                    ? Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
