import 'package:flutter/material.dart';
import 'package:stylio_salon_booking/resources/textplaceholder.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // Services selection
  bool _hairCut = true;
  bool _beardTrim = true;
  bool _hairSpa = false;
  bool _hairColor = false;
  bool _facial = false;

  // Price range slider
  RangeValues _priceRange = const RangeValues(200, 600);

  // Availability selection
  String _selectedAvailability = 'Open Now';

  // Time Slot selection
  String _selectedTimeSlot = 'Evening';

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
          filterTitle,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _hairCut = false;
                _beardTrim = false;
                _hairSpa = false;
                _hairColor = false;
                _facial = false;
                _priceRange = const RangeValues(0, 2000);
                _selectedAvailability = '';
                _selectedTimeSlot = '';
              });
            },
            child: const Text(
              clearAllText,
              style: TextStyle(
                color: Color(0xFFB88E3E),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
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
                    // Section 1: Services
                    _buildSectionHeader(
                      icon: Icons.content_cut_rounded,
                      title: servicesTabTitle,
                      trailingText: twoSelectedText,
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildFilterCheckChip(
                            'Hair Cut', _hairCut, (val) => setState(() => _hairCut = val!)),
                        _buildFilterCheckChip(
                            'Beard Trim', _beardTrim, (val) => setState(() => _beardTrim = val!)),
                        _buildFilterCheckChip(
                            'Hair Spa', _hairSpa, (val) => setState(() => _hairSpa = val!)),
                        _buildFilterCheckChip(
                            'Hair Color', _hairColor, (val) => setState(() => _hairColor = val!)),
                        _buildFilterCheckChip(
                            'Facial', _facial, (val) => setState(() => _facial = val!)),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // Section 2: Price Range
                    _buildSectionHeader(
                      icon: Icons.monetization_on_outlined,
                      title: priceRangeHeader,
                      trailingText:
                          '₹${_priceRange.start.round()} - ₹${_priceRange.end.round()}',
                    ),
                    const SizedBox(height: 12),
                    RangeSlider(
                      values: _priceRange,
                      min: 0,
                      max: 2000,
                      divisions: 20,
                      activeColor: const Color(0xFFC79C52),
                      inactiveColor: Colors.grey.shade300,
                      onChanged: (RangeValues values) {
                        setState(() {
                          _priceRange = values;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('₹0', style: TextStyle(fontSize: 12, color: Colors.black87)),
                          Text('₹200', style: TextStyle(fontSize: 12, color: Colors.black87)),
                          Text('₹600', style: TextStyle(fontSize: 12, color: Colors.black87)),
                          Text('₹2000', style: TextStyle(fontSize: 12, color: Colors.black87)),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Section 3: Availability
                    _buildSectionHeader(
                      icon: Icons.calendar_today_outlined,
                      title: availabilityHeader,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        _buildSelectableChip(openNowText, _selectedAvailability == openNowText, () {
                          setState(() => _selectedAvailability = openNowText);
                        }),
                        const SizedBox(width: 10),
                        _buildSelectableChip(todayText, _selectedAvailability == todayText, () {
                          setState(() => _selectedAvailability = todayText);
                        }),
                        const SizedBox(width: 10),
                        _buildSelectableChip(tomorrowText, _selectedAvailability == tomorrowText, () {
                          setState(() => _selectedAvailability = tomorrowText);
                        }),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // Section 4: Time Slot
                    _buildSectionHeader(
                      icon: Icons.access_time_rounded,
                      title: timeSlotHeader,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        _buildSelectableChip(morningTitle, _selectedTimeSlot == morningTitle, () {
                          setState(() => _selectedTimeSlot = morningTitle);
                        }),
                        const SizedBox(width: 10),
                        _buildSelectableChip(afternoonTitle, _selectedTimeSlot == afternoonTitle, () {
                          setState(() => _selectedTimeSlot = afternoonTitle);
                        }),
                        const SizedBox(width: 10),
                        _buildSelectableChip(eveningTitle, _selectedTimeSlot == eveningTitle, () {
                          setState(() => _selectedTimeSlot = eveningTitle);
                        }),
                      ],
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // Bottom Action Buttons (Reset | Apply Filter)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFFC79C52), width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          resetText,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFC79C52),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC79C52),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          applyFilterText,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required IconData icon,
    required String title,
    String? trailingText,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: const Color(0xFFC79C52),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        if (trailingText != null)
          Text(
            trailingText,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
      ],
    );
  }

  Widget _buildFilterCheckChip(
      String label, bool isChecked, ValueChanged<bool?> onChanged) {
    return GestureDetector(
      onTap: () => onChanged(!isChecked),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isChecked ? const Color(0xFFC79C52) : Colors.grey.shade400,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black87,
              ),
            ),
            const SizedBox(width: 6),
            Icon(
              isChecked ? Icons.check_box_rounded : Icons.check_box_outline_blank_rounded,
              size: 16,
              color: isChecked ? const Color(0xFFC79C52) : Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectableChip(
      String label, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFC79C52) : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? const Color(0xFFC79C52) : Colors.grey.shade400,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: isSelected ? Colors.white : Colors.black87,
                ),
              ),
              if (isSelected) ...[
                const SizedBox(width: 4),
                const Icon(
                  Icons.check_circle_rounded,
                  size: 14,
                  color: Colors.white,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
