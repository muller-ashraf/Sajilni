import 'package:flutter/material.dart';
import 'package:sajilni/screens/main_shell.dart';
import 'package:sajilni/theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      title: 'الملف الشخصي',
      drawerActiveIndex: 3,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Text(
                'م',
                style: TextStyle(
                  color: AppColors.primaryDark,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('المسؤول', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Text('مكتب المدير', style: TextStyle(color: AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }
}
