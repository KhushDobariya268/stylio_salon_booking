import 'package:flutter/material.dart';
import 'package:stylio_salon_booking/resources/colorsresource.dart';
import 'package:stylio_salon_booking/resources/imagestring.dart';
import 'package:stylio_salon_booking/resources/textplaceholder.dart';
import 'package:stylio_salon_booking/role_selection_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _navigateToRoleSelection() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const RoleSelectionScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeOutCubic;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image fetched from imagestring.dart (i1)
          Positioned.fill(
            child: Image.asset(
              i1,
              fit: BoxFit.cover,
            ),
          ),

          // Content Overlay matching the design
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Welcome Box Card (Tappable)
                GestureDetector(
                  onTap: _navigateToRoleSelection,
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 24.0),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 20.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.85),
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: splashWelcome,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: primaryBlue,
                              height: 1.3,
                            ),
                          ),
                          TextSpan(
                            text: 'To ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: textPrimaryColor,
                              height: 1.3,
                            ),
                          ),
                          TextSpan(
                            text: appTitle,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: primaryBlue,
                              height: 1.3,
                            ),
                          ),
                          TextSpan(
                            text: ' Salon\n',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: textPrimaryColor,
                              height: 1.3,
                            ),
                          ),
                          TextSpan(
                            text: splashSwapAndLogin,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: textSecondaryColor,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Arrow indicator button (Tappable)
                GestureDetector(
                  onTap: _navigateToRoleSelection,
                  child: const Icon(
                    Icons.keyboard_arrow_up_rounded,
                    size: 36,
                    color: iconColor,
                  ),
                ),

                const SizedBox(height: 16),

                // Bottom rounded shape
                Container(
                  height: 36,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
