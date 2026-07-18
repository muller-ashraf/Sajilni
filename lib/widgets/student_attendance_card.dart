import 'package:flutter/material.dart';
import 'package:sajilni/data/student_data_model.dart';
import 'package:sajilni/theme/app_colors.dart';
import 'package:sajilni/widgets/glass_card.dart';
import 'package:sajilni/widgets/toggle_chip.dart';

class StudentAttendanceCard extends StatelessWidget {
  const StudentAttendanceCard({
    super.key,
    required this.student,
    required this.onChanged,
  });

  final StudentData student;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.presentBg,
                child: Icon(Icons.person, color: AppColors.primaryLight),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      student.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'الحضور',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: ToggleChip(
                  label: 'غائب',
                  icon: Icons.block,
                  selected: !student.present,
                  selectedColor: AppColors.absent,
                  onTap: () {
                    student.present = false;
                    onChanged();
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ToggleChip(
                  label: 'حاضر',
                  icon: Icons.check_circle_outline,
                  selected: student.present,
                  selectedColor: AppColors.primary,
                  onTap: () {
                    student.present = true;
                    onChanged();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'الواجبات',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: ToggleChip(
                  label: 'لم يتم',
                  icon: Icons.close,
                  selected: !student.homeworkDone,
                  selectedColor: AppColors.absent,
                  outlined: true,
                  onTap: () {
                    student.homeworkDone = false;
                    onChanged();
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ToggleChip(
                  label: 'تم',
                  icon: Icons.check,
                  selected: student.homeworkDone,
                  selectedColor: AppColors.primaryLight,
                  outlined: true,
                  onTap: () {
                    student.homeworkDone = true;
                    onChanged();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
