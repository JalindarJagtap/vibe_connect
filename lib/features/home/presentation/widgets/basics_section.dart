import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class BasicsSection extends StatelessWidget {
  final int age;
  final String birthDate;
  final String height;
  final String livesIn;

  const BasicsSection({
    super.key,
    required this.age,
    required this.birthDate,
    required this.height,
    required this.livesIn,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'THE BASICS',
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
              children: [
                _buildRow(
                  icon: Icons.cake_outlined,
                  label: 'Age',
                  value: '$age years old',
                  subtitle: birthDate,
                  isFirst: true,
                ),
                const Divider(height: 1, thickness: 1, color: AppColors.divider),
                _buildRow(
                  icon: Icons.straighten_rounded,
                  label: 'Height',
                  value: height,
                ),
                const Divider(height: 1, thickness: 1, color: AppColors.divider),
                _buildRow(
                  icon: Icons.person_pin_circle_outlined,
                  label: 'Lives in',
                  value: livesIn.split('\n').first,
                  subtitle: livesIn.contains('\n') ? livesIn.split('\n').last : null,
                  isLast: true,
                ),
              ],
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
    String? subtitle,
    bool isFirst = false,
    bool isLast = false,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  value,
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
                    style: AppTextStyles.cardSubtitle.copyWith(
                      fontSize: 12,
                    ),
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
