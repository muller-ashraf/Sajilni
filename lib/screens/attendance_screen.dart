import 'package:flutter/material.dart';
import 'package:sajilni/data/group_data_model.dart';
import 'package:sajilni/screens/main_shell.dart';
import 'package:sajilni/theme/app_colors.dart';
import 'package:sajilni/widgets/app_drawer.dart';
import 'package:sajilni/widgets/data_card.dart';
import 'package:sajilni/widgets/pop_menu_buttom.dart';
import 'package:sajilni/widgets/primary_buttom.dart';
import 'package:sajilni/widgets/student_attendance_card.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  GroupData? selectedGroup;

  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      title: 'الحضور والغياب',
      drawerStyle: DrawerStyle.attendance,
      drawerActiveIndex: 1,
      floatingAction: PrimaryButton(
        color: Colors.blue,
        label: 'حفظ سجل اليوم',
        icon: Icons.send_rounded,
        onPressed: () {},
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
        children: [
          PopMenuButton(
            groups: groupsTest,
            onChanged: (group) => setState(() => selectedGroup = group),
          ),
          const SizedBox(height: 16),
          DateCard(),
          const SizedBox(height: 16),
          // leave search after end with api
          // TextField(
          //   textAlign: TextAlign.right,
          //   decoration: InputDecoration(
          //     hintText: 'ابحث عن اسم الطالب...',
          //     hintStyle: const TextStyle(color: AppColors.textMuted),
          //     filled: true,
          //     fillColor: AppColors.cardSolid,
          //     prefixIcon: const Icon(
          //       Icons.search,
          //       color: AppColors.textSecondary,
          //     ),
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(8),
          //       borderSide: const BorderSide(color: AppColors.border),
          //     ),
          //     enabledBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(8),
          //       borderSide: const BorderSide(color: AppColors.border),
          //     ),
          //   ),
          // ),
          const SizedBox(height: 20),
          if (selectedGroup != null) ...[
            Center(
              child: Text(
                selectedGroup!.groupName,
                style: TextStyle(
                  color: AppColors.primaryLight,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Text(
              '${selectedGroup!.student.length}  مسجلون',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 15),
            ),
            const SizedBox(height: 16),
            ...List.generate(selectedGroup!.student.length, (index) {
              final student = selectedGroup!.student[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: StudentAttendanceCard(
                  student: student,
                  onChanged: () => setState(() {}),
                ),
              );
            }),
          ],
        ],
      ),
    );
  }
}
