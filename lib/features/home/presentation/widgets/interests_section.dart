import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../domain/entities/user_profile.dart';

class InterestsSection extends StatelessWidget {
  final List<InterestItem> interests;

  const InterestsSection({super.key, required this.interests});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'INTERESTS & HOBBIES',
            style: AppTextStyles.sectionHeader,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: interests.map((item) => _buildInterestChip(item)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildInterestChip(InterestItem item) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.chipBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.chipBorder, width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color(0x06000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            item.icon,
            style: const TextStyle(fontSize: 15),
          ),
          const SizedBox(width: 8),
          Text(
            item.label,
            style: AppTextStyles.chipText,
          ),
        ],
      ),
    );
  }
}
