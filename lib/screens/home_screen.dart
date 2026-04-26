import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'exchange_screen.dart';
import 'favorites_screen.dart';
import 'transfer_screen.dart';
import 'aba_cards_screen.dart';
import 'qr_screen.dart';
import 'notification_screen.dart';
import 'aba_account_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _openTransferSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const _TransferBottomSheet(),
    );
  }

  void _openReceiveSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const _ReceiveBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _AppBar()),
            SliverToBoxAdapter(
              child: _BalanceCard(
                onReceive: () => _openReceiveSheet(context),
                onSend: () => _openTransferSheet(context),
              ),
            ),
            SliverToBoxAdapter(child: _QuickActions()),
            SliverToBoxAdapter(child: _MiniChipsRow()),
            const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: _SwipeIndicator(),
                ),
              ),
            ),
            SliverToBoxAdapter(child: _PromoBanner()),
            SliverToBoxAdapter(child: _MiniAppsSection()),
            SliverToBoxAdapter(child: _GovServicesSection()),
            SliverToBoxAdapter(child: _MoreActivitiesSection()),
            const SliverToBoxAdapter(child: SizedBox(height: 32)),
          ],
        ),
      ),
    );
  }
}


class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsScreen()),
            ),
            child: Stack(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.gold, width: 2),
                    gradient: const RadialGradient(
                      colors: [Color(0xFF3A2E00), Color(0xFF1A1A1A)],
                    ),
                  ),
                  child: const ClipOval(
                    child: Icon(Icons.person_rounded,
                        color: Color(0xFFB8860B), size: 26),
                  ),
                ),
                Positioned(
                  right: 1,
                  bottom: 1,
                  child: Container(
                    width: 13,
                    height: 13,
                    decoration: BoxDecoration(
                      color: AppColors.accentRed,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.bgDark, width: 2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          _NavIcon(icon: Icons.chat_bubble_outline_rounded),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NotificationScreen()),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                _NavIcon(icon: Icons.notifications_none_rounded),
                Positioned(
                  top: 6,
                  right: 6,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.accentRed,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          _NavIcon(icon: Icons.credit_card_outlined),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const QRScreen()),
            ),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.accentRed,
                borderRadius: BorderRadius.circular(11),
              ),
              child: const Icon(Icons.qr_code_scanner,
                  color: Colors.white, size: 22),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  const _NavIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 38,
      height: 38,
      child: Icon(icon, color: const Color(0xFFAAAAAA), size: 24),
    );
  }
}


class _BalanceCard extends StatelessWidget {
  final VoidCallback onReceive;
  final VoidCallback onSend;
  const _BalanceCard({required this.onReceive, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1500),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFB8860B), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFB8860B).withAlpha(38), // ✅ was withOpacity(0.15)
            blurRadius: 18,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 68,
                height: 42,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8B6914), Color(0xFFD4A017)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 8,
                      top: 10,
                      child: Container(
                        width: 20,
                        height: 14,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFE082),
                          borderRadius: BorderRadius.circular(3),
                          border:
                              Border.all(color: Colors.white24, width: 0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 14),
              const Icon(Icons.visibility_outlined,
                  color: Color(0xFF888888), size: 20),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xFFB8860B), width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  'គណនីគោល',
                  style: TextStyle(
                    color: Color(0xFFB8860B),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'Phan Rithy',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              _CardAction(
                icon: Icons.arrow_downward_rounded,
                label: 'ទទួលលុយ',
                onTap: onReceive,
              ),
              const SizedBox(width: 18),
              _CardAction(
                icon: Icons.arrow_upward_rounded,
                label: 'ផ្ញើរលុយ',
                onTap: onSend,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: SizedBox(
                  height: 18,
                  child: VerticalDivider(
                      color: Color(0xFF444444), thickness: 1, width: 1),
                ),
              ),
              _CardAction(
                icon: Icons.bar_chart_rounded,
                label: 'វិភាគ',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CardAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  const _CardAction({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: const Color(0xFF2A2000),
              shape: BoxShape.circle,
              border: Border.all(
                  color: const Color(0xFFB8860B).withAlpha(128), // ✅ was withOpacity(0.5)
                  width: 1),
            ),
            child: Icon(icon, color: const Color(0xFFB8860B), size: 13),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFFCCCCCC),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}


class _QuickActions extends StatelessWidget {
  const _QuickActions();

  @override
  Widget build(BuildContext context) {
    final items = [
      _GridItem(
        icon: Icons.account_balance_wallet_outlined,
        label: 'គណនី',
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const ABAAccountScreen())),
      ),
      _GridItem(
        icon: Icons.credit_card_outlined,
        label: 'កាត',
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const CardsScreen())),
      ),
      _GridItem(
        icon: Icons.attach_money_rounded,
        label: 'ទូទាត់',
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const ExchangeScreen())),
      ),
      _GridItem(
        icon: Icons.savings_outlined,
        label: 'ABA ស្កែន',
        onTap: () {},
      ),
      _GridItem(
        icon: Icons.bookmark_border_rounded,
        label: 'គំរូទូទាត់ប្រចាំ',
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const FavoritesScreen())),
      ),
      _GridItem(
        icon: Icons.swap_horiz_rounded,
        label: 'ផ្ទេរប្រាក់',
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const TransferScreen())),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
      child: Column(
        children: [
          Row(
            children: [
              _buildCell(items[0]),
              const SizedBox(width: 10),
              _buildCell(items[1]),
              const SizedBox(width: 10),
              _buildCell(items[2]),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildCell(items[3]),
              const SizedBox(width: 10),
              _buildCell(items[4]),
              const SizedBox(width: 10),
              _buildCell(items[5]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCell(_GridItem item) {
    return Expanded(
      child: GestureDetector(
        onTap: item.onTap,
        child: Container(
          height: 94,
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2000),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                      color: const Color(0xFFB8860B).withAlpha(89), // ✅ was withOpacity(0.35)
                      width: 1),
                ),
                child:
                    Icon(item.icon, color: const Color(0xFFD4A017), size: 24),
              ),
              const SizedBox(height: 7),
              Text(
                item.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GridItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _GridItem(
      {required this.icon, required this.label, required this.onTap});
}


class _MiniChipsRow extends StatelessWidget {
  const _MiniChipsRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 2),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            _Chip(icon: Icons.ondemand_video_rounded, label: 'កាដូ'),
            SizedBox(width: 8),
            _Chip(icon: Icons.apps_rounded, label: 'មីនីអេប', hasDot: true),
            SizedBox(width: 8),
            _Chip(icon: Icons.account_balance_rounded, label: 'សេវាអាជីវករ'),
          ],
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool hasDot;
  const _Chip(
      {required this.icon, required this.label, this.hasDot = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFF222222),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasDot) ...[
            Container(
              width: 7,
              height: 7,
              decoration: const BoxDecoration(
                  color: Color(0xFFE53935), shape: BoxShape.circle),
            ),
            const SizedBox(width: 5),
          ],
          Icon(icon, color: const Color(0xFFD4A017), size: 14),
          const SizedBox(width: 6),
          Text(label,
              style:
                  const TextStyle(color: Color(0xFFCCCCCC), fontSize: 12)),
        ],
      ),
    );
  }
}


class _SwipeIndicator extends StatelessWidget {
  const _SwipeIndicator();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}


class _PromoBanner extends StatelessWidget {
  const _PromoBanner();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'ជំណើង & ព្រម័ូស្យូន',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              height: 160,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0A1A6B), Color(0xFF1040BB)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -8,
                    bottom: -6,
                    child: Icon(Icons.directions_car_rounded,
                        size: 110,
                        color: Colors.white.withAlpha(20)), // ✅ was withOpacity(0.08)
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: Colors.white.withAlpha(31), // ✅ was withOpacity(0.12)
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: RichText(
                                text: const TextSpan(children: [
                                  TextSpan(
                                    text: 'ABA ',
                                    style: TextStyle(
                                        color: Color(0xFFFFD700),
                                        fontWeight: FontWeight.w800,
                                        fontSize: 13),
                                  ),
                                  TextSpan(
                                    text: 'Mastercard',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13),
                                  ),
                                ]),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text('ចង្អុរ:',
                            style: TextStyle(
                                color: Colors.white70, fontSize: 12)),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 5),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE53935),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'BYD SEAL 05',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (i) => Container(
                          width: i == 0 ? 16 : 6,
                          height: 4,
                          margin:
                              const EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            color: i == 0 ? Colors.white : Colors.white38,
                            borderRadius: BorderRadius.circular(2),
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


class _MiniAppsSection extends StatelessWidget {
  const _MiniAppsSection();

  static const _apps = [
    _AppEntry('Angkor DC', Color(0xFFFF6600),
        Icons.local_fire_department_rounded),
    _AppEntry('Smart', Color(0xFF1B8A3E), Icons.smartphone_rounded),
    _AppEntry('Metfone', Color(0xFFE53935), Icons.phone_android_rounded),
    _AppEntry('Ebook Cambodia', Color(0xFF37474F), Icons.menu_book_rounded),
    _AppEntry('Express', Color(0xFF1565C0), Icons.local_shipping_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 0, 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Text('មីនីអេប',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
          ),
          const SizedBox(height: 14),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _apps.map((a) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: [
                      Container(
                        width: 62,
                        height: 62,
                        decoration: BoxDecoration(
                          color: a.color,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: a.color.withAlpha(77), // ✅ was withOpacity(0.3)
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child:
                            Icon(a.icon, color: Colors.white, size: 30),
                      ),
                      const SizedBox(height: 7),
                      SizedBox(
                        width: 66,
                        child: Text(a.name,
                            style: const TextStyle(
                                color: Color(0xFF999999), fontSize: 10),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppEntry {
  final String name;
  final Color color;
  final IconData icon;
  const _AppEntry(this.name, this.color, this.icon);
}


class _GovServicesSection extends StatelessWidget {
  const _GovServicesSection();

  static const _govs = [
    _GovEntry('ប.ស.ស. បុគ្គល\nស្លោ​យ​ស​ន', Color(0xFF1565C0)),
    _GovEntry('ផ្លូវ\nសេវ', Color(0xFFFFB300)),
    _GovEntry('អតុរ\nកម្ម', Color(0xFFE64A19)),
    _GovEntry('ប​ញ​ញ​ា\nវ​ត​', Color(0xFF283593)),
    _GovEntry('ប​ណ​ណ​ក', Color(0xFF00838F)),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 0, 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Text('សេវារដ្ឋាភិបាល',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
          ),
          const SizedBox(height: 14),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _govs.map((g) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: [
                      Container(
                        width: 62,
                        height: 62,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: g.color.withAlpha(77), // ✅ was withOpacity(0.3)
                              width: 1.5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(38), // ✅ was withOpacity(0.15)
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Icon(Icons.account_balance_rounded,
                            color: g.color, size: 28),
                      ),
                      const SizedBox(height: 7),
                      SizedBox(
                        width: 66,
                        child: Text(g.name,
                            style: const TextStyle(
                                color: Color(0xFF999999), fontSize: 10),
                            textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _GovEntry {
  final String name;
  final Color color;
  const _GovEntry(this.name, this.color);
}


class _MoreActivitiesSection extends StatelessWidget {
  const _MoreActivitiesSection();

  static const _activities = [
    _ActivityEntry('ABA ខ្មែរ', Color(0xFF6A1B9A)),
    _ActivityEntry('ABA App', Color(0xFF1565C0)),
    _ActivityEntry('ការស្ដម', Color(0xFF00695C)),
    _ActivityEntry('ទូទាត់', Color(0xFF37474F)),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 0, 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Text('ការស្ដែងការថ្មី',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
          ),
          const SizedBox(height: 14),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _activities.map((a) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Container(
                    width: 130,
                    height: 90,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          a.color.withAlpha(204), // ✅ was withOpacity(0.8)
                          a.color
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(a.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivityEntry {
  final String name;
  final Color color;
  const _ActivityEntry(this.name, this.color);
}


class _TransferBottomSheet extends StatelessWidget {
  const _TransferBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 36),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text('ទទួលលុយ:',
              style: TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 17,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 14),
          _SheetOption(
            icon: Icons.account_balance_wallet_outlined,
            iconColor: const Color(0xFF00BCD4),
            title: 'ថែគណនី ABA របស់ខ្ញុំ',
            subtitle: 'ផ្ញើប្រាក់ទៅគណនីផ្ទាល់ខ្លួនរបស់អ្នក',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const TransferScreen()));
            },
          ),
          const SizedBox(height: 8),
          _SheetOption(
            icon: Icons.swap_horiz_rounded,
            iconColor: const Color(0xFF00BCD4),
            title: 'ថែគណនីទៅកម្មធនាតារ',
            subtitle: 'ទទួលប្រាក់ថែគណនីទៅគ្រឹះស្ថានហិរញ្ញវត្ថុ',
            onTap: () => Navigator.pop(context),
          ),
          const SizedBox(height: 8),
          _SheetOption(
            icon: Icons.qr_code_rounded,
            iconColor: const Color(0xFF00BCD4),
            title: 'តាម ABA QR',
            subtitle: 'ទទួលលុយភ្លាមៗដោយ ABA QR របស់អ្នក',
            onTap: () => Navigator.pop(context),
          ),
          const SizedBox(height: 8),
          _SheetOption(
            icon: Icons.link_rounded,
            iconColor: const Color(0xFF00BCD4),
            title: 'តាមយ:ការផ្ញើ ABA QR',
            subtitle: 'ចែករំលែក ABA QR ឬតំណបង់ប្រាក់',
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}


class _ReceiveBottomSheet extends StatelessWidget {
  const _ReceiveBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 36),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text('ផ្ញើលុយចេញ:',
              style: TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 17,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 14),
          _SheetOption(
            icon: Icons.bookmark_border_rounded,
            iconColor: const Color(0xFFB8860B),
            title: 'ទៅគំរូទូទាត់ប្រចាំ',
            subtitle: 'ផ្ញើលុយទៅមិត្តភ័ក្តិ',
            onTap: () => Navigator.pop(context),
          ),
          const SizedBox(height: 8),
          _SheetOption(
            icon: Icons.swap_horiz_rounded,
            iconColor: const Color(0xFFB8860B),
            title: 'ទៅគណនី ABA ណាមួយ',
            subtitle: 'ផ្ញើលុយទៅការគណនី ABA របស់អ្នកដទៃ',
            onTap: () => Navigator.pop(context),
          ),
          const SizedBox(height: 8),
          _SheetOption(
            icon: Icons.card_giftcard_rounded,
            iconColor: const Color(0xFFB8860B),
            title: 'ជំការ',
            subtitle: 'ផ្ញើអំណោយជាមួយធនាគារ',
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

class _SheetOption extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SheetOption({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F7F7),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: iconColor.withAlpha(31), // ✅ was withOpacity(0.12)
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(height: 2),
                  Text(subtitle,
                      style: const TextStyle(
                          color: Color(0xFF888888), fontSize: 12)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right,
                color: Color(0xFFBBBBBB), size: 20),
          ],
        ),
      ),
    );
  }
}