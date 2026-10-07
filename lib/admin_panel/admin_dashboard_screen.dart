import 'package:flutter/material.dart';
import 'package:stylio_salon_booking/admin_panel/add_salon_screen.dart';
import 'package:stylio_salon_booking/admin_panel/admin_bookings_screen.dart';
import 'package:stylio_salon_booking/admin_panel/admin_more_screen.dart';
import 'package:stylio_salon_booking/admin_panel/admin_profile_screen.dart';
import 'package:stylio_salon_booking/admin_panel/admin_users_screen.dart';
import 'package:stylio_salon_booking/resources/imagestring.dart';
import 'package:stylio_salon_booking/resources/textplaceholder.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          welcomeBackAdmin,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Admin Banner Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage(stylioSalonImage),
                    fit: BoxFit.cover,
                    opacity: 0.25,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      appTitle,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFC79C52),
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      stylioSalonAdmin,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      adminTagline,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white60,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Overview Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    overviewHeader,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: const [
                        Text(
                          thisMonthText,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 16,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Overview Grid Stat Cards (6 Cards)
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.8,
                children: [
                  _buildStatCard(
                    icon: Icons.people_outline_rounded,
                    iconColor: const Color(0xFFC79C52),
                    title: totalUsersText,
                    value: '1250',
                    trend: '+12.5% vs last month',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AdminUsersScreen(),
                        ),
                      );
                    },
                  ),
                  _buildStatCard(
                    icon: Icons.store_outlined,
                    iconColor: Colors.purple,
                    title: totalSalonsText,
                    value: '34',
                    trend: '+8.3% vs last month',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AddSalonScreen(),
                        ),
                      );
                    },
                  ),
                  _buildStatCard(
                    icon: Icons.calendar_today_outlined,
                    iconColor: Colors.redAccent,
                    title: todaysBookingText,
                    value: '56',
                    trend: '+15.4% vs yesterday',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AdminBookingsScreen(),
                        ),
                      );
                    },
                  ),
                  _buildStatCard(
                    icon: Icons.account_balance_wallet_outlined,
                    iconColor: const Color(0xFFC79C52),
                    title: totalRevenueText,
                    value: '₹1,68,000',
                    trend: '+18.2% vs last month',
                    onTap: () {},
                  ),
                  _buildStatCard(
                    icon: Icons.star_outline_rounded,
                    iconColor: const Color(0xFFFFC107),
                    title: totalReviewsText,
                    value: '489',
                    trend: '+4.2% vs last month',
                    onTap: () {},
                  ),
                  _buildStatCard(
                    icon: Icons.hourglass_empty_rounded,
                    iconColor: Colors.brown,
                    title: pendingApprovalsText,
                    value: '12',
                    trend: '',
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // View Bookings Header
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AdminBookingsScreen(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      viewBookingsHeader,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 20,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Booking Item 1
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AdminBookingsScreen(),
                    ),
                  );
                },
                child: _buildAdminBookingTile(
                  name: 'Nikhil Verma',
                  dateTime: '05 Aug, 2026\n11:00 AM',
                  salonName: "Stylio Men's Salon",
                  service: 'Hair Cut - Beard Trim',
                  badgeText: 'Upcoming',
                  badgeColor: const Color(0xFFFFF3E0),
                  badgeTextColor: const Color(0xFFE65100),
                  avatarBgColor: Colors.red.shade400,
                ),
              ),

              const SizedBox(height: 10),

              // Booking Item 2
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AdminBookingsScreen(),
                    ),
                  );
                },
                child: _buildAdminBookingTile(
                  name: 'Rahul Patel',
                  dateTime: '30 July, 2026\n12:00 PM',
                  salonName: "Stylio Men's Salon",
                  service: 'Hair - Spa',
                  badgeText: 'Completed',
                  badgeColor: const Color(0xFFE8F5E9),
                  badgeTextColor: const Color(0xFF2E7D32),
                  avatarBgColor: Colors.teal.shade400,
                ),
              ),

              const SizedBox(height: 16),
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
            if (index == 1) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddSalonScreen(),
                ),
              );
            } else if (index == 2) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AdminBookingsScreen(),
                ),
              );
            } else if (index == 3) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AdminUsersScreen(),
                ),
              );
            } else if (index == 4) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AdminMoreScreen(),
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

  Widget _buildStatCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
    required String trend,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(icon, size: 18, color: iconColor),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            if (trend.isNotEmpty) ...[
              const SizedBox(height: 2),
              Row(
                children: [
                  const Icon(
                    Icons.arrow_upward_rounded,
                    size: 10,
                    color: Color(0xFF4CAF50),
                  ),
                  const SizedBox(width: 2),
                  Expanded(
                    child: Text(
                      trend,
                      style: const TextStyle(
                        fontSize: 8.5,
                        color: Color(0xFF4CAF50),
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAdminBookingTile({
    required String name,
    required String dateTime,
    required String salonName,
    required String service,
    required String badgeText,
    required Color badgeColor,
    required Color badgeTextColor,
    required Color avatarBgColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: avatarBgColor,
            child: const Icon(
              Icons.person,
              color: Colors.white,
              size: 22,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  salonName,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  service,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                dateTime,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black54,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  badgeText,
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: badgeTextColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
