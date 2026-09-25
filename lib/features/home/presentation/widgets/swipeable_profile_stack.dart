import 'dart:math';
import 'package:flutter/material.dart';
import '../../domain/entities/user_profile.dart';
import 'profile_hero_card.dart';
import 'compliment_bottom_sheet.dart';

class SwipeableProfileStack extends StatefulWidget {
  final UserProfile currentUser;
  final UserProfile? nextUser;
  final VoidCallback onSwipeLeft;
  final VoidCallback onSwipeRight;
  final VoidCallback onUndo;
  final VoidCallback onMoreOptions;

  const SwipeableProfileStack({
    super.key,
    required this.currentUser,
    this.nextUser,
    required this.onSwipeLeft,
    required this.onSwipeRight,
    required this.onUndo,
    required this.onMoreOptions,
  });

  @override
  State<SwipeableProfileStack> createState() => _SwipeableProfileStackState();
}

class _SwipeableProfileStackState extends State<SwipeableProfileStack>
    with SingleTickerProviderStateMixin {
  Offset _dragOffset = Offset.zero;
  double _dragAngle = 0.0;
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final stackHeight = (screenHeight - 185).clamp(560.0, 760.0) + 12;

    return SizedBox(
      height: stackHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Card (Next Profile in Stack)
          if (widget.nextUser != null)
            Positioned(
              child: Transform.scale(
                scale: 0.95 + (min(1.0, _dragOffset.distance / 300) * 0.05),
                child: ProfileHeroCard(
                  user: widget.nextUser!,
                ),
              ),
            ),

          // Foreground Top Card (Swipeable with Rotation & Translation)
          Positioned(
            child: GestureDetector(
              onPanStart: (details) {
                setState(() {
                  _isDragging = true;
                });
              },
              onPanUpdate: (details) {
                setState(() {
                  _dragOffset += details.delta;
                  _dragAngle = _dragOffset.dx / 900.0;
                });
              },
              onPanEnd: (details) {
                if (_dragOffset.dx > 120) {
                  _triggerSwipe(right: true);
                } else if (_dragOffset.dx < -120) {
                  _triggerSwipe(right: false);
                } else {
                  setState(() {
                    _dragOffset = Offset.zero;
                    _dragAngle = 0.0;
                    _isDragging = false;
                  });
                }
              },
              child: Transform.translate(
                offset: _dragOffset,
                child: Transform.rotate(
                  angle: _dragAngle,
                  child: ProfileHeroCard(
                    user: widget.currentUser,
                    onUndo: widget.onUndo,
                    onMoreOptions: widget.onMoreOptions,
                    onRoseTap: () {
                      ComplimentBottomSheet.show(
                        context,
                        sectionTitle: 'Profile',
                        userName: widget.currentUser.name,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),

          // Dark Floating Toast Overlay over Card during Swipe/Rose action
          if (_isDragging && _dragOffset.distance > 80)
            Positioned(
              bottom: 24,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _dragOffset.dx > 0
                          ? '🌹 Rose + 💬 Comment sent! ✨ Opening chat...'
                          : '✕ Skipped profile',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _triggerSwipe({required bool right}) {
    setState(() {
      _dragOffset = Offset(right ? 500 : -500, 0);
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        setState(() {
          _dragOffset = Offset.zero;
          _dragAngle = 0.0;
          _isDragging = false;
        });
        if (right) {
          widget.onSwipeRight();
        } else {
          widget.onSwipeLeft();
        }
      }
    });
  }
}
