import 'package:flutter/material.dart';
import 'package:sajilni/repositories/group_repository.dart';
import 'package:sajilni/screens/main_shell.dart';
import 'package:sajilni/theme/app_colors.dart';
import 'package:sajilni/widgets/app_drawer.dart';
import 'package:sajilni/widgets/group_card_home_screen_item.dart';
import 'package:sajilni/widgets/primary_buttom.dart';
import 'package:sajilni/widgets/show_dialog_method.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    final groupNameController = TextEditingController();
    final repository = GroupRepository(supabase);
    return ScreenScaffold(
      title: 'Muller Sajilni',
      drawerStyle: DrawerStyle.dashboard,
      drawerActiveIndex: 0,
      leading: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.border),
        ),
        child: const Icon(
          Icons.person,
          size: 18,
          color: AppColors.textSecondary,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'صباح الخير،',
                style: TextStyle(color: AppColors.textSecondary),
              ),
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'أهلاً بك مجدداً',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              label: 'إضافة مجموعة جديدة',
              color: AppColors.primary,
              icon: Icons.add_rounded,
              onPressed: () {
                showDialogMethod(
                  context,
                  title: 'إضافة مجموعة جديدة',
                  
                 fields: [
                    TextField(
                      controller: groupNameController,
                      decoration: const InputDecoration(hintText: 'اسم المجموعة'),
                    ),
                  ],

                  onPressed: () async {
                    if (groupNameController.text.trim().isEmpty) {
                      return;
                    }

                    await supabase.from('groups').insert({
                      'name': groupNameController.text.trim(),
                    });

                    Navigator.pop(context);

                    groupNameController.clear();
                  },
                );
              },
            ),
            const SizedBox(height: 24),

            const SizedBox(height: 24),
            const Text(
              'المجموعات المسجلة',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),
           FutureBuilder(
  future: repository.getGroups(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    }

    final groups = snapshot.data ?? [];

    if (groups.isEmpty) {
      return const Text('لا توجد مجموعات حتى الآن');
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemCount: groups.length,
      itemBuilder: (context, index) {
        return GroupCard(group: groups[index]);
      },
    );
  },
),
          ],
        ),
      ),
    );
  }
}
