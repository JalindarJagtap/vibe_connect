import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class ComplimentIdeasScreen extends StatefulWidget {
  final String? initialSelectedCompliment;

  const ComplimentIdeasScreen({
    super.key,
    this.initialSelectedCompliment,
  });

  @override
  State<ComplimentIdeasScreen> createState() => _ComplimentIdeasScreenState();
}

class _ComplimentIdeasScreenState extends State<ComplimentIdeasScreen> {
  String _selectedCategory = 'Flirty';
  String? _selectedCompliment;
  bool _showToast = false;

  final Map<String, List<String>> _categoriesMap = {
    'Sweet': [
      'Your smile is absolutely contagious 😍',
      'You have the kind of warmth that makes people feel at home.',
      'There\'s something genuinely lovely about your energy.',
      'I could probably talk to you for hours and never get bored.',
      'You seem like the kind of person who makes ordinary days better.',
      'Your kindness really comes through in your profile.',
    ],
    'Playful': [
      'Are you always this adventurous or is this just for the profile? 🏔️',
      'I bet I could beat you at board games, just saying 🎯',
      'Quick question: coffee date or street food crawl first?',
      'If we match, you owe me a chai recipe!',
    ],
    'Admiring': [
      'Your passion for design/work is super inspiring ✨',
      'Love your travel photos, that view looks unbelievable!',
      'Great taste in books and chai, truly impressive.',
      'Your profile bio is one of the best I\'ve read today.',
    ],
    'Flirty': [
      'Not gonna lie, your smile stopped my scroll 😍',
      'You\'re trouble, I can already tell — the good kind.',
      'If you\'re as fun in person as your profile, I\'m in.',
      'I think we\'d make a dangerously good team ☕➡️🍷',
      'You\'ve got a vibe I can\'t quite look away from.',
      'Coffee, you, and good conversation — when\'s good for you?',
    ],
  };

  @override
  void initState() {
    super.initState();
    _selectedCompliment = widget.initialSelectedCompliment ??
        'If you\'re as fun in person as your profile, I\'m in.';
  }

  @override
  Widget build(BuildContext context) {
    final categories = _categoriesMap.keys.toList();
    final currentIdeas = _categoriesMap[_selectedCategory] ?? [];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFDEEF4),
              Color(0xFFF4EDF9),
              AppColors.background,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.30, 0.60],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top Back Button Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x0A000000),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 16,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Hero Header Section
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      // Speech Bubble Illustration with 3 Dots
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 76,
                            height: 56,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(color: const Color(0xFF1E1E1E), width: 2.5),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x0E000000),
                                  blurRadius: 12,
                                  offset: Offset(0, 4),
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 6,
                                  height: 6,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF555555),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  width: 6,
                                  height: 6,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF555555),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  width: 6,
                                  height: 6,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF555555),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Bubble Tail
                          Positioned(
                            bottom: -6,
                            left: 20,
                            child: Transform.rotate(
                              angle: 0.6,
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                    left: BorderSide(color: Color(0xFF1E1E1E), width: 2.5),
                                    bottom: BorderSide(color: Color(0xFF1E1E1E), width: 2.5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),

                      // Title & Subtitle
                      Text(
                        'Compliment Ideas',
                        style: AppTextStyles.cardTitle.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'pick one to make a great first impression',
                        style: AppTextStyles.cardSubtitle.copyWith(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Horizontal Categories Scroll
                      SizedBox(
                        height: 42,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          separatorBuilder: (context, index) => const SizedBox(width: 10),
                          itemBuilder: (context, index) {
                            final cat = categories[index];
                            final isSelected = cat == _selectedCategory;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedCategory = cat;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.primaryRose
                                      : const Color.fromARGB(255, 247, 246, 245),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    cat,
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : const Color(0xFF5A5A5A),
                                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Compliments List Cards
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: currentIdeas.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final idea = currentIdeas[index];
                          final isSelected = idea == _selectedCompliment;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedCompliment = idea;
                                _showToast = true;
                              });
                              Future.delayed(const Duration(seconds: 2), () {
                                if (mounted) {
                                  setState(() {
                                    _showToast = false;
                                  });
                                }
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                              decoration: BoxDecoration(
                                color: isSelected ? const Color(0xFFFFF2F5) : Colors.white,
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.primaryRose
                                      : Colors.transparent,
                                  width: 1.5,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x06000000),
                                    blurRadius: 8,
                                    offset: Offset(0, 2),
                                  )
                                ],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      idea,
                                      style: TextStyle(
                                        color: const Color(0xFF222222),
                                        fontSize: 14.5,
                                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                                        height: 1.35,
                                      ),
                                    ),
                                  ),
                                  if (isSelected) ...[
                                    const SizedBox(width: 10),
                                    Container(
                                      width: 22,
                                      height: 22,
                                      decoration: const BoxDecoration(
                                        color: AppColors.primaryRose,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.check_rounded,
                                        color: Colors.white,
                                        size: 14,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),

              // Dark Toast overlay banner (Black background `#1E1F24`)
              if (_showToast)
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1F24),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x33000000),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Compliment added ✨',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),

              // Bottom Action Button
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: _selectedCompliment != null
                        ? () {
                            Navigator.pop(context, _selectedCompliment);
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryRose,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 4,
                    ),
                    child: const Text(
                      'Use this compliment',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
