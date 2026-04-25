import 'package:flutter/material.dart';
import 'dart:math' as math;

class ABAAccountScreen extends StatelessWidget {
  const ABAAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              children: const [
                AccountCard(
                  accountName: 'Savings',
                  accountNumber: '011 130 538',
                  accountType: 'Savings',
                  balance: '0.14',
                  currency: 'USD',
                  accentColor: Color(0xFF00BFFF),
                  showTag: true,
                ),
                SizedBox(height: 12),
                AccountCard(
                  accountName: 'Savings',
                  accountNumber: '011 130 539',
                  accountType: 'Savings',
                  balance: '30,455.70',
                  currency: 'KHR',
                  accentColor: Color(0xFF9B59B6),
                  showTag: false,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xFFF5F0EB),
        foregroundColor: Colors.black,
        icon: const Icon(Icons.add, size: 20),
        label: const Text(
          'គណនី',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 280,
      width: double.infinity,
      child: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF2C1B47),
                  Color(0xFF1A3A5C),
                  Color(0xFF2D4A2D),
                ],
              ),
            ),
          ),
          // Decorative overlay
          Positioned.fill(
            child: CustomPaint(painter: TempleBackgroundPainter()),
          ),
          // Dark overlay at bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 80,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    const Color(0xFF0D1117).withOpacity(0.95),
                  ],
                ),
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Column(
              children: [
                // App bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.white, size: 20),
                        onPressed: () => Navigator.pop(context), // ✅ FIXED
                      ),
                      Row(
                        children: [
                          const Text(
                            'ABA',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 2, bottom: 8),
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE53935),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            'គណនី',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Circle + totals
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 110,
                        height: 110,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CustomPaint(
                              size: const Size(110, 110),
                              painter: RingPainter(),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.account_balance_wallet_outlined,
                                    color: Colors.white70, size: 24),
                                SizedBox(height: 4),
                                Text(
                                  'គណនីទំាងអស់',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            'វិភាគដែលមាន',
                            style: TextStyle(color: Colors.white70, fontSize: 11),
                          ),
                          SizedBox(height: 6),
                          Text(
                            '\$0.14',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '៛30,455.70',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Bottom tab
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.bar_chart, color: Colors.white70, size: 16),
                    SizedBox(width: 4),
                    Text(
                      'មុខងារវិភាគ',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.keyboard_arrow_down,
                        color: Colors.white70, size: 18),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// ACCOUNT CARD
// ─────────────────────────────────────────────────────────────────────────────

class AccountCard extends StatelessWidget {
  final String accountName;
  final String accountNumber;
  final String accountType;
  final String balance;
  final String currency;
  final Color accentColor;
  final bool showTag;

  const AccountCard({
    super.key,
    required this.accountName,
    required this.accountNumber,
    required this.accountType,
    required this.balance,
    required this.currency,
    required this.accentColor,
    required this.showTag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 4,
                height: 40,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      accountName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          '$accountNumber | $accountType',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 12,
                          ),
                        ),
                        if (showTag) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE67E22).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: const Color(0xFFE67E22).withOpacity(0.5),
                              ),
                            ),
                            child: const Text(
                              'គណនីគោល',
                              style: TextStyle(
                                color: Color(0xFFE67E22),
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              Icon(Icons.more_horiz, color: Colors.white.withOpacity(0.5)),
            ],
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: balance,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '  $currency',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
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

// ─────────────────────────────────────────────────────────────────────────────
// RING PAINTER
// ─────────────────────────────────────────────────────────────────────────────

class RingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 6;
    const strokeWidth = 10.0;

    final bgPaint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, bgPaint);

    final purplePaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFAB47BC), Color(0xFFE040FB)],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * 0.82,
      false,
      purplePaint,
    );

    final bluePaint = Paint()
      ..color = const Color(0xFF00BFFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2 + 2 * math.pi * 0.85,
      2 * math.pi * 0.10,
      false,
      bluePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ─────────────────────────────────────────────────────────────────────────────
// TEMPLE BACKGROUND PAINTER
// ─────────────────────────────────────────────────────────────────────────────

class TempleBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    paint.color = const Color(0xFFD4A017).withOpacity(0.08);
    final path = Path();
    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.55,
        size.width * 0.5, size.height * 0.65);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.75, size.width, size.height * 0.6);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);

    paint.color = const Color(0xFF8B0000).withOpacity(0.15);
    final roof = Path();
    roof.moveTo(size.width * 0.3, size.height * 0.45);
    roof.lineTo(size.width * 0.5, size.height * 0.2);
    roof.lineTo(size.width * 0.7, size.height * 0.45);
    roof.close();
    canvas.drawPath(roof, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}