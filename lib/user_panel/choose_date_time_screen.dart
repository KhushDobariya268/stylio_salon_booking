import 'package:flutter/material.dart';
import 'package:stylio_salon_booking/resources/textplaceholder.dart';
import 'package:stylio_salon_booking/user_panel/booking_summary_screen.dart';
import 'package:stylio_salon_booking/user_panel/select_services_screen.dart';

class ChooseDateTimeScreen extends StatefulWidget {
  final List<ServiceModel> selectedServices;

  const ChooseDateTimeScreen({
    super.key,
    required this.selectedServices,
  });

  @override
  State<ChooseDateTimeScreen> createState() => _ChooseDateTimeScreenState();
}

class _ChooseDateTimeScreenState extends State<ChooseDateTimeScreen> {
  int _selectedDateIndex = 1; // Tue 04 Aug
  String _selectedTime = '10:00 AM';

  final List<Map<String, String>> _dates = [
    {'day': 'Mon', 'date': '03', 'month': 'Aug'},
    {'day': 'Tue', 'date': '04', 'month': 'Aug'},
    {'day': 'Wed', 'date': '05', 'month': 'Aug'},
    {'day': 'Thu', 'date': '06', 'month': 'Aug'},
    {'day': 'Fri', 'date': '07', 'month': 'Aug'},
  ];

  final List<String> _morningSlots = [
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM'
  ];
  final List<String> _afternoonSlots = [
    '01:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM'
  ];
  final List<String> _eveningSlots = [
    '05:00 PM',
    '06:00 PM',
    '07:00 PM',
    '08:00 PM'
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
          chooseDateTimeTitle,
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
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Horizontal Date Selector
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(_dates.length, (index) {
                        final item = _dates[index];
                        final isSelected = index == _selectedDateIndex;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedDateIndex = index;
                            });
                          },
                          child: Container(
                            width: 58,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFFC79C52)
                                  : const Color(0xFFFFF9EE),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  item['day']!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  item['date']!,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  item['month']!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),

                    const SizedBox(height: 24),

                    // Morning Slots
                    _buildTimeSection(morningTitle, _morningSlots),

                    const SizedBox(height: 20),

                    // Afternoon Slots
                    _buildTimeSection(afternoonTitle, _afternoonSlots),

                    const SizedBox(height: 20),

                    // Evening Slots
                    _buildTimeSection(eveningTitle, _eveningSlots),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            // Bottom Continue Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    final dateStr =
                        '${_dates[_selectedDateIndex]['day']},${_dates[_selectedDateIndex]['date']} ${_dates[_selectedDateIndex]['month']} 2026';
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BookingSummaryScreen(
                          selectedServices: widget.selectedServices,
                          selectedDate: dateStr,
                          selectedTime: _selectedTime,
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
                        continueButtonText,
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

  Widget _buildTimeSection(String title, List<String> times) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: times.map((time) {
            final isSelected = time == _selectedTime;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTime = time;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFFC79C52)
                      : const Color(0xFFFFF9EE),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
