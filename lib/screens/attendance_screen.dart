import 'package:flutter/material.dart';
import 'package:sajilni/data/student_data_model.dart';
import 'package:sajilni/screens/main_shell.dart';
import 'package:sajilni/theme/app_colors.dart';
import 'package:sajilni/widgets/app_drawer.dart';
import 'package:sajilni/widgets/data_card.dart';
import 'package:sajilni/widgets/primary_buttom.dart';
import 'package:sajilni/widgets/student_attendance_card.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final _students = [
    StudentData('أليكس جونسون', '#STU-9402'),
    StudentData('سارة محمد', '#STU-9403'),
    StudentData('عمر حسن', '#STU-9404'),
    StudentData('ليلى أحمد', '#STU-9405'),
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      title: 'إدارة التعليم',
      drawerStyle: DrawerStyle.attendance,
      drawerActiveIndex: 1,
      floatingAction: PrimaryButton(
        color: Colors.blue,
        label: 'إرسال سجل اليوم',
        icon: Icons.send_rounded,
        onPressed: () {},
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
        children: [
          DateCard(),
          const SizedBox(height: 16),
          // leave search after end with api
          TextField(
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: 'ابحث عن اسم الطالب...',
              hintStyle: const TextStyle(color: AppColors.textMuted),
              filled: true,
              fillColor: AppColors.cardSolid,
              prefixIcon: const Icon(
                Icons.search,
                color: AppColors.textSecondary,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.border),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              'مجموعة المدرسة أ',
              style: TextStyle(
                color: AppColors.primaryLight,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Text(
            '٢٤ طالب مسجلون',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 15),
          ),
          const SizedBox(height: 16),
          ...List.generate(_students.length, (index) {
            final student = _students[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: StudentAttendanceCard(
                student: student,
                onChanged: () => setState(() {}),
              ),
            );
          }),
        ],
      ),
    );
  }
}
