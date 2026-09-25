import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class LifestyleSection extends StatelessWidget {
  final Map<String, String> lifestyle;

  const LifestyleSection({super.key, required this.lifestyle});

  @override
  Widget build(BuildContext context) {
    final Map<String, IconData> iconMap = {
      'Diet': Icons.restaurant_rounded,
      'Drinking': Icons.local_bar_rounded,
      'Smoking': Icons.smoke_free_rounded,
      'Fitness': Icons.fitness_center_rounded,
      'Travel': Icons.explore_outlined,
      'Pets': Icons.pets_rounded,
      'Sleep': Icons.nights_stay_outlined,
    };

    final entries = lifestyle.entries.toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'LIFESTYLE',
            style: AppTextStyles.sectionHeader,
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x08000000),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: entries.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                final icon = iconMap[item.key] ?? Icons.bubble_chart_outlined;
                final isLast = index == entries.length - 1;

                return Column(
                  children: [
                    _buildRow(
                      icon: icon,
                      label: item.key,
                      value: item.value,
                    ),
                    if (!isLast)
                      const Divider(
                        height: 1,
                        thickness: 1,
                        color: AppColors.divider,
                      ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    final lines = value.split('\n');
    final mainValue = lines.first;
    final subtitle = lines.length > 1 ? lines[1] : null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          Icon(icon, color: AppColors.headerPink, size: 22),
          const SizedBox(width: 14),
          Text(
            label,
            style: AppTextStyles.cardSubtitle.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  mainValue,
                  style: AppTextStyles.cardTitle.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: AppTextStyles.cardSubtitle.copyWith(fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
