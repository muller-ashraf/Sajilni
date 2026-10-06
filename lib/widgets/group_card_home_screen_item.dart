import 'package:flutter/material.dart';
import 'package:sajilni/model/groups_model.dart';
import 'package:sajilni/model/student_model.dart';
import 'package:sajilni/repositories/student_repository.dart';
import 'package:sajilni/screens/group_detailes_screen.dart';
import 'package:sajilni/theme/app_colors.dart';
import 'package:sajilni/widgets/glass_card.dart';

class GroupCard extends StatelessWidget {
  const GroupCard({super.key, required this.group});

  final GroupsModel group;

  @override
  Widget build(BuildContext context) {
    final StudentRepository studentRepository = StudentRepository();
     List<StudentModel> studentData =[];
    return GestureDetector(
      onTap: () async{
        studentData = await studentRepository.getStudentsByGroup(group.id);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GroupDetailesScreen(
              groupName: group.name,
              studentData: studentData,
            ),
          ),
        );
      },
      child: GlassCard(
        accentBorder: AppColors.primary,
        accentWidth: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  group.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                PopupMenuButton<String>(
                  icon: const Icon(
                    Icons.more_vert,
                    color: AppColors.textSecondary,
                  ),
                  onSelected: (value) async {
                    switch (value) {
                      case 'edit':
                        final controller = TextEditingController(
                          text: group.name,
                        );

                        final newName = await showDialog<String>(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("تعديل اسم المجموعة"),
                              content: TextField(
                                controller: controller,
                                autofocus: true,
                                decoration: const InputDecoration(
                                  hintText: "اسم المجموعة",
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("إلغاء"),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(
                                      context,
                                      controller.text.trim(),
                                    );
                                  },
                                  child: const Text("حفظ"),
                                ),
                              ],
                            );
                          },
                        );

                        if (newName != null && newName.isNotEmpty) {
                          // استدعاء الـ API أو الـ Cubit
                          print(newName);
                        }

                        break;

                      case 'delete':
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("حذف المجموعة"),
                            content: const Text(
                              "هل أنت متأكد من حذف هذه المجموعة؟",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text("إلغاء"),
                              ),
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text("حذف"),
                              ),
                            ],
                          ),
                        );

                        if (confirm == true) {
                          // استدعاء API أو Cubit
                        }
                        break;
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem<String>(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(Icons.edit_outlined),
                          SizedBox(width: 8),
                          Text('تعديل'),
                        ],
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete_outline, color: Colors.red),
                          SizedBox(width: 8),
                          Text('حذف', style: TextStyle(color: Colors.red)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),
            const Divider(color: AppColors.borderMuted, height: 1),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _MetricCell(studentData.length.toString())),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricCell extends StatelessWidget {
  const _MetricCell(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      " عدد الطلاب  $text",
      textAlign: TextAlign.center,
      style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
    );
  }
}
