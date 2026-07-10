import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sajilni/theme/app_colors.dart';
import 'package:sajilni/widgets/glass_card.dart';

class DateCard extends StatefulWidget {
  const DateCard({super.key});

  @override
  State<DateCard> createState() => _DateCardState();
}

class _DateCardState extends State<DateCard> {
  DateTime selectedDate = DateTime.now();

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      locale: const Locale('ar'),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('d MMMM yyyy', 'ar').format(selectedDate);

    final dayName = DateFormat('EEEE', 'ar').format(selectedDate);

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: _pickDate,
      child: GlassCard(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'التاريخ المختار',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.expand_more, color: AppColors.textSecondary),
                Column(
                  spacing: 10,
                  children: [
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      dayName,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const Icon(Icons.calendar_month, color: AppColors.primaryLight),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
