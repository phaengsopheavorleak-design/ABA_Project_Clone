import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/shared_widgets.dart';
import 'favorites_screen.dart';

class ExchangeScreen extends StatelessWidget {
  const ExchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: CustomScrollView(
        slivers: [
          // ── Hero SliverAppBar (matches CardsScreen / ABAAccountScreen) ──
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            backgroundColor: AppColors.bgDark,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.calendar_today_outlined,
                    color: Colors.white, size: 20),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.search_rounded,
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
                          Color(0xFF0D1F1A),
                          Color(0xFF0D1117),
                          Color(0xFF1A1500),
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
                                'ទូទាត់ប្រាក់',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ]),
                            const SizedBox(height: 6),
                            const Text(
                              'បញ្ចូលលុយទូរស័ព្ទ\nនិងសេវានានា',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 12),
                            ),
                          ],
                        ),
                        const Icon(Icons.monetization_on_outlined,
                            color: Colors.white24, size: 64),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── White rounded content area ──
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.surfaceLight,
                borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
              ),
              padding: const EdgeInsets.fromLTRB(16, 26, 16, 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Favorites
                  const Text(
                    'គំរូទូទាត់ប្រចាំ',
                    style: TextStyle(
                        color: Color(0xFF111111),
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 12),
                  _FavBtn(),
                  const SizedBox(height: 26),

                  // Services grid
                  SectionHeader(
                    title: 'ប្រភេទសេវាកម្ម',
                    actionLabel: 'មើលទាំងអស់',
                    textColor: const Color(0xFF111111),
                  ),
                  const SizedBox(height: 14),
                  _ServicesGrid(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FavBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const FavoritesScreen())),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: AppColors.surfaceWhite,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withAlpha(10),
                blurRadius: 8,
                offset: const Offset(0, 2))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                  color: AppColors.accentRed, shape: BoxShape.circle),
              child: const Icon(Icons.grid_view_rounded,
                  color: Colors.white, size: 18),
            ),
            const SizedBox(width: 10),
            const Text(
              'បង្ហាញគំរូទូទាត់ប្រចាំ',
              style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServicesGrid extends StatelessWidget {
  static const _items = [
    {'icon': Icons.phone_outlined,          'color': Colors.teal,   'title': 'បញ្ចូលលុយទូរស័ព្ទ', 'sub': 'Smart • Metfone • metfone'},
    {'icon': Icons.wifi_rounded,            'color': Colors.green,  'title': 'អ៊ីនធីណែត',          'sub': 'ទូទាត់សេវាអ៊ីនធីណែត'},
    {'icon': Icons.bolt_rounded,            'color': Colors.blue,   'title': 'វិកយបត្រ',           'sub': 'ទូទាត់វិកយបត្រ'},
    {'icon': Icons.account_balance_rounded, 'color': Colors.orange, 'title': 'សេវាស្ថាប័ណ្ណរដ្ឋាភិបាល',         'sub': 'បង់ពន្ធ​កម្រៃ និងសេវាផ្សេងៗ'},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.35,
      ),
      itemBuilder: (context, i) {
        final s = _items[i];
        final color = s['color'] as Color;
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.surfaceWhite,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withAlpha(8),
                  blurRadius: 6,
                  offset: const Offset(0, 2))
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                    color: color.withAlpha(26),
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(s['icon'] as IconData, color: color, size: 18),
              ),
              const SizedBox(height: 7),
              Text(s['title'] as String,
                  style: const TextStyle(
                      color: Color(0xFF111111),
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              const SizedBox(height: 2),
              Text(s['sub'] as String,
                  style: const TextStyle(
                      color: Color(0xFF888888), fontSize: 11),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
            ],
          ),
        );
      },
    );
  }
}