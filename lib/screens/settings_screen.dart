import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/shared_widgets.dart';

// ─────────────────────────────────────────────────────────────────────────────
// SETTINGS SCREEN
// ─────────────────────────────────────────────────────────────────────────────

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
          SliverToBoxAdapter(child: _ProfileHeader()),
          SliverToBoxAdapter(child: _Body(
            agentEnabled: _agentEnabled,
            onAgentToggle: (v) => setState(() => _agentEnabled = v),
          )),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// PROFILE HEADER
// ─────────────────────────────────────────────────────────────────────────────

class _ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.darkGradient,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 16,
              offset: const Offset(0, 4)),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(16, 56, 16, 28),
      child: Column(
        children: [
          // Top bar
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close_rounded,
                    color: AppColors.textPrimary, size: 24),
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    'ABA· ការកំណត់ផ្សេងៗ',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 24),
            ],
          ),
          const SizedBox(height: 24),

          // Avatar
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.goldGradient,
              border: Border.all(color: AppColors.gold.withOpacity(0.5), width: 3),
              boxShadow: [
                BoxShadow(
                    color: AppColors.gold.withOpacity(0.2),
                    blurRadius: 16,
                    offset: const Offset(0, 4)),
              ],
            ),
            child: const Icon(Icons.person_rounded,
                size: 50, color: Colors.white),
          ),
          const SizedBox(height: 14),
          const Text(
            'Rithy PHAN',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'លេខសម្ងាត់: 2299709',
            style:
                TextStyle(color: AppColors.textSecondary, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// BODY
// ─────────────────────────────────────────────────────────────────────────────

class _Body extends StatelessWidget {
  final bool agentEnabled;
  final ValueChanged<bool> onAgentToggle;

  const _Body({required this.agentEnabled, required this.onAgentToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surfaceLight,
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 48),
      child: Column(
        children: [
          // Passcode banner
          _PasscodeBanner(),
          const SizedBox(height: 10),

          // Settings rows
          SettingsRow(icon: Icons.person_outline_rounded, title: 'ប្រវត្តិរបស់ខ្ញុំ'),
          const SizedBox(height: 10),
          SettingsRow(icon: Icons.lock_outline_rounded, title: 'សុវត្ថិភាព'),
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
              icon: Icons.phone_outlined, title: 'ទាក់ទងតមកយើងខ្ញុំ'),
          const SizedBox(height: 10),
          SettingsRow(
              icon: Icons.description_outlined, title: 'លក្ខខណ្ឌ'),
          const SizedBox(height: 10),
          SettingsRow(
              icon: Icons.receipt_long_outlined, title: 'លក្ខខណ្ឌ'),
          const SizedBox(height: 18),

          // ABA Agent toggle
          _AgentToggle(
              enabled: agentEnabled, onChanged: onAgentToggle),
          const SizedBox(height: 18),

          // Version card
          _VersionCard(),
          const SizedBox(height: 24),

          // Branding
          _Branding(),
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
              color: Colors.black.withOpacity(0.04),
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
                    style: TextStyle(
                        color: Color(0xFF888888), fontSize: 12),
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
              color: Colors.black.withOpacity(0.03),
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
              color: Colors.black.withOpacity(0.03),
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
                  color: Colors.green.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(children: [
                  Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle)),
                  const SizedBox(width: 5),
                  const Text('ចុះប្រាប',
                      style:
                          TextStyle(color: Colors.green, fontSize: 11)),
                ]),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Login ចុះប្រាប: 18:33 | 14 មេសា 2026',
              style: TextStyle(color: Color(0xFF888888), fontSize: 12),
            ),
          ),
          const SizedBox(height: 8),
          const Row(children: [
            Text('🇰🇭 ', style: TextStyle(fontSize: 16)),
            Text(
              'មោទនភូមិស្ថានខ្មែរ បង្ហើតនៅកម្ពុជា',
              style:
                  TextStyle(color: Color(0xFF888888), fontSize: 12),
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