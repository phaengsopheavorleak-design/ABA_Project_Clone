import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'theme/app_theme.dart';
import 'utils/app_routes.dart';
import 'screens/exchange_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/home_screen.dart';
import 'screens/mypass_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/transfer_screen.dart';


// ─────────────────────────────────────────────────────────────────────────────
// ENTRY POINT
// ─────────────────────────────────────────────────────────────────────────────

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(const ABAMobileApp());
}

// ─────────────────────────────────────────────────────────────────────────────
// ROOT APP
// ─────────────────────────────────────────────────────────────────────────────

class ABAMobileApp extends StatelessWidget {
  const ABAMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  title: 'ABA Mobile',
  debugShowCheckedModeBanner: false,
  theme: AppTheme.dark.copyWith(          // ← copyWith ជំនួស AppTheme.dark
    textTheme: GoogleFonts.notoSansKhmerTextTheme(
      AppTheme.dark.textTheme,
    ),
  ),
  initialRoute: AppRoutes.home,
  routes: {
    AppRoutes.home:      (_) => const MainShell(),
    AppRoutes.transfer:  (_) => const TransferScreen(),
    AppRoutes.favorites: (_) => const FavoritesScreen(),
    AppRoutes.exchange:  (_) => const ExchangeScreen(),
    AppRoutes.mypass:    (_) => const MyPassScreen(),
    AppRoutes.settings:  (_) => const SettingsScreen(),
  },
);
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// MAIN SHELL  –  bottom navigation wrapper
// ─────────────────────────────────────────────────────────────────────────────

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  static const List<Widget> _pages = [
    HomeScreen(),
    TransferScreen(),
    ExchangeScreen(),
    MyPassScreen(),
  ];

  static const _navItems = [
    _NavItem(outlinedIcon: Icons.home_outlined,          filledIcon: Icons.home_rounded,          label: 'ទំព័រដើម'),
    _NavItem(outlinedIcon: Icons.swap_horiz_outlined,    filledIcon: Icons.swap_horiz_rounded,    label: 'ផ្ញើប្រាក់'),
    _NavItem(outlinedIcon: Icons.attach_money_outlined,  filledIcon: Icons.attach_money_rounded,  label: 'ទូទាត់'),
    _NavItem(outlinedIcon: Icons.wallet_outlined,        filledIcon: Icons.wallet_rounded,        label: 'MyPass'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: _BottomNav(
        currentIndex: _currentIndex,
        items: _navItems,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// BOTTOM NAV BAR
// ─────────────────────────────────────────────────────────────────────────────

class _NavItem {
  final IconData outlinedIcon;
  final IconData filledIcon;
  final String label;

  const _NavItem({
    required this.outlinedIcon,
    required this.filledIcon,
    required this.label,
  });
}

class _BottomNav extends StatelessWidget {
  final int currentIndex;
  final List<_NavItem> items;
  final ValueChanged<int> onTap;

  const _BottomNav({
    required this.currentIndex,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        border: Border(
          top: BorderSide(color: Colors.white.withOpacity(0.07), width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              items.length,
              (i) => _NavButton(
                item: items[i],
                isActive: currentIndex == i,
                onTap: () => onTap(i),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final _NavItem item;
  final bool isActive;
  final VoidCallback onTap;

  const _NavButton({
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.gold.withOpacity(0.12)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Icon(
                isActive ? item.filledIcon : item.outlinedIcon,
                key: ValueKey(isActive),
                color: isActive
                    ? AppColors.gold
                    : AppColors.textMuted,
                size: 24,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              item.label,
              style: TextStyle(
                color: isActive
                    ? AppColors.gold
                    : AppColors.textMuted,
                fontSize: 10,
                fontWeight: isActive
                    ? FontWeight.w600
                    : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}