import 'package:flutter/material.dart';
import 'package:sajilni/data/student_data_model.dart';
import 'package:sajilni/theme/app_colors.dart';
import 'package:sajilni/widgets/glass_card.dart';
import 'package:sajilni/widgets/show_dialog_method.dart';

class GroupDetailesScreen extends StatelessWidget {
  const GroupDetailesScreen({
    super.key,
    required this.studentData,
    required this.groupName,
  });
  final List<StudentData> studentData;
  final String groupName;
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add),
        onPressed: () {
          showDialogMethod(
            context,
            title: 'اضافة طالب',
            content: 'ادخل اسم الطالب',
          );
        },
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 12,
          children: [
            const SizedBox(height: 12),
            Column(
              children: [
                Text(
                  "الطلاب الموجودين في",
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  groupName,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemCount: studentData.length,
              itemBuilder: (context, index) {
                return StudentInfo(studentData: studentData[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class StudentInfo extends StatelessWidget {
  const StudentInfo({super.key, required this.studentData});
  final StudentData studentData;
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
                  studentData.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.fingerprint,
                      size: 14,
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(width: 4),
                    Text(
                      studentData.id,
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.school_outlined,
                      size: 14,
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(width: 4),
                    Text(
                      studentData.cityName,
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
