import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../pages/compliment_ideas_screen.dart';

class ComplimentBottomSheet extends StatefulWidget {
  final String sectionTitle;
  final String userName;
  final String? initialText;

  const ComplimentBottomSheet({
    super.key,
    required this.sectionTitle,
    required this.userName,
    this.initialText,
  });

  static Future<void> show(
    BuildContext context, {
    required String sectionTitle,
    required String userName,
    String? initialText,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: ComplimentBottomSheet(
          sectionTitle: sectionTitle,
          userName: userName,
          initialText: initialText,
        ),
      ),
    );
  }

  @override
  State<ComplimentBottomSheet> createState() => _ComplimentBottomSheetState();
}

class _ComplimentBottomSheetState extends State<ComplimentBottomSheet> {
  late TextEditingController _textController;
  bool _isRoseSelected = true;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.initialText ?? '');
    _textController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textLength = _textController.text.length;
    final hasText = textLength > 0;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 20,
            offset: Offset(0, -6),
          )
        ],
      ),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag Handle
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFD9D4CC),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Header Text: COMPLIMENTING
          Text(
            'COMPLIMENTING',
            style: AppTextStyles.sectionHeader.copyWith(
              color: AppColors.textMuted,
              fontSize: 11,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 4),

          // Title: Section Name (e.g. About / Prompt)
          Text(
            widget.sectionTitle,
            style: AppTextStyles.cardTitle.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 14),

          // Stats Row: 💬 3 comments, 🌹 2 roses, 🪙 5,258 balance
          Row(
            children: [
              _buildStatPill('💬 3 comments'),
              const SizedBox(width: 8),
              _buildStatPill('🌹 2 roses'),
              const SizedBox(width: 8),
              _buildStatPill('🪙 5,258 balance'),
            ],
          ),
          const SizedBox(height: 16),

          // Input Text Box
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFFEBE6DF),
                width: 1,
              ),
            ),
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _textController,
                  maxLength: 140,
                  maxLines: 3,
                  style: AppTextStyles.bodyText.copyWith(
                    fontSize: 15,
                    color: AppColors.textPrimary,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Write a sweet compliment...',
                    hintStyle: TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    counterText: '',
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () async {
                      final selected = await Navigator.push<String>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ComplimentIdeasScreen(
                            initialSelectedCompliment: _textController.text.isNotEmpty
                                ? _textController.text
                                : null,
                          ),
                        ),
                      );
                      if (selected != null) {
                        setState(() {
                          _textController.text = selected;
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.badgePink,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('💡', style: TextStyle(fontSize: 12)),
                          SizedBox(width: 4),
                          Text(
                            'Try',
                            style: TextStyle(
                              color: AppColors.primaryRose,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          // Gift Options Row + Counter
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isRoseSelected = !_isRoseSelected;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: _isRoseSelected ? AppColors.badgePink : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: _isRoseSelected ? AppColors.primaryRose : const Color(0xFFEBE6DF),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Text('🌹 Rose'),
                      const SizedBox(width: 6),
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: _isRoseSelected ? AppColors.primaryRose : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: _isRoseSelected ? AppColors.primaryRose : AppColors.textMuted,
                            width: 1.5,
                          ),
                        ),
                        child: _isRoseSelected
                            ? const Icon(Icons.check, color: Colors.white, size: 11)
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFEBE6DF)),
                ),
                child: const Row(
                  children: [
                    Text('🎁 Select Gift'),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                '$textLength/140',
                style: const TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),

          // Action Buttons: Like Button + Send Button
          Row(
            children: [
              Container(
                width: 56,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: const Color(0xFFEBE6DF)),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite_rounded, color: AppColors.primaryRose, size: 20),
                    Text(
                      'Like',
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            hasText
                                ? '🌹 Compliment sent to ${widget.userName}!'
                                : '❤️ Liked ${widget.userName}\'s ${widget.sectionTitle}!',
                          ),
                          backgroundColor: const Color(0xFF1E1F24),
                          duration: const Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: hasText
                          ? AppColors.primaryRose
                          : AppColors.primaryRose.withValues(alpha: 0.35),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      elevation: hasText ? 4 : 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          hasText ? 'Send 🌹 + 💬' : 'Send Compliment',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatPill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F2EC),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
