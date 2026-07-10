import 'package:flutter/material.dart';
import 'package:sajilni/screens/main_shell.dart';
import 'package:sajilni/screens/student_report_screen.dart';
import 'package:sajilni/theme/app_colors.dart';
import 'package:sajilni/widgets/glass_card.dart';
import 'package:sajilni/widgets/progress_bar.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  static const _students = [
    _StudentRecord(
      name: 'أليكس ريفرز',
      id: '#44092',
      attendance: 14,
      attendanceTotal: 15,
      homework: 12,
      homeworkTotal: 15,
      active: true,
    ),
    _StudentRecord(
      name: 'سارة كول',
      id: '#44093',
      attendance: 11,
      attendanceTotal: 15,
      homework: 10,
      homeworkTotal: 15,
      active: false,
    ),
    _StudentRecord(
      name: 'محمد علي',
      id: '#44094',
      attendance: 13,
      attendanceTotal: 15,
      homework: 14,
      homeworkTotal: 15,
      active: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      title: 'EduManage',
      drawerActiveIndex: 2,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
        children: [
          TextField(
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: 'ابحث عن اسم الطالب...',
              hintStyle: const TextStyle(color: AppColors.textMuted),
              filled: true,
              fillColor: AppColors.cardSolid,
              prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                borderSide: const BorderSide(color: AppColors.border),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.cardSolid,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.expand_more, color: AppColors.textSecondary, size: 16),
                  SizedBox(width: 8),
                  Text('اختر المجموعة', style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: const [
              Expanded(child: _ReportStatCard(label: 'الواجبات', value: '88%', color: AppColors.salmon)),
              SizedBox(width: 12),
              Expanded(child: _ReportStatCard(label: 'متوسط الحضور', value: '94%', color: AppColors.primaryLight)),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.arrow_back_ios_new, size: 12, color: AppColors.primaryLight),
                    SizedBox(width: 4),
                    Text('عرض الكل', style: TextStyle(color: AppColors.primaryLight)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text('سجلات الطلاب', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  Text(
                    '24 طلاب نشطون في الصف العاشر - أ',
                    style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          ..._students.map((student) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _StudentRecordCard(
                student: student,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => StudentReportScreen(studentName: student.name, studentId: student.id),
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _StudentRecord {
  const _StudentRecord({
    required this.name,
    required this.id,
    required this.attendance,
    required this.attendanceTotal,
    required this.homework,
    required this.homeworkTotal,
    required this.active,
  });

  final String name;
  final String id;
  final int attendance;
  final int attendanceTotal;
  final int homework;
  final int homeworkTotal;
  final bool active;
}

class _ReportStatCard extends StatelessWidget {
  const _ReportStatCard({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(color: color, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _StudentRecordCard extends StatelessWidget {
  const _StudentRecordCard({
    required this.student,
    required this.onTap,
  });

  final _StudentRecord student;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final accent = student.active ? AppColors.primary : AppColors.salmon;
    final homeworkColor = student.active ? AppColors.blue : AppColors.salmon;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: GlassCard(
        accentBorder: accent,
        accentWidth: 4,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    MiniProgressBar(
                      value: student.attendance / student.attendanceTotal,
                      color: accent,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'حضور: ${student.attendance}/${student.attendanceTotal}',
                      style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    MiniProgressBar(
                      value: student.homework / student.homeworkTotal,
                      color: homeworkColor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'واجب: ${student.homework}/${student.homeworkTotal}',
                      style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Icon(Icons.history, size: 18, color: AppColors.textSecondary.withValues(alpha: 0.7)),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(student.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(student.id, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.presentBg,
                  child: Icon(Icons.person, color: accent),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: accent,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.background, width: 2),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
