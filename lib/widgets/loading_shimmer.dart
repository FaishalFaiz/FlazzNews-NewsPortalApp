import 'package:flutter/material.dart';
import 'package:flazz_news/utils/app_colors.dart';

class LoadingShimmer extends StatefulWidget {
  const LoadingShimmer({super.key});

  @override
  State<LoadingShimmer> createState() => _LoadingShimmerState();
}

class _LoadingShimmerState extends State<LoadingShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildShimmerBox({
    required double height,
    double width = double.infinity,
    double borderRadius = 8,
  }) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: const [
                AppColors.surfaceContainer,
                AppColors.surfaceContainerLowest,
                AppColors.surfaceContainer,
              ],
              stops: const [0.0, 0.5, 1.0],
              transform: GradientRotation(_animation.value * 1.5),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hero Shimmer
          Container(
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildShimmerBox(height: 200, borderRadius: 20),
                const SizedBox(height: 16),
                _buildShimmerBox(height: 20, width: double.infinity, borderRadius: 6),
                const SizedBox(height: 8),
                _buildShimmerBox(height: 20, width: 220, borderRadius: 6),
                const SizedBox(height: 12),
                _buildShimmerBox(height: 14, width: 140, borderRadius: 4),
              ],
            ),
          ),
          const SizedBox(height: 28),

          // Section Title Shimmer
          _buildShimmerBox(height: 22, width: 180, borderRadius: 6),
          const SizedBox(height: 16),

          // Compact list shimmer items
          ...List.generate(3, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildShimmerBox(height: 12, width: 100, borderRadius: 4),
                        const SizedBox(height: 8),
                        _buildShimmerBox(height: 16, width: double.infinity, borderRadius: 4),
                        const SizedBox(height: 6),
                        _buildShimmerBox(height: 16, width: 160, borderRadius: 4),
                        const SizedBox(height: 10),
                        _buildShimmerBox(height: 12, width: 90, borderRadius: 4),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  _buildShimmerBox(height: 80, width: 80, borderRadius: 12),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}