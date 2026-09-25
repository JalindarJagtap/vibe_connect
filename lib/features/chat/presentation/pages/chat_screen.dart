import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import 'chat_detail_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String _selectedFilter = 'All';
  final List<String> _filters = ['All', 'Unread', 'Online', 'Nearby', 'Date Invites'];

  final List<Map<String, dynamic>> _newMatches = [
    {
      'name': 'Sarah',
      'img': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=300',
      'badge': 'NEW',
    },
    {
      'name': 'Ariya',
      'img': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=300',
      'badge': '🎁',
    },
    {
      'name': 'Liam',
      'img': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300',
    },
    {
      'name': 'Chloe',
      'img': 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=300',
      'badge': '📹',
    },
    {
      'name': 'Dev',
      'img': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=300',
    },
  ];

  final List<Map<String, dynamic>> _chats = [
    {
      'name': 'Aanya',
      'age': 25,
      'match': '92% Match',
      'msg': 'Can\'t wait to see you tonight at the...',
      'time': '2m',
      'unread': 2,
      'isOnline': true,
      'progress': 1.0,
      'progressColor': AppColors.trustGreen,
      'progressText': 'Gift unlocked!',
      'progressIcon': '🎁',
      'isGiftUnlocked': true,
      'img': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=300',
    },
    {
      'name': 'Jordan',
      'age': 27,
      'match': '88% Match',
      'msg': 'Typing...',
      'isTyping': true,
      'time': 'Now',
      'unread': 0,
      'isOnline': true,
      'progress': 0.72,
      'progressColor': AppColors.primaryRose,
      'progressText': '18/25 for Premium Rose 🌹',
      'img': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300',
    },
    {
      'name': 'Marcus',
      'age': 29,
      'match': '75% Match',
      'msg': 'That sounds like an amazing hobby! Ho...',
      'time': '1h',
      'unread': 0,
      'isOnline': false,
      'progress': 0.20,
      'progressColor': Colors.redAccent,
      'progressText': '5/25 - Deadline 14h ⏰',
      'img': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=300',
    },
    {
      'name': 'Elena',
      'age': 23,
      'match': '95% Match',
      'msg': 'You: Hey! I\'m heading over now.',
      'time': '3h',
      'unread': 0,
      'isOnline': true,
      'progress': 0.88,
      'progressColor': AppColors.primaryRose,
      'progressText': '22/25 for Silver Ring 💍',
      'img': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=300',
    },
    {
      'name': 'Rohan',
      'age': 26,
      'match': '81% Match',
      'msg': 'Sure, coffee sounds great for Sunday!',
      'time': 'Yesterday',
      'unread': 0,
      'isOnline': false,
      'progress': 0.40,
      'progressColor': AppColors.primaryRose,
      'progressText': '10/25 for Level 2',
      'img': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Top Header: Messages Title + Settings Icon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Messages',
                    style: AppTextStyles.cardTitle.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Container(
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
                      Icons.settings_outlined,
                      color: AppColors.textPrimary,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
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
                    const Icon(Icons.search_rounded, color: AppColors.textMuted, size: 20),
                    const SizedBox(width: 10),
                    Text(
                      'Search matches or messages',
                      style: AppTextStyles.cardSubtitle.copyWith(
                        color: AppColors.textMuted,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Main Scrollable Area
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NEW MATCHES Section Header
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'NEW MATCHES',
                            style: AppTextStyles.sectionHeader,
                          ),
                          Text(
                            'See all →',
                            style: AppTextStyles.cardSubtitle.copyWith(
                              color: AppColors.textMuted,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // New Matches Horizontal Avatars Row
                    SizedBox(
                      height: 94,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: _newMatches.length,
                        separatorBuilder: (context, index) => const SizedBox(width: 14),
                        itemBuilder: (context, index) {
                          final match = _newMatches[index];
                          final badge = match['badge'];

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatDetailScreen(
                                    userName: match['name'],
                                    userImage: match['img'],
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(2.5),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.primaryRose,
                                          width: 2,
                                        ),
                                      ),
                                      child: CircleAvatar(
                                        radius: 26,
                                        backgroundImage: NetworkImage(match['img']),
                                      ),
                                    ),
                                    if (badge != null)
                                      Positioned(
                                        top: -4,
                                        right: -2,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: badge == 'NEW'
                                                ? AppColors.primaryRose
                                                : Colors.amber,
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: Colors.white, width: 1.5),
                                          ),
                                          child: Text(
                                            badge,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 9,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  match['name'],
                                  style: AppTextStyles.cardTitle.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Category Filter Pills: All, Unread, Online, Nearby, Date Invites
                    SizedBox(
                      height: 38,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: _filters.length,
                        separatorBuilder: (context, index) => const SizedBox(width: 8),
                        itemBuilder: (context, index) {
                          final f = _filters[index];
                          final isSelected = f == _selectedFilter;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedFilter = f;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                              decoration: BoxDecoration(
                                color: isSelected ? AppColors.primaryRose : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  f,
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : AppColors.textPrimary,
                                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Chat Cards List
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _chats.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final chat = _chats[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatDetailScreen(
                                  userName: chat['name'],
                                  userAge: chat['age'],
                                  userImage: chat['img'],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x06000000),
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                )
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Avatar with online dot
                                Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 26,
                                      backgroundImage: NetworkImage(chat['img']),
                                    ),
                                    if (chat['isOnline'] == true)
                                      Positioned(
                                        right: 0,
                                        bottom: 0,
                                        child: Container(
                                          width: 13,
                                          height: 13,
                                          decoration: BoxDecoration(
                                            color: AppColors.trustGreen,
                                            shape: BoxShape.circle,
                                            border: Border.all(color: Colors.white, width: 2),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                const SizedBox(width: 12),

                                // Main Content Column
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Header: Name, Match Badge, Time
                                      Row(
                                        children: [
                                          Text(
                                            '${chat['name']}, ${chat['age']}',
                                            style: AppTextStyles.cardTitle.copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 2),
                                            decoration: BoxDecoration(
                                              color: AppColors.badgePink,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Text(
                                              chat['match'],
                                              style: TextStyle(
                                                color: AppColors.primaryRose,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            chat['time'],
                                            style: AppTextStyles.cardSubtitle.copyWith(
                                              fontSize: 11,
                                              color: AppColors.textMuted,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),

                                      // Message Preview Row
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              chat['msg'],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: chat['isTyping'] == true
                                                    ? AppColors.primaryRose
                                                    : AppColors.textSecondary,
                                                fontStyle: chat['isTyping'] == true
                                                    ? FontStyle.italic
                                                    : FontStyle.normal,
                                                fontWeight: chat['isTyping'] == true
                                                    ? FontWeight.bold
                                                    : FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          if (chat['unread'] > 0) ...[
                                            const SizedBox(width: 6),
                                            Container(
                                              width: 18,
                                              height: 18,
                                              decoration: const BoxDecoration(
                                                color: AppColors.primaryRose,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '${chat['unread']}',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                      const SizedBox(height: 8),

                                      // Progress Bar & Level Info Row
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(4),
                                              child: LinearProgressIndicator(
                                                value: chat['progress'],
                                                backgroundColor: const Color(0xFFF3ECE4),
                                                color: chat['progressColor'],
                                                minHeight: 5,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            chat['progressText'],
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600,
                                              color: chat['isGiftUnlocked'] == true
                                                  ? AppColors.trustGreen
                                                  : AppColors.textMuted,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
