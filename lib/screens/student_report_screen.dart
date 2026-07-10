import 'package:flutter/material.dart';
import 'package:sajilni/theme/app_colors.dart';
import 'package:sajilni/widgets/app_bottom_nav.dart';
import 'package:sajilni/widgets/glass_card.dart';

class StudentReportScreen extends StatelessWidget {
  const StudentReportScreen({
    super.key,
    required this.studentName,
    required this.studentId,
  });

  final String studentName;
  final String studentId;

  static const _history = [
    _HistoryEntry(
      '24 أكتوبر 2023',
      'يوم الثلاثاء - الحصة الرابعة',
      present: true,
      homeworkDone: true,
    ),
    _HistoryEntry(
      '23 أكتوبر 2023',
      'يوم الاثنين - الحصة الثالثة',
      present: true,
      homeworkDone: false,
    ),
    _HistoryEntry(
      '22 أكتوبر 2023',
      'يوم الأحد - الحصة الثانية',
      present: false,
      homeworkDone: false,
    ),
  ];



  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: const Color(0xCC0E1511),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_forward,
              color: AppColors.primaryLight,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'تقرير الطالب التفصيلي',
            style: TextStyle(
              color: AppColors.primaryLight,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.share_outlined,
                color: AppColors.primaryLight,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
          children: [
            GlassCard(
              accentBorder: AppColors.primary,
              accentWidth: 4,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          studentName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              studentId,
                              style: const TextStyle(
                                color: AppColors.textSecondary,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.fingerprint,
                              size: 14,
                              color: AppColors.textSecondary,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              'الصف العاشر - المجموعة أ',
                              style: TextStyle(color: AppColors.textSecondary),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.school_outlined,
                              size: 14,
                              color: AppColors.textSecondary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primaryLight,
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 40,
                          color: AppColors.primaryLight,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: const Text(
                            'نشط',
                            style: TextStyle(
                              color: AppColors.primaryDark,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: const [
                Expanded(
                  child: _SummaryCard(
                    title: 'إنجاز الواجبات',
                    value: '٩٢٪',
                    progress: 0.92,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: _SummaryCard(
                    title: 'نسبة الحضور',
                    value: '٩٨٪',
                    progress: 0.98,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.filter_list,
                    size: 16,
                    color: AppColors.primaryLight,
                  ),
                  label: const Text(
                    'فلترة',
                    style: TextStyle(color: AppColors.primaryLight),
                  ),
                ),
                const Text(
                  'سجل المتابعة التاريخي',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ..._history.map(
              (entry) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _HistoryCard(entry: entry),
              ),
            ),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(12),
              child: GlassCard(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: const Center(
                  child: Text(
                    'عرض المزيد من السجلات',
                    style: TextStyle(color: AppColors.primaryLight),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            
          ],
        ),
        bottomNavigationBar: AppBottomNav(
          current: AppTab.reports,
          onChanged: (_) =>
              Navigator.popUntil(context, (route) => route.isFirst),
        ),
      ),
    );
  }
}

class _HistoryEntry {
  const _HistoryEntry(
    this.date,
    this.subtitle, {
    required this.present,
    required this.homeworkDone,
  });
  final String date;
  final String subtitle;
  final bool present;
  final bool homeworkDone;
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.title,
    required this.value,
    required this.progress,
  });

  final String title;
  final String value;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      accentBorder: AppColors.primary,
      child: Column(
        children: [
          Icon(
            Icons.insights,
            color: AppColors.primaryLight.withValues(alpha: 0.8),
            size: 36,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.primaryLight,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: AppColors.surface,
              color: AppColors.primaryLight,
            ),
          ),
        ],
      ),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  const _HistoryCard({required this.entry});
  final _HistoryEntry entry;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _StatusBadge(
                label: entry.homeworkDone ? 'تم الواجب' : 'لم يتم',
                positive: entry.homeworkDone,
              ),
              const SizedBox(width: 8),
              _StatusBadge(
                label: entry.present ? 'حاضر' : 'غائب',
                positive: entry.present,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                entry.date,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                entry.subtitle,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.label, required this.positive});

  final String label;
  final bool positive;

  @override
  Widget build(BuildContext context) {
    final color = positive ? AppColors.primaryLight : AppColors.salmon;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: (positive ? AppColors.presentBg : AppColors.absentBg),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
