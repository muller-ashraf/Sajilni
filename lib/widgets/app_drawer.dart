import 'package:flutter/material.dart';
import 'package:sajilni/theme/app_colors.dart';

enum DrawerStyle { dashboard, attendance }

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    required this.style,
    required this.activeIndex,
    this.onItemTap,
  });

  final DrawerStyle style;
  final int activeIndex;
  final ValueChanged<int>? onItemTap;

  @override
  Widget build(BuildContext context) {
    final items = style == DrawerStyle.dashboard
        ? const [
            ('الرئيسية', Icons.dashboard_rounded),
            ('المجموعات', Icons.groups_rounded),
            ('التقارير', Icons.bar_chart_rounded),
            ('الملف الشخصي', Icons.person_rounded),
          ]
        : const [
            ('لوحة القيادة', Icons.dashboard_rounded),
            ('الحضور', Icons.calendar_month_rounded),
            ('الأداء', Icons.trending_up_rounded),
            ('الإعدادات', Icons.settings_rounded),
          ];

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 48, 24, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (style == DrawerStyle.dashboard) ...[
                  Container(
                    width: 48,
                    height: 48,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      'م',
                      style: TextStyle(
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'المسؤول',
                    style: TextStyle(
                      color: AppColors.primaryLight,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'مكتب المدير',
                    style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
                  ),
                ] else ...[
                  const Text(
                    'إدارة التعليم',
                    style: TextStyle(
                      color: AppColors.primaryLight,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            'مستخدم مسؤول',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'مكتب المدير',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.presentBg,
                        child: Icon(Icons.person, color: AppColors.primaryLight),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final (label, icon) = items[index];
                final selected = index == activeIndex;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999),
                    ),
                    tileColor: selected ? AppColors.primary : null,
                    leading: Icon(
                      icon,
                      color: selected ? AppColors.primaryDark : AppColors.textSecondary,
                      size: 20,
                    ),
                    title: Text(
                      label,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: selected ? AppColors.primaryDark : AppColors.textSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      onItemTap?.call(index);
                    },
                  ),
                );
              },
            ),
          ),
          const Divider(color: AppColors.border),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'v1.2.0',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
