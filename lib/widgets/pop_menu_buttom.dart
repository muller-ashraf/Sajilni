import 'package:flutter/material.dart';
import 'package:sajilni/data/group_data_model.dart';
import 'package:sajilni/theme/app_colors.dart';
import 'package:sajilni/widgets/glass_card.dart';

class PopMenuButton extends StatefulWidget {
  const PopMenuButton({
    super.key,
    required this.groups,
    required this.onChanged,
  });

  final List<GroupData> groups;
  final ValueChanged<GroupData> onChanged;

  @override
  State<PopMenuButton> createState() => _PopMenuButtonState();
}

class _PopMenuButtonState extends State<PopMenuButton> {
  GroupData? selectedGroup;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<GroupData>(
      onSelected: (group) {
        setState(() {
          selectedGroup = group;
        });
        widget.onChanged(group);
      },
      color: AppColors.cardSolid,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      itemBuilder: (context) {
        return widget.groups.map((group) {
          return PopupMenuItem<GroupData>(
            value: group,
            height: 48,
            child: Row(
              children: [
                const Icon(
                  Icons.groups_rounded,
                  size: 20,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 10),
                Text(
                  group.groupName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }).toList();
      },
      child: GlassCard(
        child: SizedBox(
          height: 50,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Text(
                  selectedGroup?.groupName ?? "اختار اسم المجموعة",
                  style: TextStyle(
                    color: selectedGroup == null
                        ? AppColors.textSecondary
                        : AppColors.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(Icons.keyboard_arrow_down_rounded),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
