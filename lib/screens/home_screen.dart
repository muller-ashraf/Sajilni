import 'package:flutter/material.dart';
import 'package:sajilni/screens/main_shell.dart';
import 'package:sajilni/theme/app_colors.dart';
import 'package:sajilni/widgets/app_drawer.dart';
import 'package:sajilni/widgets/group_card_home_screen_item.dart';
import 'package:sajilni/widgets/primary_buttom.dart';
import 'package:sajilni/widgets/show_dialog_method.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      title: 'Muller Sajilni',
      drawerStyle: DrawerStyle.dashboard,
      drawerActiveIndex: 0,
      leading: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.border),
        ),
        child: const Icon(
          Icons.person,
          size: 18,
          color: AppColors.textSecondary,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'صباح الخير،',
                style: TextStyle(color: AppColors.textSecondary),
              ),
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'أهلاً بك مجدداً',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              label: 'إضافة مجموعة جديدة',
              color: AppColors.primary,
              icon: Icons.add_rounded,
              onPressed: () {
                showDialogMethod(context);
              },
            ),
            const SizedBox(height: 24),

            const SizedBox(height: 24),
            const Text(
              'المجموعات المسجلة',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemCount: 5,
              itemBuilder: (context, index) {
                return GroupCard(
                  name: 'مجموعة مدرسة ${index + 1}',
                  updated: 'تحديث منذ يوم',
                  students: '32 طلاب',
                  attendance: '95% الحضور',
                  homework: '91% الواجبات',
                );
              },
            ),
          ],
        ),
      ),
    );
  }

}
