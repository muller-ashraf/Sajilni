import 'package:flutter/material.dart';
import 'package:sajilni/screens/group_detailes_screen.dart';
import 'package:sajilni/theme/app_colors.dart';
import 'package:sajilni/widgets/glass_card.dart';

class GroupCard extends StatelessWidget {
  const GroupCard({
    super.key,
    required this.name,
    required this.updated,
    required this.students,
    required this.attendance,
    required this.homework,
  });

  final String name;
  final String updated;
  final String students;
  final String attendance;
  final String homework;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const GroupDetailesScreen()),
      ),
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
                  name,
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
                        final controller = TextEditingController(text: name);

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
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  updated,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(
                  Icons.calendar_today,
                  size: 14,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(color: AppColors.borderMuted, height: 1),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _MetricCell(homework)),
                _divider(),
                Expanded(child: _MetricCell(attendance)),
                _divider(),
                Expanded(child: _MetricCell(students)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider() =>
      Container(width: 1, height: 32, color: AppColors.borderMuted);
}

class _MetricCell extends StatelessWidget {
  const _MetricCell(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
    );
  }
}
