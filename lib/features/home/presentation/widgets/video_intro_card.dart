import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/constants/app_colors.dart';
import 'compliment_bottom_sheet.dart';

class VideoIntroCard extends StatefulWidget {
  final String videoThumbnailUrl;
  final String duration;
  final String userName;
  final VoidCallback? onRoseTap;

  const VideoIntroCard({
    super.key,
    required this.videoThumbnailUrl,
    required this.duration,
    required this.userName,
    this.onRoseTap,
  });

  @override
  State<VideoIntroCard> createState() => _VideoIntroCardState();
}

class _VideoIntroCardState extends State<VideoIntroCard> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        children: [
          Container(
            height: 290,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x12000000),
                  blurRadius: 14,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: Stack(
                children: [
                  // Video Thumbnail or Active Video Container
                  Positioned.fill(
                    child: CachedNetworkImage(
                      imageUrl: widget.videoThumbnailUrl,
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
                          Icons.videocam_off_outlined,
                          size: 48,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ),
                  ),

                  // Dark Overlay for Contrast
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withValues(alpha: _isPlaying ? 0.1 : 0.25),
                    ),
                  ),

                  // Center Play/Pause Button
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isPlaying = !_isPlaying;
                        });
                        if (_isPlaying) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('▶ Playing ${widget.userName}\'s Video Intro (${widget.duration})'),
                              backgroundColor: const Color(0xFF1E1F24),
                              duration: const Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          );
                        }
                      },
                      child: Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          _isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                          color: AppColors.textPrimary,
                          size: 30,
                        ),
                      ),
                    ),
                  ),

                  // Bottom Left Glass Badge: Video intro · 0:28
                  Positioned(
                    left: 16,
                    bottom: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.55),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.play_circle_outline_rounded,
                              color: Colors.white, size: 14),
                          const SizedBox(width: 6),
                          Text(
                            'Video intro · ${widget.duration}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Floating Rose Button on Video Card
                  Positioned(
                    right: 16,
                    bottom: 16,
                    child: GestureDetector(
                      onTap: widget.onRoseTap ??
                          () {
                            ComplimentBottomSheet.show(
                              context,
                              sectionTitle: 'Video Intro',
                              userName: widget.userName,
                            );
                          },
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryRose.withValues(alpha: 0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            '🌹',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
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
}
