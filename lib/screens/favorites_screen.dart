import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/shared_widgets.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: CustomScrollView(
        slivers: [
          // ── Hero SliverAppBar ──
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            backgroundColor: AppColors.bgDark,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios,
                  color: Colors.white, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Background gradient
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF1A1400),
                          Color(0xFF0D1117),
                          Color(0xFF1A1200),
                        ],
                      ),
                    ),
                  ),
                  // Dark fade at bottom
                  Positioned(
                    bottom: 0, left: 0, right: 0, height: 80,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            AppColors.bgDark.withAlpha(242),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Hero content pinned to bottom
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: const [
                              AbaLogo(fontSize: 22),
                              SizedBox(width: 6),
                              Text(
                                'គំរូទូទាត់ប្រចាំ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ]),
                            const SizedBox(height: 6),
                            const Text(
                              'ផ្ញើប្រាក់ ទូទាត់វិក្យបត្រ ដោយប្រើគំរូ\nជ្រើសរើសសម្រាប់ ។',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 12),
                            ),
                          ],
                        ),
                        // Star icon badge
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: AppColors.bgCard,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white10),
                          ),
                          child: const Icon(Icons.star_border_rounded,
                              color: AppColors.gold, size: 28),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── White rounded content area ──
          SliverFillRemaining(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.surfaceLight,
                borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 88,
                      height: 88,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Icon(Icons.star_border_rounded,
                          size: 44, color: Colors.grey[400]),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'គ្មានគំរូទូទាត់ប្រចាំ',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'ចុចលើ + ដើម្បីបង្ហើតគំរូទូទាត់ប្រចាំ',
                      style:
                          TextStyle(color: Colors.grey[400], fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.gold,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          elevation: 4,
          shadowColor: AppColors.gold.withAlpha(102), // ✅ was withOpacity(0.4)
        ),
        icon: const Icon(Icons.add_rounded, size: 20),
        label: const Text('គំរូទូទាត់ប្រចាំ',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ),
    );
  }
}