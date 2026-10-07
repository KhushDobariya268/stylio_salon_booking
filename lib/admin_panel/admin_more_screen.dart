import 'package:flutter/material.dart';
import 'package:stylio_salon_booking/admin_panel/about_app_screen.dart';
import 'package:stylio_salon_booking/admin_panel/add_offer_screen.dart';
import 'package:stylio_salon_booking/admin_panel/add_salon_screen.dart';
import 'package:stylio_salon_booking/admin_panel/admin_bookings_screen.dart';
import 'package:stylio_salon_booking/admin_panel/admin_dashboard_screen.dart';
import 'package:stylio_salon_booking/admin_panel/admin_profile_screen.dart';
import 'package:stylio_salon_booking/admin_panel/admin_users_screen.dart';
import 'package:stylio_salon_booking/resources/textplaceholder.dart';

class AdminMoreScreen extends StatefulWidget {
  const AdminMoreScreen({super.key});

  @override
  State<AdminMoreScreen> createState() => _AdminMoreScreenState();
}

class _AdminMoreScreenState extends State<AdminMoreScreen> {
  int _selectedIndex = 4; // More active

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
          moreTitle,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AdminProfileScreen(),
                  ),
                );
              },
              child: const CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xFFEF5350),
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Color(0xFF263238),
                  child: Icon(
                    Icons.person,
                    color: Color(0xFFFFCA28),
                    size: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            children: [
              _buildOptionItem(
                icon: Icons.store_outlined,
                iconColor: const Color(0xFFB88E3E),
                title: addSalonOption,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddSalonScreen(),
                    ),
                  );
                },
              ),
              const Divider(thickness: 1),

              _buildOptionItem(
                icon: Icons.local_offer_outlined,
                iconColor: const Color(0xFF1976D2),
                title: addOffersOption,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddOfferScreen(),
                    ),
                  );
                },
              ),
              const Divider(thickness: 1),

              _buildOptionItem(
                icon: Icons.calendar_today_outlined,
                iconColor: const Color(0xFFC79C52),
                title: manageBookingsOption,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AdminBookingsScreen(),
                    ),
                  );
                },
              ),
              const Divider(thickness: 1),

              _buildOptionItem(
                icon: Icons.settings_outlined,
                iconColor: const Color(0xFFC79C52),
                title: settingsOption,
                onTap: () {},
              ),
              const Divider(thickness: 1),

              _buildOptionItem(
                icon: Icons.shield_outlined,
                iconColor: const Color(0xFFC79C52),
                title: privacyPolicyTitle,
                onTap: () {},
              ),
              const Divider(thickness: 1),

              _buildOptionItem(
                icon: Icons.info_outline_rounded,
                iconColor: const Color(0xFFC79C52),
                title: aboutAppOption,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AboutAppScreen(),
                    ),
                  );
                },
              ),
              const Divider(thickness: 1),
            ],
          ),
        ),
      ),

      // Admin Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.shade200),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            if (index == 0) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const AdminDashboardScreen(),
                ),
              );
            } else if (index == 2) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const AdminBookingsScreen(),
                ),
              );
            } else if (index == 3) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const AdminUsersScreen(),
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
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 10,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_rounded),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store_outlined),
              label: 'Salons',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: 'Booking',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outline_rounded),
              activeIcon: Icon(Icons.people_rounded),
              label: 'Users',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz_rounded),
              label: 'More',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      leading: Icon(
        icon,
        color: iconColor,
        size: 24,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        color: Colors.black87,
        size: 22,
      ),
      onTap: onTap,
    );
  }
}
