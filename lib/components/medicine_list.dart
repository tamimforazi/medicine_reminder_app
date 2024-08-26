import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/components/medicine_item.dart';

class MedicineList extends StatelessWidget {
  final List<Map<String, String>> medicines = [
    {
      'serial': '1',
      'name': 'Paracetamol',
      'time': 'After Meal',
      'quantity': '2 tablets'
    },
    {
      'serial': '2',
      'name': 'Aspirin',
      'time': 'Before Meal',
      'quantity': '1 tablet'
    },
    {'serial': '3', 'name': 'Ibuprofen', 'time': 'N/A', 'quantity': '1 tablet'},
    {
      'serial': '4',
      'name': 'Antibiotic',
      'time': 'After Meal',
      'quantity': '1 tablet'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: medicines.length,
      itemBuilder: (context, index) {
        final medicine = medicines[index];
        final isEvenIndex = index % 2 == 0;
        return MedicineItem(
          serial: medicine['serial']!,
          name: medicine['name']!,
          time: medicine['time']!,
          quantity: medicine['quantity']!,
          isEvenIndex: isEvenIndex,
        );
      },
    );
  }
}
