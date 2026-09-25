import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UserShimmerSkeleton extends StatelessWidget {
  const UserShimmerSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE8E3DC),
      highlightColor: const Color(0xFFF7F5F0),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            // Top Bar skeleton
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCircle(44),
                _buildBox(120, 36, radius: 18),
                Row(
                  children: [
                    _buildCircle(40),
                    const SizedBox(width: 8),
                    _buildCircle(40),
                    const SizedBox(width: 8),
                    _buildCircle(40),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Hero Card Skeleton
            _buildBox(double.infinity, 490, radius: 28),
            const SizedBox(height: 16),

            // About Skeleton
            _buildBox(double.infinity, 100, radius: 20),
            const SizedBox(height: 16),

            // Basics Skeleton
            _buildBox(double.infinity, 160, radius: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCircle(double size) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildBox(double width, double height, {double radius = 12}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
