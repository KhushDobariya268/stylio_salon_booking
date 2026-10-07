import 'package:flutter/material.dart';
import 'package:stylio_salon_booking/resources/textplaceholder.dart';
import 'package:stylio_salon_booking/role_selection_screen.dart';
import 'package:stylio_salon_booking/user_panel/user_home_screen.dart';
import 'package:stylio_salon_booking/user_panel/user_profile_screen.dart';

class UserSettingsScreen extends StatefulWidget {
  const UserSettingsScreen({super.key});

  @override
  State<UserSettingsScreen> createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  int _selectedIndex = 3; // Settings tab active

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          settingsTitle,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Change Password
              _buildSettingItem(
                icon: Icons.lock_outline_rounded,
                title: changePasswordTitle,
                subtitle: changePasswordSubtitle,
                showArrow: true,
                onTap: () {},
              ),
              const Divider(thickness: 1),

              // 2. Privacy Policy
              _buildSettingItem(
                icon: Icons.shield_outlined,
                title: privacyPolicyTitle,
                subtitle: privacyPolicySubtitle,
                showArrow: true,
                onTap: () {},
              ),
              const Divider(thickness: 1),

              // 4. App Version
              _buildSettingItem(
                icon: Icons.info_outline_rounded,
                title: appVersionTitle,
                subtitle: appVersionSubtitle,
                showArrow: false,
                onTap: () {},
              ),
              const Divider(thickness: 1),

              // 5. Logout
              _buildSettingItem(
                icon: Icons.logout_rounded,
                title: logoutOption,
                subtitle: '',
                showArrow: false,
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const RoleSelectionScreen(),
                    ),
                    (route) => false,
                  );
                },
              ),
              const Divider(thickness: 1),

              const SizedBox(height: 24),

              // Contact Support Header
              const Text(
                contactSupportHeader,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 16),

              // Contact Support 3 Action Cards
              Row(
                children: [
                  // Call Us Card
                  Expanded(
                    child: _buildSupportCard(
                      icon: Icons.phone_in_talk_rounded,
                      title: callUsText,
                      subtext: callUsNumber,
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 10),

                  // Email Support Card
                  Expanded(
                    child: _buildSupportCard(
                      icon: Icons.email_outlined,
                      title: emailSupportText,
                      subtext: emailSupportAddress,
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 10),

                  // WhatsApp Card
                  Expanded(
                    child: _buildSupportCard(
                      icon: Icons.chat_outlined,
                      title: whatsappText,
                      subtext: whatsappMessage,
                      onTap: () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            if (index == 0) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const UserHomeScreen(),
                ),
              );
            } else if (index == 4) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const UserProfileScreen(),
                ),
              );
            } else {
              setState(() {
                _selectedIndex = index;
              });
            }
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFFB88E3E),
          unselectedItemColor: Colors.black54,
          selectedLabelStyle: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 11,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              activeIcon: Icon(Icons.calendar_today_rounded),
              label: 'Booking',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings_rounded),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              activeIcon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool showArrow,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      leading: Icon(
        icon,
        color: Colors.black87,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: subtitle.isNotEmpty
          ? Text(
              subtitle,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.black45,
              ),
            )
          : null,
      trailing: showArrow
          ? const Icon(
              Icons.chevron_right_rounded,
              color: Colors.black87,
              size: 24,
            )
          : null,
      onTap: onTap,
    );
  }

  Widget _buildSupportCard({
    required IconData icon,
    required String title,
    required String subtext,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 22,
              color: Colors.black87,
            ),
            const SizedBox(height: 6),
            Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 2),
            Text(
              subtext,
              style: const TextStyle(
                fontSize: 8.5,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
