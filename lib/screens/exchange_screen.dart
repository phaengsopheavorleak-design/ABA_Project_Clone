import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/shared_widgets.dart';
import 'favorites_screen.dart';

// ─────────────────────────────────────────────────────────────────────────────
// EXCHANGE / BILL PAYMENT SCREEN
// ─────────────────────────────────────────────────────────────────────────────

class ExchangeScreen extends StatelessWidget {
  const ExchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _Header()),
          SliverToBoxAdapter(child: _Content()),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// HEADER
// ─────────────────────────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgDark,
      padding: const EdgeInsets.fromLTRB(16, 58, 16, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const DarkBackButton(),
              Row(children: [
                DarkIconButton(icon: Icons.calendar_today_outlined),
                const SizedBox(width: 8),
                DarkIconButton(icon: Icons.search_rounded),
              ]),
            ],
          ),
          const SizedBox(height: 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: const [
                      AbaLogo(fontSize: 22),
                      SizedBox(width: 6),
                      Text('ទូទាត់ប្រាក់',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          )),
                    ]),
                    const SizedBox(height: 6),
                    const Text(
                      'ជ្ជាបលុយ ជំនះ ក្រីង\nនិងសេវានានា',
                      style: TextStyle(
                          color: AppColors.textSecondary, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.monetization_on_outlined,
                  color: Colors.white24, size: 64),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// CONTENT
// ─────────────────────────────────────────────────────────────────────────────

class _Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
      ),
      padding: const EdgeInsets.fromLTRB(16, 26, 16, 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Favorites
          const Text('គំរូទូទាត់ប្រចាំ',
              style: TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 15,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          _FavBtn(),
          const SizedBox(height: 26),

          // Services grid
          SectionHeader(
              title: 'ប្រភេទសេវាកម្ម',
              actionLabel: 'ទំហំទំហំស',
              textColor: const Color(0xFF111111)),
          const SizedBox(height: 14),
          _ServicesGrid(),
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
                color: Colors.black.withOpacity(0.04),
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
            const Text('បង្ហើគំរូទូទាត់ប្រចាំ',
                style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}

class _ServicesGrid extends StatelessWidget {
  static const _items = [
    {'icon': Icons.phone_outlined,         'color': Colors.teal,   'title': 'បញ្ចូលលុយទូរស័ព្ទ', 'sub': 'Smart • Metfone • mfone'},
    {'icon': Icons.wifi_rounded,           'color': Colors.green,  'title': 'អ៊ីនធីណែត',          'sub': 'ទូទាត់សេវាអ៊ីនធីណែត'},
    {'icon': Icons.bolt_rounded,           'color': Colors.blue,   'title': 'វីតិក្រីង',           'sub': 'ទូទាត់វិក្យបត្រ'},
    {'icon': Icons.account_balance_rounded,'color': Colors.orange, 'title': 'ភរិបាល',             'sub': 'ជំនះ កម្រ'},
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
        childAspectRatio: 1.55,
      ),
      itemBuilder: (context, i) {
        final s = _items[i];
        final color = s['color'] as Color;
        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.surfaceWhite,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 6,
                  offset: const Offset(0, 2))
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(s['icon'] as IconData, color: color, size: 20),
              ),
              const SizedBox(height: 9),
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