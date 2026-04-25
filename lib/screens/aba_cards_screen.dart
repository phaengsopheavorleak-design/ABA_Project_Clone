import 'package:flutter/material.dart';

// ─────────────────────────────────────────────
// Entry point (for standalone testing)
// ─────────────────────────────────────────────
void main() => runApp(const ABAApp());

class ABAApp extends StatelessWidget {
  const ABAApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0D0D0D),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFD4A017),
          surface: Color(0xFF1A1A1A),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// ─────────────────────────────────────────────
// HOME SCREEN  (Image 2)
// ─────────────────────────────────────────────
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: Column(
          children: [
            // ── Top bar ──────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  // Avatar with online dot
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 22,
                        backgroundColor: Color(0xFFD4A017),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 1.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.chat_bubble_outline,
                        color: Colors.white70),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_none,
                        color: Colors.white70),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.credit_card_outlined,
                        color: Colors.white70),
                    onPressed: () {},
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD4A017),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.qr_code_scanner,
                        color: Colors.black, size: 20),
                  ),
                ],
              ),
            ),

            // ── Account card ─────────────────────────
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF2A1F00), Color(0xFF1A1400)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFD4A017), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD4A017),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.visibility_outlined,
                          color: Colors.white54, size: 20),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFD4A017)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text('គណនីគោល',
                            style: TextStyle(
                                color: Color(0xFFD4A017), fontSize: 12)),
                      ),
                      const SizedBox(width: 12),
                      const Text('Phan Rithy',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _ActionButton(
                          icon: Icons.arrow_downward, label: 'ទទួលលុយ'),
                      const SizedBox(width: 12),
                      _ActionButton(
                          icon: Icons.arrow_upward, label: 'ផ្ញើរលុយ'),
                      const SizedBox(width: 12),
                      Container(
                        width: 1,
                        height: 24,
                        color: Colors.white24,
                      ),
                      const SizedBox(width: 12),
                      _ActionButton(icon: Icons.bar_chart, label: 'វិភាគ'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ── Feature grid ─────────────────────────
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.1,
                  children: [
                    _GridItem(
                      icon: Icons.account_balance_wallet_outlined,
                      label: 'គណនី',
                      onTap: () {},
                    ),
                    // ★ THIS IS THE TILE THAT NAVIGATES TO CardsScreen ★
                    _GridItem(
                      icon: Icons.credit_card_outlined,
                      label: 'កាត',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CardsScreen(),
                          ),
                        );
                      },
                    ),
                    _GridItem(
                      icon: Icons.attach_money,
                      label: 'ទូទាត់',
                      onTap: () {},
                    ),
                    _GridItem(
                      icon: Icons.savings_outlined,
                      label: 'ABA សំនូ',
                      onTap: () {},
                    ),
                    _GridItem(
                      icon: Icons.bookmark_outline,
                      label: 'កំណូទាត់ប្រចាំ',
                      onTap: () {},
                    ),
                    _GridItem(
                      icon: Icons.swap_horiz,
                      label: 'ផ្លាប្រាក់',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),

            // ── Bottom tab bar ───────────────────────
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  _BottomTab(
                      icon: Icons.play_circle_outline, label: 'ណារ', active: false),
                  const SizedBox(width: 8),
                  _BottomTab(
                      icon: Icons.grid_view, label: 'មីនីអេប', active: true),
                  const SizedBox(width: 8),
                  _BottomTab(
                      icon: Icons.account_balance_outlined,
                      label: 'សេវាសាជីគនខោរាភ',
                      active: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// CARDS SCREEN  (Image 1)
// ─────────────────────────────────────────────
class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: CustomScrollView(
        slivers: [
          // ── Hero / AppBar ────────────────────────
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            backgroundColor: const Color(0xFF0D0D0D),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
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
            colors: [
              Color(0xFF1A2A3A),
              Color(0xFF0D1A2A),
              Color(0xFF0A0F1A),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),

      // ── Text content positioned manually ──
      Positioned(
        bottom: 20,
        left: 20,
        right: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subtitle — clear white with good opacity
            const Text(
              'ចូលប្រើទឹកប្រាក់បានភ្លាមៗ\nនិងបើកមុខងារ ទូទាត់អនឡាញ\nជាមួយការ ABA',
              style: TextStyle(
                color: Colors.white,        // ← was white54, now full white
                fontSize: 14,               // ← slightly larger
                height: 1.6,
                letterSpacing: 0.3,
              ),
            ),
            const SizedBox(height: 12),
            // Title — big and bold
            const Text(
              'កាតថ្មី',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,               // ← bigger
                fontWeight: FontWeight.w900, // ← boldest
                height: 1.1,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),

      // ABA Bank badge
      Positioned(
        bottom: 40,
        right: 16,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFD4A017),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: const [
              Text('ABA',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12)),
              Text('BANK',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 10)),
              Icon(Icons.lock, color: Colors.black, size: 14),
            ],
          ),
        ),
      ),
    ],
  ),
),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Section: Special National Card ──
                  const Text(
                    'កាតឥណពន្ធរចនាពិសេស',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _UserCardTile(
                    name: 'VannDa',
                    cardType: 'កាតឥណពន្ធ',
                    avatarUrl: null,
                  ),
                  const SizedBox(height: 28),

                  // ── Section: ABA Cards ───────────────
                  const Text(
                    'កាត ABA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Debit card option
                  _CardOptionTile(
                    iconColor: const Color(0xFF6C5CE7),
                    iconLabel: 'DEBIT',
                    title: 'កាតឥណពន្ធ',
                    description:
                        'ស្នើបើកកាតឥណពន្ធស្ទិក ដោយមានជម្រើសទៅយក\n'
                        'នៅសាខាដោយខ្លួនឯង ឬទទួលតាមសេវាដឹកជញ្ជូន\nក៍បាន។',
                    networks: const ['VISA', 'MC', 'UP', 'CSS'],
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),

                  // Virtual card option
                  _CardOptionTile(
                    iconColor: const Color(0xFF0984E3),
                    iconLabel: 'VIRTUAL',
                    title: 'កាតនិម្មិត',
                    description:
                        'បើកកាតនិម្មិតបានភ្លាមៗ​​ ឥតគិតតម្លៃ ដែលជាកាតឥណពន្ធ\n'
                        'ប្រភេទ Visa, Mastercard, ឬ UnionPay។ កាត\nនិម្មិត មានសុវត្ថិភាពខ្ពស់​សម្រាប់ការទូទាត់អនឡាញ។',
                    networks: const ['VISA', 'MC', 'UP'],
                    onTap: () {},
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// SHARED WIDGETS
// ─────────────────────────────────────────────

/// Grid tile on the Home screen
class _GridItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _GridItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF2A2000),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xFFD4A017), size: 26),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

/// Action button inside the account card
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ActionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFD4A017)),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFFD4A017), size: 14),
        ),
        const SizedBox(width: 6),
        Text(label,
            style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }
}

/// Bottom navigation tab
class _BottomTab extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  const _BottomTab(
      {required this.icon, required this.label, required this.active});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: active ? const Color(0xFF1A1400) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: active
              ? Border.all(color: const Color(0xFFD4A017), width: 0.5)
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (active)
              Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.only(right: 4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            Icon(icon,
                size: 16,
                color:
                    active ? const Color(0xFFD4A017) : Colors.white54),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  color: active ? const Color(0xFFD4A017) : Colors.white54,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The special national card tile (user's existing card)
class _UserCardTile extends StatelessWidget {
  final String name;
  final String cardType;
  final String? avatarUrl;

  const _UserCardTile({
    required this.name,
    required this.cardType,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.grey[700],
            backgroundImage:
                avatarUrl != null ? NetworkImage(avatarUrl!) : null,
            child: avatarUrl == null
                ? const Icon(Icons.person, color: Colors.white60)
                : null,
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'កាតឥណពន្ធ $name',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  // VISA badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1F6E),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text('VISA',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 6),
                  Text(cardType,
                      style: const TextStyle(
                          color: Colors.white54, fontSize: 12)),
                ],
              ),
            ],
          ),
          const Spacer(),
          // Decorative geometric pattern
          Opacity(
            opacity: 0.15,
            child: Icon(Icons.grid_4x4, color: Colors.white, size: 50),
          ),
        ],
      ),
    );
  }
}

/// Debit / Virtual card option tile
class _CardOptionTile extends StatelessWidget {
  final Color iconColor;
  final String iconLabel;
  final String title;
  final String description;
  final List<String> networks;
  final VoidCallback onTap;

  const _CardOptionTile({
    required this.iconColor,
    required this.iconLabel,
    required this.title,
    required this.description,
    required this.networks,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: iconColor.withOpacity(0.5)),
              ),
              child: Text(
                iconLabel,
                style: TextStyle(
                    color: iconColor,
                    fontSize: 9,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 14),

            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Color(0xFFD4A017),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: const TextStyle(
                        color: Colors.white54, fontSize: 12, height: 1.5),
                  ),
                  const SizedBox(height: 10),
                  // Network badges row
                  Row(
                    children: networks
                        .map((n) => _NetworkBadge(label: n))
                        .toList(),
                  ),
                ],
              ),
            ),

            const Icon(Icons.chevron_right, color: Colors.white38),
          ],
        ),
      ),
    );
  }
}

/// Small payment-network badge (VISA, MC, UP, CSS)
class _NetworkBadge extends StatelessWidget {
  final String label;
  const _NetworkBadge({required this.label});

  static const Map<String, Color> _colors = {
    'VISA': Color(0xFF1A1F6E),
    'MC': Color(0xFF8B0000),
    'UP': Color(0xFF006400),
    'CSS': Color(0xFF333333),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: _colors[label] ?? Colors.grey[800],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: const TextStyle(
            color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
      ),
    );
  }
}