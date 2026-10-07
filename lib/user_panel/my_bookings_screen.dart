import 'package:flutter/material.dart';
import 'package:stylio_salon_booking/resources/imagestring.dart';
import 'package:stylio_salon_booking/resources/textplaceholder.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
          myBookingsTitle,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFFC79C52),
          indicatorWeight: 2.5,
          labelColor: const Color(0xFFC79C52),
          unselectedLabelColor: Colors.black,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          tabs: const [
            Tab(text: upcomingTabTitle),
            Tab(text: pastTabTitle),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // 1. Upcoming Tab
          _buildUpcomingTab(),

          // 2. Past Tab
          _buildPastTab(),
        ],
      ),
    );
  }

  // 1. Upcoming Tab
  Widget _buildUpcomingTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Salon Summary Card 1 (Stylio Men's Salon)
          _buildSalonSummaryCard(
            imagePath: stylioSalonImage,
            title: stylioSalonName,
            dateTime: 'Tue,04 Aug 2026\n10:00 AM',
            servicesCount: twoServicesText,
            price: '₹352',
            badgeText: upcomingBadge,
            badgeBgColor: const Color(0xFFE8F5E9),
            badgeTextColor: const Color(0xFF2E7D32),
          ),

          const SizedBox(height: 14),

          // Salon Summary Card 2 (The Mae Mane Salon)
          _buildSalonSummaryCard(
            imagePath: maeManeSalonImage,
            title: maeManeSalonName,
            dateTime: 'Tue,04 Aug 2026\n10:00 AM',
            servicesCount: twoServicesText,
            price: '₹646',
            badgeText: upcomingBadge,
            badgeBgColor: const Color(0xFFE8F5E9),
            badgeTextColor: const Color(0xFF2E7D32),
          ),

          const SizedBox(height: 16),
          const Divider(thickness: 1),
          const SizedBox(height: 16),

          // Detailed Service Card 1 (Hair Cut)
          _buildServiceBookingCard(
            imagePath: 'assets/images/stylio_Salon_gallery_image1.jpeg',
            title: 'Hair Cut',
            stylist: 'Rohit(Senior Stylist)',
            salonName: 'Stylio Salon',
            dateTime: '25-May-2026  |  04:30 PM',
            badgeText: upcomingBadge,
            badgeBgColor: const Color(0xFFFFF3E0),
            badgeTextColor: const Color(0xFFE65100),
            showCancelButton: true,
          ),

          const SizedBox(height: 14),

          // Detailed Service Card 2 (Beard Styling)
          _buildServiceBookingCard(
            imagePath: 'assets/images/Beard_Trim.png',
            title: 'Beard Styling',
            stylist: 'Aman(Beard Expert)',
            salonName: 'Stylio Salon',
            dateTime: '28-May-2026  |  11:30 AM',
            badgeText: upcomingBadge,
            badgeBgColor: const Color(0xFFFFF3E0),
            badgeTextColor: const Color(0xFFE65100),
            showCancelButton: true,
          ),
        ],
      ),
    );
  }

  // 2. Past Tab
  Widget _buildPastTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Completed Service Card 1
          _buildServiceBookingCard(
            imagePath: 'assets/images/stylio_Salon_gallery_image1.jpeg',
            title: 'Hair Cut',
            stylist: 'Rohit(Senior Stylist)',
            salonName: 'Stylio Salon',
            dateTime: '18-May-2026  |  02:00 PM',
            badgeText: 'Completed',
            badgeBgColor: const Color(0xFFE8F5E9),
            badgeTextColor: const Color(0xFF2E7D32),
            showCancelButton: false,
          ),

          const SizedBox(height: 14),

          // Completed Service Card 2
          _buildServiceBookingCard(
            imagePath: 'assets/images/Beard_Trim.png',
            title: 'Beard Styling',
            stylist: 'Aman(Beard Expert)',
            salonName: 'Stylio Salon',
            dateTime: '10-May-2026  |  06:00 AM',
            badgeText: 'Completed',
            badgeBgColor: const Color(0xFFE8F5E9),
            badgeTextColor: const Color(0xFF2E7D32),
            showCancelButton: false,
          ),
        ],
      ),
    );
  }

  // Salon Overview Summary Card
  Widget _buildSalonSummaryCard({
    required String imagePath,
    required String title,
    required String dateTime,
    required String servicesCount,
    required String price,
    required String badgeText,
    required Color badgeBgColor,
    required Color badgeTextColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDF8),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: badgeBgColor,
                        borderRadius: BorderRadius.circular(8),
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
                const SizedBox(height: 6),
                Text(
                  dateTime,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      servicesCount,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Detailed Service Card
  Widget _buildServiceBookingCard({
    required String imagePath,
    required String title,
    required String stylist,
    required String salonName,
    required String dateTime,
    required String badgeText,
    required Color badgeBgColor,
    required Color badgeTextColor,
    required bool showCancelButton,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  width: 75,
                  height: 75,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: badgeBgColor,
                            borderRadius: BorderRadius.circular(8),
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
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.person_outline_rounded,
                          size: 14,
                          color: Colors.black54,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          stylist,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 14,
                          color: Colors.black54,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          salonName,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          size: 12,
                          color: Colors.black54,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          dateTime,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (showCancelButton) ...[
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: 28,
                child: OutlinedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Booking Cancelled')),
                    );
                  },
                  icon: const Icon(
                    Icons.cancel_outlined,
                    size: 14,
                    color: Colors.red,
                  ),
                  label: const Text(
                    cancelBookingButton,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
