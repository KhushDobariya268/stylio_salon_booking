import 'package:flutter/material.dart';
import 'package:stylio_salon_booking/resources/textplaceholder.dart';
import 'package:stylio_salon_booking/user_panel/choose_date_time_screen.dart';

class ServiceModel {
  final String title;
  final int price;
  final String duration;
  final String imagePath;
  bool isSelected;

  ServiceModel({
    required this.title,
    required this.price,
    required this.duration,
    required this.imagePath,
    this.isSelected = false,
  });
}

class SelectServicesScreen extends StatefulWidget {
  const SelectServicesScreen({super.key});

  @override
  State<SelectServicesScreen> createState() => _SelectServicesScreenState();
}

class _SelectServicesScreenState extends State<SelectServicesScreen> {
  final List<ServiceModel> _services = [
    ServiceModel(
      title: 'Hair Cut',
      price: 199,
      duration: '30 Min',
      imagePath: 'assets/images/stylio_Salon_gallery_image1.jpeg',
      isSelected: true,
    ),
    ServiceModel(
      title: 'Beard Trim',
      price: 99,
      duration: '20 Min',
      imagePath: 'assets/images/Beard_Trim.png',
      isSelected: true,
    ),
    ServiceModel(
      title: 'Hair Spa',
      price: 299,
      duration: '45 Min',
      imagePath: 'assets/images/Hair_Spa.png',
      isSelected: false,
    ),
    ServiceModel(
      title: 'Facial',
      price: 399,
      duration: '50 Min',
      imagePath: 'assets/images/Facial.png',
      isSelected: false,
    ),
    ServiceModel(
      title: 'Hair Color',
      price: 499,
      duration: '60 Min',
      imagePath: 'assets/images/Hair_Color.png',
      isSelected: false,
    ),
  ];

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
          selectServicesTitle,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16.0),
                itemCount: _services.length,
                separatorBuilder: (context, index) =>
                    const Divider(height: 24, thickness: 1),
                itemBuilder: (context, index) {
                  final service = _services[index];
                  return Row(
                    children: [
                      // Thumbnail Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          service.imagePath,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 14),

                      // Service Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              service.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '₹${service.price}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(
                                  Icons.access_time_rounded,
                                  size: 14,
                                  color: Colors.black54,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  service.duration,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Checkbox
                      Checkbox(
                        value: service.isSelected,
                        activeColor: const Color(0xFFB88E3E),
                        onChanged: (val) {
                          setState(() {
                            service.isSelected = val ?? false;
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
            ),

            // Bottom Action Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    final selected =
                        _services.where((s) => s.isSelected).toList();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ChooseDateTimeScreen(
                          selectedServices: selected,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC79C52),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        bookAppointmentButtonText,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
