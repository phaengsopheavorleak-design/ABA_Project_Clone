import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/shared_widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _agentEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceLight,
      body: CustomScrollView(
        slivers: [
          // ── Hero SliverAppBar ──
          SliverAppBar(
  expandedHeight: 220,
  pinned: true,
  backgroundColor: AppColors.bgDark,
  leading: IconButton(
    icon: const Icon(Icons.close_rounded,
        color: Colors.white, size: 24),
    onPressed: () => Navigator.pop(context),
  ),
  // ✅ Remove title and centerTitle entirely — no more font conflict
  flexibleSpace: FlexibleSpaceBar(
    background: Stack(
      fit: StackFit.expand,
      children: [
        // Background gradient
        Container(
          decoration: BoxDecoration(
            gradient: AppColors.darkGradient,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withAlpha(77),
                  blurRadius: 16,
                  offset: const Offset(0, 4)),
            ],
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
        // ✅ Title placed at top-center like other screens' AbaLogo rows
        Positioned(
          top: 20,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              'ABA· ការកំណត់ផ្សេងៗ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w600,
                // ✅ No fontFamily needed — inherits your app default
              ),
            ),
          ),
        ),
        // Avatar + name pinned to bottom
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppColors.goldGradient,
                  border: Border.all(
                      color: AppColors.gold.withAlpha(128),
                      width: 3),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.gold.withAlpha(51),
                        blurRadius: 16,
                        offset: const Offset(0, 4)),
                  ],
                ),
                child: const Icon(Icons.person_rounded,
                    size: 42, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                'Rithy PHAN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'លេខសម្ងាត់: 2299709',
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
),

          // ── Settings body ──
          SliverToBoxAdapter(
            child: Container(
              color: AppColors.surfaceLight,
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 48),
              child: Column(
                children: [
                  _PasscodeBanner(),
                  const SizedBox(height: 10),
                  SettingsRow(
                      icon: Icons.person_outline_rounded,
                      title: 'ប្រវត្តិរបស់ខ្ញុំ'),
                  const SizedBox(height: 10),
                  SettingsRow(
                      icon: Icons.lock_outline_rounded,
                      title: 'សុវត្ថិភាព'),
                  const SizedBox(height: 10),
                  SettingsRow(
                      icon: Icons.qr_code_2_rounded,
                      title: 'មុខងារបន្ថែម',
                      hasBadge: true),
                  const SizedBox(height: 10),
                  SettingsRow(
                      icon: Icons.language_rounded,
                      title: 'ភាសា',
                      value: 'ភាសាខ្មែរ'),
                  const SizedBox(height: 10),
                  SettingsRow(
                      icon: Icons.phone_outlined,
                      title: 'ទាក់ទងតមកយើងខ្ញុំ'),
                  const SizedBox(height: 10),
                  SettingsRow(
                      icon: Icons.description_outlined,
                      title: 'លក្ខខណ្ឌ'),
                  const SizedBox(height: 10),
                  SettingsRow(
                      icon: Icons.receipt_long_outlined,
                      title: 'លក្ខខណ្ឌ'),
                  const SizedBox(height: 18),
                  _AgentToggle(
                    enabled: _agentEnabled,
                    onChanged: (v) => setState(() => _agentEnabled = v),
                  ),
                  const SizedBox(height: 18),
                  _VersionCard(),
                  const SizedBox(height: 24),
                  _Branding(),
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

class _PasscodeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(Icons.dialpad_rounded,
                  color: AppColors.textMuted, size: 20),
            ),
            const SizedBox(width: 12),
            const Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(
                    'ការចាក ABA Mobile ជាមួយលេខសម្ងាត់ 6 ខ្ទង់',
                    style: TextStyle(
                        color: Color(0xFF111111),
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'ប្រើលេខសម្ងាត់ 6 ខ្ទង់ ដើម្បីជំហានការចាក',
                    style:
                        TextStyle(color: Color(0xFF888888), fontSize: 12),
                  ),
                ])),
          ]),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentTeal,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(vertical: 13),
              ),
              child: const Text('ស្នើរយល់ស្របថ្មី',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14)),
            ),
          ),
        ],
      ),
    );
  }
}

class _AgentToggle extends StatelessWidget {
  final bool enabled;
  final ValueChanged<bool> onChanged;

  const _AgentToggle({required this.enabled, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10)),
          child: const Icon(Icons.support_agent_rounded,
              color: Color(0xFF555555), size: 20),
        ),
        const SizedBox(width: 14),
        const Expanded(
            child: Text('មុខងារអាជីវករ ABA',
                style: TextStyle(
                    color: Color(0xFF111111),
                    fontSize: 14,
                    fontWeight: FontWeight.w500))),
        Switch(
          value: enabled,
          onChanged: onChanged,
          activeColor: AppColors.accentTeal,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ]),
    );
  }
}

class _VersionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('កំហ្ចៀស កំណែ: V 5.0.94',
                  style:
                      TextStyle(color: Color(0xFF333333), fontSize: 13)),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withAlpha(31), // ✅ was withOpacity(0.12)
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(children: [
                  Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle)),
                  const SizedBox(width: 5),
                  const Text('ចុះប្រាប',
                      style: TextStyle(
                          color: Colors.green, fontSize: 11)),
                ]),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Login ចុះប្រាប: 18:33 | 14 មេសា 2026',
              style:
                  TextStyle(color: Color(0xFF888888), fontSize: 12),
            ),
          ),
          const SizedBox(height: 8),
          const Row(children: [
            Text('🇰🇭 ', style: TextStyle(fontSize: 16)),
            Text(
              'មោទនភូមិស្ថានខ្មែរ បង្ហើតនៅកម្ពុជា',
              style: TextStyle(color: Color(0xFF888888), fontSize: 12),
            ),
          ]),
        ],
      ),
    );
  }
}

class _Branding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('ABA',
            style: TextStyle(
                color: Color(0xFF111111),
                fontWeight: FontWeight.w800,
                fontSize: 18,
                letterSpacing: 1)),
        const Text('·',
            style: TextStyle(
                color: AppColors.accentRed,
                fontSize: 20,
                fontWeight: FontWeight.w900)),
        const Text(' BANK',
            style: TextStyle(
                color: Color(0xFF111111),
                fontWeight: FontWeight.w800,
                fontSize: 18)),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 1,
            height: 20,
            color: Colors.grey[300]),
        const Flexible(
          child: Text(
            'National Bank of Canada Group',
            style: TextStyle(color: Color(0xFF888888), fontSize: 11),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}