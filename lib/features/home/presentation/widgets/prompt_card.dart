import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import 'compliment_bottom_sheet.dart';

class PromptCard extends StatelessWidget {
  final String question;
  final String answer;
  final String userName;

  const PromptCard({
    super.key,
    required this.question,
    required this.answer,
    this.userName = 'User',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: GestureDetector(
        onTap: () {
          ComplimentBottomSheet.show(
            context,
            sectionTitle: 'Prompt',
            userName: userName,
          );
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
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
              Text(
                question,
                style: AppTextStyles.promptTitle,
              ),
              const SizedBox(height: 10),
              Text(
                answer,
                style: AppTextStyles.promptBody,
              ),
              const SizedBox(height: 16),
              Container(
                width: 34,
                height: 34,
                decoration: const BoxDecoration(
                  color: AppColors.badgePink,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    '🌹',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
