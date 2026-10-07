import 'package:flutter/material.dart';
import 'package:stylio_salon_booking/admin_panel/add_salon_screen.dart';
import 'package:stylio_salon_booking/admin_panel/admin_bookings_screen.dart';
import 'package:stylio_salon_booking/admin_panel/admin_dashboard_screen.dart';
import 'package:stylio_salon_booking/admin_panel/admin_more_screen.dart';
import 'package:stylio_salon_booking/admin_panel/admin_profile_screen.dart';
import 'package:stylio_salon_booking/resources/textplaceholder.dart';

class UserModel {
  final String name;
  final String email;
  final String status; // Active or Blocked
  final Color avatarColor;

  UserModel({
    required this.name,
    required this.email,
    required this.status,
    required this.avatarColor,
  });
}

class AdminUsersScreen extends StatefulWidget {
  const AdminUsersScreen({super.key});

  @override
  State<AdminUsersScreen> createState() => _AdminUsersScreenState();
}

class _AdminUsersScreenState extends State<AdminUsersScreen> {
  int _selectedIndex = 3; // Users tab active
  String _selectedFilter = 'All Users';
  final TextEditingController _searchController = TextEditingController();

  final List<UserModel> _allUsers = [
    UserModel(
      name: 'NIKHIL VERMA',
      email: 'nikhil@gmail.com',
      status: 'Active',
      avatarColor: Colors.red.shade400,
    ),
    UserModel(
      name: 'AMIT SHAH',
      email: 'amit@gmail.com',
      status: 'Active',
      avatarColor: Colors.blue.shade700,
    ),
    UserModel(
      name: 'KARAN JOSHI',
      email: 'karan@gmail.com',
      status: 'Active',
      avatarColor: Colors.orange.shade800,
    ),
    UserModel(
      name: 'RAHUL PATEL',
      email: 'rahul@gmail.com',
      status: 'Blocked',
      avatarColor: Colors.teal.shade700,
    ),
    UserModel(
      name: 'DEV PATEL',
      email: 'dev@gmail.com',
      status: 'Blocked',
      avatarColor: Colors.green.shade700,
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredUsers = _allUsers.where((u) {
      final matchesFilter = _selectedFilter == 'All Users' ||
          u.status.toLowerCase() == _selectedFilter.toLowerCase();
      final matchesSearch =
          u.name.toLowerCase().contains(_searchController.text.toLowerCase()) ||
              u.email
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase());
      return matchesFilter && matchesSearch;
    }).toList();

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
          usersTitle,
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Input
              Container(
                height: 46,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (_) => setState(() {}),
                  decoration: const InputDecoration(
                    hintText: searchUsersHint,
                    hintStyle: TextStyle(
                      color: Colors.black38,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Colors.black87,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Filter Chips Row
              Row(
                children: [
                  _buildFilterChip(allUsersFilter),
                  const SizedBox(width: 10),
                  _buildFilterChip(activeFilter),
                  const SizedBox(width: 10),
                  _buildFilterChip(blockedFilter),
                ],
              ),

              const SizedBox(height: 16),

              // Users List
              Expanded(
                child: ListView.separated(
                  itemCount: filteredUsers.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 20, thickness: 0.8),
                  itemBuilder: (context, index) {
                    final user = filteredUsers[index];
                    final isActive = user.status == 'Active';
                    return Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: user.avatarColor,
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.name,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                user.email,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: isActive
                                ? const Color(0xFFE8F5E9)
                                : const Color(0xFFFFEBEE),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            user.status,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: isActive
                                  ? const Color(0xFF2E7D32)
                                  : const Color(0xFFC62828),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
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
            } else if (index == 1) {
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
            } else if (index == 4) {
              Navigator.of(context).pushReplacement(
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

  Widget _buildFilterChip(String label) {
    final isSelected = _selectedFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF3E2CF) : const Color(0xFFFAFAFA),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? const Color(0xFFC79C52) : Colors.transparent,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
