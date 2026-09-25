import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class DateNowScreen extends StatefulWidget {
  const DateNowScreen({super.key});

  @override
  State<DateNowScreen> createState() => _DateNowScreenState();
}

class _DateNowScreenState extends State<DateNowScreen> {
  String _selectedDateFilter = 'Today';
  final dateFilters = ['Today', 'Tomorrow', 'Weekend'];

  final List<Map<String, dynamic>> dateCards = [
    {
      'title': 'Pasta & Honest Chats',
      'subtitle': 'Foodie looking for a dinner buddy 🍝',
      'venue': 'Live · Olive Bar, Mahalaxmi',
      'distance': '3.4 km away',
      'time': '8:30 PM',
      'type': 'Dinner',
      'match': '88% match',
      'spots': 'Just 1',
      'payment': 'I\'ll pay',
      'name': 'Ananya',
      'age': 25,
      'gender': 'she/her · Foodie',
      'image': 'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=800',
      'avatar': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=300',
    },
    {
      'title': 'Coffee & Vinyl Records',
      'subtitle': 'Looking for a chill music & coffee nerd ☕🎵',
      'venue': 'Live · Subko Specialty Coffee',
      'distance': '2.1 km away',
      'time': '5:00 PM',
      'type': 'Coffee',
      'match': '94% match',
      'spots': 'Just 1',
      'payment': 'Split bill',
      'name': 'Meera',
      'age': 26,
      'gender': 'she/her · Architect',
      'image': 'https://images.unsplash.com/photo-1501339847302-ac426a4a7cbb?w=800',
      'avatar': 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=300',
    },
  ];

  int _currentCardIndex = 0;

  @override
  Widget build(BuildContext context) {
    final card = dateCards[_currentCardIndex % dateCards.length];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              // Top Header Row: Date Now Title + My Plans 2 Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                      ),
                      children: const [
                        TextSpan(
                          text: 'Date ',
                          style: TextStyle(color: AppColors.textPrimary),
                        ),
                        TextSpan(
                          text: 'Now',
                          style: TextStyle(color: AppColors.primaryRose),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryRose,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryRose.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        )
                      ],
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.calendar_month_rounded, color: Colors.white, size: 16),
                        SizedBox(width: 6),
                        Text(
                          'My Plans',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(width: 6),
                        CircleAvatar(
                          radius: 9,
                          backgroundColor: Colors.white,
                          child: Text(
                            '2',
                            style: TextStyle(
                              color: AppColors.primaryRose,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Segmented Date Filters: Today, Tomorrow, Weekend
              Row(
                children: dateFilters.map((filter) {
                  final isSelected = filter == _selectedDateFilter;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDateFilter = filter;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.badgePink : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primaryRose
                                : const Color(0xFFEBE6DF),
                            width: 1.2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            filter,
                            style: TextStyle(
                              color: isSelected
                                  ? AppColors.primaryRose
                                  : AppColors.textPrimary,
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 14),

              // Main Featured Date Card
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 16,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(26),
                    child: Stack(
                      children: [
                        // Card Photo Image
                        Positioned.fill(
                          child: CachedNetworkImage(
                            imageUrl: card['image'],
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) => Container(
                              color: const Color(0xFFEFEBE4),
                              child: const Icon(Icons.restaurant_rounded, size: 64, color: AppColors.textMuted),
                            ),
                          ),
                        ),

                        // Gradient Shadow Overlay
                        Positioned.fill(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withValues(alpha: 0.25),
                                  Colors.black.withValues(alpha: 0.90),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: const [0.3, 0.55, 1.0],
                              ),
                            ),
                          ),
                        ),

                        // Top Badges: Live venue + Distance
                        Positioned(
                          top: 16,
                          left: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                  color: AppColors.trustGreen,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 6,
                                      height: 6,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      card['venue'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.black.withValues(alpha: 0.55),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.location_on, color: AppColors.primaryRose, size: 13),
                                    const SizedBox(width: 4),
                                    Text(
                                      card['distance'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Bottom Info Overlay
                        Positioned(
                          left: 16,
                          right: 16,
                          bottom: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Badges: TODAY, Time, Type
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryRose,
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(Icons.calendar_today_rounded, color: Colors.white, size: 11),
                                        SizedBox(width: 4),
                                        Text(
                                          'TODAY',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  _buildGlassPill(Icons.access_time_rounded, card['time']),
                                  const SizedBox(width: 8),
                                  _buildGlassPill(Icons.people_outline_rounded, card['type']),
                                ],
                              ),
                              const SizedBox(height: 10),

                              // Date Plan Title
                              Text(
                                card['title'],
                                style: AppTextStyles.cardTitle.copyWith(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 4),

                              // Subtitle + Flag
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      card['subtitle'],
                                      style: TextStyle(
                                        color: Colors.white.withValues(alpha: 0.9),
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  const Icon(Icons.flag_outlined, color: Colors.white70, size: 18),
                                ],
                              ),
                              const SizedBox(height: 10),

                              // Match / Spots / Payment Badges
                              Row(
                                children: [
                                  _buildPillTag('💜 ${card['match']}', const Color(0xFF6B4EE0)),
                                  const SizedBox(width: 6),
                                  _buildPillTag('👥 ${card['spots']}', const Color(0xFF3388EE)),
                                  const SizedBox(width: 6),
                                  _buildPillTag('🤝 ${card['payment']}', const Color(0xFFE89A10)),
                                ],
                              ),
                              const SizedBox(height: 14),

                              // Glassmorphic User Profile Bar
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.black.withValues(alpha: 0.45),
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.15),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundImage: NetworkImage(card['avatar']),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              '${card['name']}, ${card['age']}',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            const Icon(Icons.check_circle_rounded,
                                                color: Colors.white, size: 14),
                                          ],
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          card['gender'],
                                          style: TextStyle(
                                            color: Colors.white.withValues(alpha: 0.8),
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Profile →',
                                        style: TextStyle(
                                          color: AppColors.secondaryRose,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
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
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // Bottom Action Buttons: Skip (Left) + Request Date (Right)
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      height: 52,
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            _currentCardIndex++;
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.headerPink,
                          side: const BorderSide(color: AppColors.primaryRose, width: 1.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.close_rounded, size: 18, color: AppColors.headerPink),
                            SizedBox(width: 6),
                            Text(
                              'Skip',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 6,
                    child: SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('📅 Request sent for ${card['title']}!'),
                              backgroundColor: AppColors.primaryRose,
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryRose,
                          foregroundColor: Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.calendar_month_rounded, size: 18),
                            SizedBox(width: 6),
                            Text(
                              'Request Date',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
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
        ),
      ),
    );
  }

  Widget _buildGlassPill(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 12),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPillTag(String text, Color bg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
