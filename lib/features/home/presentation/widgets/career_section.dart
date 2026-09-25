import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class CareerSection extends StatelessWidget {
  final String education;
  final String educationDetail;
  final String workAs;
  final String workDetail;
  final String workStyle;
  final String ambitionLevel;
  final String bigDream;

  const CareerSection({
    super.key,
    required this.education,
    required this.educationDetail,
    required this.workAs,
    required this.workDetail,
    required this.workStyle,
    required this.ambitionLevel,
    required this.bigDream,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CAREER & AMBITION',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRow(
                  icon: Icons.school_outlined,
                  label: 'Education',
                  value: education,
                  subtitle: educationDetail,
                ),
                const Divider(height: 1, thickness: 1, color: AppColors.divider),
                _buildRow(
                  icon: Icons.business_center_outlined,
                  label: 'Work as',
                  value: workAs,
                  subtitle: workDetail,
                ),
                const Divider(height: 1, thickness: 1, color: AppColors.divider),
                _buildRow(
                  icon: Icons.auto_awesome_outlined,
                  label: 'Work style',
                  value: workStyle,
                ),
                const Divider(height: 1, thickness: 1, color: AppColors.divider),
                _buildRow(
                  icon: Icons.trending_up_rounded,
                  label: 'Ambition level',
                  value: ambitionLevel,
                ),
                const Divider(height: 1, thickness: 1, color: AppColors.divider),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'HER BIG DREAM',
                        style: AppTextStyles.sectionHeader.copyWith(
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        bigDream,
                        style: AppTextStyles.bodyText.copyWith(
                          fontSize: 14,
                          height: 1.45,
                        ),
                      ),
                    ],
                  ),
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
