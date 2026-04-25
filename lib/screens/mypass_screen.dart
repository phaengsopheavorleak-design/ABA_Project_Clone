import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/shared_widgets.dart';

class MyPassScreen extends StatelessWidget {
  const MyPassScreen({super.key});

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
            actions: [
              IconButton(
                icon: const Icon(Icons.crop_free_rounded,
                    color: Colors.white, size: 22),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.history_rounded,
                    color: Colors.white, size: 22),
                onPressed: () {},
              ),
              const SizedBox(width: 4),
            ],
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
                          Color(0xFF1A1200),
                          Color(0xFF0D1117),
                          Color(0xFF1A1000),
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
                                'MyPass',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ]),
                            const SizedBox(height: 6),
                            const Text(
                              'គ្រប់គ្រង ប័ណ្ណ សំបុត្រ\nនិងប័ណ្ណបញ្ជាក់ ជាមួយ ABA Mobile',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 12),
                            ),
                          ],
                        ),
                        // Wallet icon badge
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: AppColors.bgCard,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white10),
                          ),
                          child: const Icon(Icons.wallet_outlined,
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
                        color: Colors.brown[100],
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Icon(Icons.inbox_outlined,
                          size: 44, color: Colors.brown[300]),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'មិនទាន់មាន',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'ប័ណ្ណ អ័ករ សំបុត្រ\nមិនទាន់ត្រូវបង្ហាញនៅទីនេះ',
                      style:
                          TextStyle(color: Colors.grey[400], fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}