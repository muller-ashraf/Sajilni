import 'package:flutter/material.dart';
import 'package:sajilni/model/student_model.dart';
import 'package:sajilni/repositories/student_repository.dart';
import 'package:sajilni/theme/app_colors.dart';
import 'package:sajilni/widgets/glass_card.dart';
import 'package:sajilni/widgets/show_dialog_method.dart';

class GroupDetailesScreen extends StatelessWidget {
  GroupDetailesScreen({
    super.key,
    required this.studentData,
    required this.groupName,
    required this.groupId,
  });

  final List<StudentModel> studentData;
  final String groupName;
  final int groupId;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

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
            title: 'إضافة طالب',

            fields: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: 'اسم الطالب'),
              ),

              TextField(
                controller: mobileController,
                decoration: const InputDecoration(hintText: 'رقم الهاتف'),
              ),

              TextField(
                controller: locationController,
                decoration: const InputDecoration(hintText: 'المكان'),
              ),
            ],
            onPressed: () async {
              await StudentRepository().addStudent(
                groupId: groupId,
                name: nameController.text,
                mobile: mobileController.text,
                location: locationController.text,
              );

              Navigator.pop(context);
            },
          );
        },
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          const SizedBox(height: 12),

          Column(
            children: [
              Text(
                groupName,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                'العدد : ${studentData.length}',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          if (studentData.isEmpty)
            const Center(
              child: Text(
                'لا يوجد طلاب في هذه المجموعة',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          ...studentData.map(
            (student) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: StudentInfo(studentData: student),
            ),
          ),
        ],
      ),
    );
  }
}

class StudentInfo extends StatelessWidget {
  const StudentInfo({super.key, required this.studentData});

  final StudentModel studentData;

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
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Row(
                  children: [
                    const Icon(
                      Icons.phone_android_outlined,
                      size: 14,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      studentData.mobile?.toString() ?? "غير محدد",
                      style: const TextStyle(color: AppColors.textSecondary),
                    ),
                  ],
                ),

                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      studentData.location ?? "غير محدد",
                      style: const TextStyle(color: AppColors.textSecondary),
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
