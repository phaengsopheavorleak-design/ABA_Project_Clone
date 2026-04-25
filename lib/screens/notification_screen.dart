import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int _selectedTab = 1; // ប្រតិបត្តិការ active by default

  final List<String> _tabs = ['ដំណឹងសំខាន់', 'ប្រតិបត្តិការ', 'សារជូនដំណឹង'];

  // ── Data for each tab ──
  final List<List<Map<String, String>>> _data = [
    // ជំនូនសំខាន់
    [
      {'title': 'ABA Bank', 'body': 'សូមស្វាគមន៍មកកាន់ ABA Mobile', 'time': '2 days ago', 'icon': 'info'},
    ],
    // ប្រតិបត្តិការ
    [
      {'title': 'ទទួលប្រាក់បានជោគជ័យ', 'body': 'អ្នកទទួលបាន \$50.00 ពី John', 'time': '10:30 AM', 'icon': 'receive'},
      {'title': 'ផ្ញើប្រាក់បានជោគជ័យ', 'body': 'អ្នកបានផ្ញើ \$20.00 ទៅ Jane', 'time': '09:15 AM', 'icon': 'send'},
    ],
    // សារផ្សន់ជំនូន
    [
      {'title': 'Login ថ្មី', 'body': 'មានការ login ចូល account', 'time': 'Yesterday', 'icon': 'security'},
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1A2A),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Back + Hero image area ──
            Stack(
              children: [
                // background image placeholder
                Container(
                  height: 120,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF1A2A3A), Color(0xFF0D1A2A)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 4,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),

            // ── Title ──
            Padding(
  
  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
  child: RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: 'ABA',
          style: GoogleFonts.kantumruyPro(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
        ),
        TextSpan(
          text: '• ',
          style: GoogleFonts.kantumruyPro(
            color: Colors.red,
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
        ),
        TextSpan(
          text: 'សារជូនដំណឹង',
          style: GoogleFonts.kantumruyPro(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    ),
  ),
),

            // ── Tabs ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A2A3A),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: List.generate(_tabs.length, (i) {
                    final active = _selectedTab == i;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedTab = i),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: active ? const Color(0xFF5BC8F5) : Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            _tabs[i],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: active ? Colors.white : Colors.white54,
                              fontSize: 12,
                              fontWeight: active ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ── Section label ──
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'ថ្ងៃនេះ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            // ── Notification list ──
            Expanded(
              child: _data[_selectedTab].isEmpty
                  ? const Center(
                      child: Text('មិនមានការជូនដំណឹងទេ',
                          style: TextStyle(color: Colors.white54)),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _data[_selectedTab].length,
                      itemBuilder: (context, index) {
                        final n = _data[_selectedTab][index];
                        return _NotificationTile(
                          title: n['title']!,
                          body: n['body']!,
                          time: n['time']!,
                          icon: n['icon']!,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final String title;
  final String body;
  final String time;
  final String icon;

  const _NotificationTile({
    required this.title,
    required this.body,
    required this.time,
    required this.icon,
  });

  IconData get _icon {
    switch (icon) {
      case 'receive':  return Icons.arrow_downward;
      case 'send':     return Icons.arrow_upward;
      case 'security': return Icons.security;
      default:         return Icons.info_outline;
    }
  }

  Color get _iconColor {
    switch (icon) {
      case 'receive':  return Colors.green;
      case 'send':     return Colors.orange;
      case 'security': return Colors.red;
      default:         return const Color(0xFFD4A017);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2A3A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _iconColor.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(_icon, color: _iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
                const SizedBox(height: 4),
                Text(body,
                    style: const TextStyle(
                        color: Colors.white54, fontSize: 12)),
              ],
            ),
          ),
          Text(time,
              style: const TextStyle(color: Colors.white38, fontSize: 11)),
        ],
      ),
    );
  }
}