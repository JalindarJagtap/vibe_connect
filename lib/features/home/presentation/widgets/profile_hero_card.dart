import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../domain/entities/user_profile.dart';

class ProfileHeroCard extends StatelessWidget {
  final UserProfile user;
  final VoidCallback? onUndo;
  final VoidCallback? onMoreOptions;
  final VoidCallback? onRoseTap;

  const ProfileHeroCard({
    super.key,
    required this.user,
    this.onUndo,
    this.onMoreOptions,
    this.onRoseTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final cardHeight = (screenHeight - 165).clamp(560.0, 760.0);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      height: cardHeight,
      decoration: BoxDecoration(
        color: const Color(0xFF18181A),
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Stack(
          children: [
            // Hero Photo Image
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: user.pictureUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: const Color(0xFFEFEBE4),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryRose,
                      strokeWidth: 2,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: const Color(0xFFEFEBE4),
                  child: const Icon(
                    Icons.person,
                    size: 64,
                    color: AppColors.textMuted,
                  ),
                ),
              ),
            ),

            // Gradient Overlay for text readability
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.1),
                      Colors.black.withValues(alpha: 0.85),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.3, 0.6, 1.0],
                  ),
                ),
              ),
            ),

            // Top Action Buttons
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTranslucentButton(
                    Icons.refresh_rounded,
                    onTap: onUndo,
                  ),
                  _buildTranslucentButton(
                    Icons.more_vert_rounded,
                    onTap: onMoreOptions,
                  ),
                ],
              ),
            ),

            // Bottom Profile Info
            Positioned(
              left: 16,
              right: 16,
              bottom: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Badges Pill Row
                  Row(
                    children: [
                      _buildGlassBadge('${user.matchPercentage}% Match', AppColors.matchBlue),
                      const SizedBox(width: 8),
                      _buildGlassBadge('${user.trustPercentage}% Trust', AppColors.trustGreen),
                      const SizedBox(width: 8),
                      _buildGlassBadge(user.replyTime, AppColors.replyOrange),
                    ],
                  ),
                  const SizedBox(width: 0, height: 12),

                  // Name & Age Row
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        margin: const EdgeInsets.only(right: 8, top: 4),
                        decoration: const BoxDecoration(
                          color: AppColors.trustGreen,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '${user.name} ${user.age}',
                          style: AppTextStyles.heroName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Subtitles
                  _buildInfoRow(Icons.location_on_outlined, '${user.city} · ${user.distanceKm} km away'),
                  const SizedBox(height: 4),
                  _buildInfoRow(Icons.work_outline_rounded, user.occupation),
                  const SizedBox(height: 4),
                  _buildInfoRow(Icons.favorite_border_rounded, user.relationshipGoal),
                ],
              ),
            ),

            // Floating Rose Button
            Positioned(
              right: 16,
              bottom: 16,
              child: GestureDetector(
                onTap: onRoseTap,
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryRose.withValues(alpha: 0.35),
                        blurRadius: 14,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      '🌹',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTranslucentButton(IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.25),
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  Widget _buildGlassBadge(String label, Color dotColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.15),
          width: 0.8,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: dotColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
          color: Colors.white.withValues(alpha: 0.9),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.heroSubtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
