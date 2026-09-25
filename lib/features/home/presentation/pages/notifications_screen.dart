import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../chat/presentation/pages/chat_detail_screen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  String _selectedFilter = 'All';

  final filters = [
    {'label': 'All', 'count': '56'},
    {'label': 'Likes & roses'},
    {'label': 'Matches'},
    {'label': 'Gifts'},
    {'label': 'Dates'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
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
                        size: 18,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Notifications',
                        style: AppTextStyles.cardTitle.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        '9 new updates',
                        style: AppTextStyles.cardSubtitle.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('All notifications marked as read'),
                          backgroundColor: const Color(0xFF1E1F24),
                          duration: const Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Mark all read',
                      style: TextStyle(
                        color: AppColors.primaryRose,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Horizontal Filter Chips with Inner Badge Container for All 56
            SizedBox(
              height: 40,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final f = filters[index];
                  final label = f['label']!;
                  final count = f['count'];
                  final isSelected = label == _selectedFilter;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedFilter = label;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFF1E1F24) : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: isSelected
                            ? null
                            : const [
                                BoxShadow(
                                  color: Color(0x06000000),
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
                                )
                              ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            label,
                            style: TextStyle(
                              color: isSelected ? Colors.white : AppColors.textPrimary,
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                          if (count != null) ...[
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.white.withValues(alpha: 0.25)
                                    : const Color(0xFFF3ECE4),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                count,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : AppColors.textSecondary,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Today Notifications List
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TODAY',
                      style: AppTextStyles.sectionHeader.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Notification 1: Dev sent a rose (Unread with Red Dot)
                    _buildNotifCard(
                      avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300',
                      badgeIcon: '🌹',
                      badgeColor: AppColors.primaryRose,
                      title: 'Dev, 27',
                      actionText: 'sent you a Rose',
                      quote: '"Your trekking photos sold me — let\'s swap trail stories."',
                      time: '12 min ago',
                      isUnread: true,
                      buttonLabel: 'View profile',
                      onButtonTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(height: 12),

                    // Notification 2: Arjun complimented (Read)
                    _buildNotifCard(
                      avatarUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=300',
                      badgeIcon: '💬',
                      badgeColor: Colors.amber,
                      title: 'Arjun, 28',
                      actionText: 'complimented your About',
                      quote: '"Equally driven and equally curious — that line got me."',
                      time: '3 h ago',
                      isUnread: false,
                    ),
                    const SizedBox(height: 12),

                    // Notification 3: It's a match with Aanya (Unread with Red Dot)
                    _buildNotifCard(
                      avatarUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=300',
                      badgeIcon: '✓',
                      badgeColor: AppColors.trustGreen,
                      title: 'It\'s a match with Aanya, 25',
                      actionText: '',
                      quote: 'You both liked each other. Say hello before the spark fades.',
                      time: '40 min ago',
                      isUnread: true,
                      buttonLabel: 'Send a message',
                      onButtonTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChatDetailScreen(
                              userName: 'Aanya',
                              userAge: 25,
                              userImage: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=300',
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),

                    // Notification 4: Elena sent message (Unread with Red Dot)
                    _buildNotifCard(
                      avatarUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=300',
                      badgeIcon: '💬',
                      badgeColor: AppColors.primaryRose,
                      title: 'Elena, 23',
                      actionText: 'sent you a message',
                      quote: '"Haha okay that café pick was elite. When are you free?"',
                      time: '1 h ago',
                      isUnread: true,
                    ),
                    const SizedBox(height: 12),

                    // Notification 5: Kabir approved date request (Unread with Red Dot)
                    _buildNotifCard(
                      isCalendarIcon: true,
                      title: 'Kabir',
                      actionText: 'approved your date request',
                      quote: 'Coffee at Blue Tokai · Today, 7:00 PM · Koregaon Park',
                      time: '2 h ago',
                      isUnread: true,
                      buttonLabel: 'Open chat',
                      onButtonTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChatDetailScreen(
                              userName: 'Kabir',
                              userAge: 28,
                              userImage: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300',
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

  Widget _buildNotifCard({
    String? avatarUrl,
    bool isCalendarIcon = false,
    String badgeIcon = '',
    Color badgeColor = AppColors.primaryRose,
    required String title,
    required String actionText,
    required String quote,
    required String time,
    bool isUnread = false,
    String? buttonLabel,
    VoidCallback? onButtonTap,
  }) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0x06000000),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Avatar
                  if (isCalendarIcon)
                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: AppColors.badgePink,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.calendar_month_rounded,
                        color: AppColors.headerPink,
                        size: 24,
                      ),
                    )
                  else
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 23,
                          backgroundImage: NetworkImage(avatarUrl!),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              color: badgeColor,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 1.5),
                            ),
                            child: Center(
                              child: Text(
                                badgeIcon,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(width: 14),

                  // Title & Body
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: RichText(
                            text: TextSpan(
                              style: AppTextStyles.cardTitle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                              children: [
                                TextSpan(text: title),
                                if (actionText.isNotEmpty) ...[
                                  const TextSpan(text: ' '),
                                  TextSpan(
                                    text: actionText,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          quote,
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 13,
                            fontStyle: quote.startsWith('"') ? FontStyle.italic : FontStyle.normal,
                            height: 1.35,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          time,
                          style: AppTextStyles.cardSubtitle.copyWith(
                            fontSize: 11,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Optional Action Button
              if (buttonLabel != null) ...[
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: ElevatedButton(
                    onPressed: onButtonTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryRose,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      buttonLabel,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),

        // Red Dot Indicator on Top Right Corner of Unread Card
        if (isUnread)
          Positioned(
            top: 14,
            right: 14,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.primaryRose,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}
