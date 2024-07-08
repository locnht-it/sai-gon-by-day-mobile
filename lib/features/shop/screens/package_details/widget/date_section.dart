import 'package:flutter/material.dart';

class DateSection extends StatelessWidget {
  const DateSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose date',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ChoiceChip(
                label: Text('15 Dec - 20 Dec 2023'),
                selected: false,
                onSelected: (selected) {},
                backgroundColor: Colors.white,
              ),
              SizedBox(width: 8),
              ChoiceChip(
                label: Text('25 Dec - 30 Dec 2023'),
                selected: false,
                onSelected: (selected) {},
                backgroundColor: Colors.white,
              ),
              SizedBox(width: 8),
              ChoiceChip(
                label: const Row(
                  children: [
                    Icon(Icons.calendar_today, size: 16),
                    SizedBox(width: 4),
                    Text('Choose Date'),
                  ],
                ),
                selected: false,
                onSelected: (selected) {},
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
