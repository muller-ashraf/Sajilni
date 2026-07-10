import 'package:flutter/material.dart';
import 'package:sajilni/theme/app_colors.dart';
import 'package:sajilni/widgets/glass_card.dart';
import 'package:sajilni/widgets/primary_buttom.dart';
import 'package:sajilni/widgets/show_dialog_method.dart';

class GroupDetailesScreen extends StatelessWidget {
  const GroupDetailesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xCC0E1511),
        title: const Text(
          'تفاصيل المجموعة',
          style: TextStyle(
            color: AppColors.primaryLight,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: PrimaryButton(
        color: AppColors.primary,
        label: 'اضافة طالب جديد',
        icon: Icons.add,
        onPressed: () {
          showDialogMethod(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 12,
          children: [
            const SizedBox(height: 12),

            Text(
              "الطلاب الموجودين في هذه المجموعة ",
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            StudentInfo(name: 'mando', id: '01233333', groupName: 'A'),

            StudentInfo(name: 'muller', id: '01233333', groupName: 'A'),

            StudentInfo(name: 'marvel', id: '01233333', groupName: 'A'),

            StudentInfo(name: 'ashraf', id: '01233333', groupName: 'A'),
          ],
        ),
      ),
    );
  }
}

class StudentInfo extends StatelessWidget {
  const StudentInfo({
    super.key,
    required this.name,
    required this.id,
    required this.groupName,
  });
  final String name;
  final String id;
  final String groupName;
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      accentBorder: AppColors.primary,
      accentWidth: 4,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primaryLight, width: 2),
                ),
                child: const Icon(
                  Icons.person,
                  size: 40,
                  color: AppColors.primaryLight,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.fingerprint,
                      size: 14,
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "01233333",
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.school_outlined,
                      size: 14,
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'الصف العاشر - المجموعة أ',
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
