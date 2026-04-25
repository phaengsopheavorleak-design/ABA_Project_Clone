import 'package:flutter/material.dart';

class VirtualCardDetailScreen extends StatefulWidget {
  const VirtualCardDetailScreen({super.key});

  @override
  State<VirtualCardDetailScreen> createState() =>
      _VirtualCardDetailScreenState();
}

class _VirtualCardDetailScreenState extends State<VirtualCardDetailScreen> {
  bool _agreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),

      // ✅ FIX: use CustomScrollView like ExchangeScreen
      body: CustomScrollView(
        slivers: [
          // ── FIXED BACK BUTTON AREA ──
          SliverAppBar(
            backgroundColor: const Color(0xFF1A1A3A),
            pinned: true,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white70,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          // ── HERO CONTENT (UNCHANGED DESIGN) ──
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1A1A3A), Color(0xFF2A1A4A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'កាតឥណពន្ធនិម្មិត',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'ចាប់ផ្តើមធ្វើការទូទាត់នៅក្នុងហាង និងតាម\nអ៊ិនធឺណិត ដូចទៅនឹងកាតប្លាស្ទិកដែរ។',
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 13,
                        height: 1.5),
                  ),

                  const SizedBox(height: 20),

                  // ── CARD UI (UNCHANGED) ──
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const SizedBox(height: 140),

                      Positioned(
                        top: 0,
                        right: 80,
                        child: _WhiteBadge(
                          child: const Text('VISA',
                              style: TextStyle(
                                  color: Color(0xFF1A1F6E),
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),

                      Positioned(
                        right: 0,
                        top: 20,
                        child: Container(
                          width: 220,
                          height: 130,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF3A2A6A),
                                Color(0xFF5A4A8A)
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // ── FEATURES + BUTTON ──
          SliverToBoxAdapter(
            child: Container(
              color: const Color(0xFF0D0D1A),
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
              child: Column(
                children: [
                  const _FeatureItem(
                    icon: Icons.lock_outline,
                    text: 'សុវត្ថិភាពខ្ពស់សម្រាប់ទូទាត់អនឡាញ',
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      GestureDetector(
                        onTap: () =>
                            setState(() => _agreed = !_agreed),
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: _agreed
                                  ? const Color(0xFFD4A017)
                                  : Colors.white38,
                            ),
                            color: _agreed
                                ? const Color(0xFFD4A017)
                                : Colors.transparent,
                          ),
                          child: _agreed
                              ? const Icon(Icons.check,
                                  size: 14, color: Colors.black)
                              : null,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'ខ្ញុំបានអាន និងយល់ព្រមតាម លក្ខខណ្ឌ',
                        style: TextStyle(
                            color: Colors.white54, fontSize: 13),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _agreed ? () {} : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _agreed
                            ? const Color(0xFFD4A017)
                            : Colors.white24,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'បន្ទាប់',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
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

// ── FEATURE ──
class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FeatureItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFFD4A017)),
        const SizedBox(width: 12),
        Expanded(
          child: Text(text,
              style:
                  const TextStyle(color: Colors.white, fontSize: 14)),
        ),
      ],
    );
  }
}

// ── BADGE ──
class _WhiteBadge extends StatelessWidget {
  final Widget child;
  const _WhiteBadge({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: child,
    );
  }
}