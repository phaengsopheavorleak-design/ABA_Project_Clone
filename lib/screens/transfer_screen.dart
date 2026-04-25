import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/shared_widgets.dart';
import 'favorites_screen.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

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
                          Color(0xFF1A1200),
                          Color(0xFF0D1117),
                          Color(0xFF0D1A1A),
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
                                'ធ្វើប្រាក់',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ]),
                            const SizedBox(height: 6),
                            const Text(
                              'ផ្ញើប្រាក់ទៅមិត្ត និងក្រុម\nជាមួយជំហានដ៏ងាយ',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 12),
                            ),
                          ],
                        ),
                        // Icon badge
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: AppColors.bgCard,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white10),
                          ),
                          child: const Icon(Icons.swap_horiz_rounded,
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
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.surfaceLight,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(26)),
              ),
              padding: const EdgeInsets.fromLTRB(16, 26, 16, 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Favorites button ──
                  const Text('គំរូទូទាត់ប្រចាំ',
                      style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 15,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 12),
                  _FavoritesButton(),
                  const SizedBox(height: 10),
                  _AtmLocator(),
                  const SizedBox(height: 26),

                  // ── Service categories ──
                  SectionHeader(
                      title: 'ប្រភេទសេវាកម្ម',
                      actionLabel: 'មើលទាំងអស់', // ✅ fixed garbled label
                      textColor: const Color(0xFF111111)),
                  const SizedBox(height: 14),
                  _ServiceCategory(
                      icon: Icons.phone_outlined,
                      color: Colors.teal,
                      title: 'បញ្ចូលលុយទូរស័ព្ទ',
                      subtitle: 'Smart • Metfone • mfone • Cellcard'),
                  _ServiceCategory(
                      icon: Icons.wifi_rounded,
                      color: Colors.green,
                      title: 'អ៊ីនធីណែត & ទូរទស្សន',
                      subtitle: 'ទូទាត់សេវាអ៊ីនធីណែត និងទូរទស្សន'),
                  _ServiceCategory(
                      icon: Icons.bolt_rounded,
                      color: Colors.blue,
                      title: 'វិក្យបត្រ & សំភារ', // ✅ fixed garbled title
                      subtitle: 'ទូទាត់វិក្យបត្រ សំភារ វីតិ និងក្រីង'),
                  _ServiceCategory(
                      icon: Icons.account_balance_rounded,
                      color: Colors.orange,
                      title: 'ផ្ទេរប្រាក់', // ✅ fixed garbled title
                      subtitle: 'ជំនះ កម្រ និងទទួលសាររណ:'),
                  _ServiceCategory(
                      icon: Icons.home_outlined,
                      color: Colors.purple,
                      title: 'អចលនទ្រព្យ',
                      subtitle: 'ទូទាត់សេវាកម្មអចលនទ្រព្យ'),
                  const SizedBox(height: 26),

                  // ── International ──
                  const Text('ផ្ញើប្រាក់ទៅក្រៅប្រទេស',
                      style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 15,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 12),
                  _IntlRow('MoneyGram', Icons.attach_money_rounded, Colors.red),
                  _IntlRow('Ria', Icons.currency_exchange, Colors.blue),
                  _IntlRow('Western Union', Icons.public_rounded, Colors.orange),
                  _IntlRow('DBP Remit', Icons.send_rounded, Colors.indigo),
                  _IntlRow('SWIFT', Icons.swap_vert_rounded, Colors.teal),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SUB-WIDGETS
// ─────────────────────────────────────────────────────────────────────────────

class _FavoritesButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => const FavoritesScreen())),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: AppColors.surfaceWhite,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withAlpha(10), // ✅ was withOpacity(0.04)
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
            const Text('បង្ហាញគំរូទូទាត់ប្រចាំ', // ✅ fixed typo បង្ហើ → បង្ហាញ
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

class _AtmLocator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withAlpha(10), // ✅ was withOpacity(0.04)
              blurRadius: 8,
              offset: const Offset(0, 2))
        ],
      ),
      child: Row(children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
              color: Colors.blue.withAlpha(26), // ✅ was withOpacity(0.1)
              borderRadius: BorderRadius.circular(12)),
          child: const Icon(Icons.location_on_rounded,
              color: Colors.blue, size: 22),
        ),
        const SizedBox(width: 12),
        const Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text('បើករីដំការបស់អ្នក',
                  style: TextStyle(
                      color: Color(0xFF111111),
                      fontSize: 14,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 3),
              Text('រកមើលសេវាកម្មក្បែររបស់អ្នក',
                  style: TextStyle(color: Color(0xFF888888), fontSize: 12)),
            ])),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
          decoration: BoxDecoration(
            color: const Color(0xFF0D6E8A),
            borderRadius: BorderRadius.circular(22),
          ),
          child: const Text('បើក',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500)),
        ),
      ]),
    );
  }
}

class _ServiceCategory extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;

  const _ServiceCategory({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surfaceWhite,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withAlpha(8), // ✅ was withOpacity(0.03)
                blurRadius: 6,
                offset: const Offset(0, 2))
          ],
        ),
        child: Row(children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
                color: color.withAlpha(26), // ✅ was withOpacity(0.1)
                borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(title,
                    style: const TextStyle(
                        color: Color(0xFF111111),
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 3),
                Text(subtitle,
                    style: const TextStyle(
                        color: Color(0xFF888888), fontSize: 12)),
              ])),
        ]),
      ),
    );
  }
}

class _IntlRow extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color color;

  const _IntlRow(this.name, this.icon, this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
          color: AppColors.surfaceWhite,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withAlpha(8), // ✅ was withOpacity(0.03)
                blurRadius: 6,
                offset: const Offset(0, 2))
          ],
        ),
        child: Row(children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
                color: color.withAlpha(26), // ✅ was withOpacity(0.1)
                borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
              child: Text('សេវាផ្ញើ/ទទួលប្រាក់ $name',
                  style: const TextStyle(
                      color: Color(0xFF333333), fontSize: 13))),
          const Icon(Icons.chevron_right_rounded,
              color: Color(0xFFCCCCCC), size: 20),
        ]),
      ),
    );
  }
}