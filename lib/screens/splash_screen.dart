import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen.dart'; // adjust import path as needed

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _fadeOutController;

  late Animation<double> _logoOpacity;
  late Animation<double> _logoScale;
  late Animation<double> _screenFade;

  @override
  void initState() {
    super.initState();

    // Hide status bar for immersive splash
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    // Logo fade+scale in
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _logoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
      ),
    );

    _logoScale = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOutCubic),
      ),
    );

    // Whole screen fade out before navigation
    _fadeOutController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _screenFade = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _fadeOutController, curve: Curves.easeIn),
    );

    _startSequence();
  }

  Future<void> _startSequence() async {
    // Small delay then animate logo in
    await Future.delayed(const Duration(milliseconds: 200));
    await _logoController.forward();

    // Hold for a moment
    await Future.delayed(const Duration(milliseconds: 1200));

    // Fade out
    await _fadeOutController.forward();

    // Restore system UI before navigating
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    if (mounted) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const HomeScreen(),
          transitionDuration: Duration.zero,
        ),
      );
    }
  }

  @override
  void dispose() {
    _logoController.dispose();
    _fadeOutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _screenFade,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF0D2137), // dark navy top
                Color(0xFF0A3352), // mid teal-navy
                Color(0xFF0D2C44), // slightly lighter bottom
              ],
              stops: [0.0, 0.55, 1.0],
            ),
          ),
          child: Stack(
            children: [
              // Subtle radial glow in center
              Center(
                child: Container(
                  width: 280,
                  height: 280,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        const Color(0xFF1A5276).withOpacity(0.3),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              // Center logo
              Center(
                child: AnimatedBuilder(
                  animation: _logoController,
                  builder: (_, __) {
                    return Opacity(
                      opacity: _logoOpacity.value,
                      child: Transform.scale(
                        scale: _logoScale.value,
                        child: const _ABALogo(),
                      ),
                    );
                  },
                ),
              ),

              // Bottom bar with bank name + NBOK logo
              AnimatedBuilder(
                animation: _logoController,
                builder: (_, __) {
                  return Opacity(
                    opacity: _logoOpacity.value,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).padding.bottom + 32,
                        ),
                        child: const _BottomBrand(),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _ABALogo extends StatelessWidget {
  const _ABALogo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // "ABA" wordmark with superscript dot
        Stack(
          clipBehavior: Clip.none,
          children: [
            const Text(
              'ABA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.w800,
                letterSpacing: 2,
                height: 1,
              ),
            ),
            // Red dot superscript
            Positioned(
              top: -4,
              right: -8,
              child: Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  color: Color(0xFFE53935),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 18),
        // "Mobile" text
        const Text(
          'Mobile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 38,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.5,
            height: 1,
          ),
        ),
      ],
    );
  }
}


class _BottomBrand extends StatelessWidget {
  const _BottomBrand();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // "ABA BANK" text
        const Text(
          'ABA BANK',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5,
          ),
        ),

        // Vertical divider
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          width: 1,
          height: 22,
          color: Colors.white38,
        ),

        // NBOK logo placeholder (red box with text like original)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFCC0000),
            borderRadius: BorderRadius.circular(3),
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'NATIONAL BANK',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 5.5,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                'OF CANADA GROUP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 5.5,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}