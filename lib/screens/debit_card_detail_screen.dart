import 'package:flutter/material.dart';

class DebitCardDetailScreen extends StatefulWidget {
  const DebitCardDetailScreen({super.key});

  @override
  State<DebitCardDetailScreen> createState() =>
      _DebitCardDetailScreenState();
}

class _DebitCardDetailScreenState extends State<DebitCardDetailScreen> {
  bool _agreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1A2A),

      // ✅ FIXED STRUCTURE (Back button now in SliverAppBar like ExchangeScreen)
      body: CustomScrollView(
        slivers: [
          // ── FIXED BACK BUTTON (same position style as ExchangeScreen) ──
          SliverAppBar(
            backgroundColor: const Color(0xFFB8C8D8),
            pinned: true,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new,
                  color: Colors.black54),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          // ── HERO SECTION ──
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              color: const Color(0xFFB8C8D8),
              padding: const EdgeInsets.only(
                  top: 10, left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),

                  const Text(
                    'កាតឥណពន្ធប្លាស្ទិក',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'ប្រើប្រាស់ទឹកប្រាក់របស់អ្នកផ្ទាល់ – មិនចាំបាច់\n'
                    'ចំណាយការប្រាក់ មិនមានការដាកពិន័យលើ\n'
                    'ការបង់យឺតយ៉ាវ។',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                        height: 1.5),
                  ),

                  const SizedBox(height: 16),

                  // ── CARD AREA (UNCHANGED) ──
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Positioned(
                        top: 0,
                        right: 60,
                        child: _NetworkLogo('VISA'),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: _MasterCardLogo(),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 120,
                        child: _UnionPayLogo(),
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 220,
                          height: 130,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF0A4A6E),
                                Color(0xFF0D2A3A)
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFD4A017),
                                        borderRadius:
                                            BorderRadius.circular(4),
                                      ),
                                      child: const Text(
                                        'ABA',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    const Text(
                                      'BANK',
                                      style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: 8),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  width: 28,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFD4A017),
                                    borderRadius:
                                        BorderRadius.circular(4),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  'VALID THRU  MONTH/YEAR',
                                  style: TextStyle(
                                      color: Colors.white38,
                                      fontSize: 8),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // ── FEATURES + BUTTON SECTION ──
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding:
                  const EdgeInsets.fromLTRB(20, 20, 20, 40),
              child: Column(
                children: [
                  const _FeatureItem(
                    icon: Icons.calendar_today_outlined,
                    text: 'ប្រើប្រាស់ទឹកប្រាក់របស់អ្នកបានភ្លាមៗ',
                  ),
                  const _FeatureItem(
                    icon: Icons.camera_outlined,
                    text: 'មិនគិតថ្លៃសេវាប្រចាំខែ',
                  ),
                  const _FeatureItem(
                    icon: Icons.credit_card_outlined,
                    text: 'ប្រើបានជុំវិញពិភពលោក',
                  ),
                  const _FeatureItem(
                    icon: Icons.access_time_outlined,
                    text:
                        'មានសារជូនដំណឹងភ្លាមៗ រាល់ពេលទូទាត់',
                  ),
                  const _FeatureItem(
                    icon: Icons.lock_outline,
                    text: 'ទូទាត់យ៉ាងមានសុវត្ថិភាព',
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
                                  : Colors.grey,
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
                            color: Colors.black54, fontSize: 13),
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
                            : Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'បន្ទាប់',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
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

// ── FEATURE ITEM ──
class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FeatureItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFD4A017)),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.black, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

// ── LOGOS ──
class _NetworkLogo extends StatelessWidget {
  final String label;
  const _NetworkLogo(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(label,
          style: const TextStyle(
              color: Color(0xFF1A1F6E),
              fontWeight: FontWeight.bold)),
    );
  }
}

class _MasterCardLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Icon(Icons.circle, color: Colors.orange),
    );
  }
}

class _UnionPayLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Text('UP',
          style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold)),
    );
  }
}