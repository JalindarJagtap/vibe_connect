import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class LanguageCommunicationCard extends StatelessWidget {
  final String motherTongue;
  final String communicationStyle;

  const LanguageCommunicationCard({
    super.key,
    required this.motherTongue,
    required this.communicationStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Container(
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
          children: [
            _buildRow(
              icon: Icons.translate_rounded,
              label: 'Mother tongue',
              value: motherTongue,
            ),
            const Divider(height: 1, thickness: 1, color: AppColors.divider),
            _buildRow(
              icon: Icons.phone_in_talk_outlined,
              label: 'Communication style',
              value: communicationStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
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
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: AppTextStyles.cardTitle.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
