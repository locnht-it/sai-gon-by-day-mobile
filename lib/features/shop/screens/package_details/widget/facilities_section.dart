import 'package:flutter/material.dart';

class FacilitiesSection extends StatelessWidget {
  const FacilitiesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Facilities',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: [
            SizedBox(width: 8),
            ChoiceChip(
              label: Text('Transport'),
              selected: false,
              onSelected: (selected) {},
              backgroundColor: Colors.white,
            ),
            SizedBox(width: 8),
            ChoiceChip(
              label: Text('Ticket'),
              selected: false,
              onSelected: (selected) {},
              backgroundColor: Colors.white,
            ),
            SizedBox(width: 8),
            ChoiceChip(
              label: Text('Coffee Break'),
              selected: false,
              onSelected: (selected) {},
              backgroundColor: Colors.white,
            ),
            SizedBox(width: 8),
            ChoiceChip(
              label: Text('Meals during trekking'),
              selected: false,
              onSelected: (selected) {},
              backgroundColor: Colors.white,
            ),
            SizedBox(width: 8),
            ChoiceChip(
              label: Text('Camping tents'),
              selected: false,
              onSelected: (selected) {},
              backgroundColor: Colors.white,
            ),
            SizedBox(width: 8),
            ChoiceChip(
              label: Text('Hospital'),
              selected: false,
              onSelected: (selected) {},
              backgroundColor: Colors.white,
            ),
            SizedBox(width: 8),
            ChoiceChip(
              label: Text('Guide during trekking'),
              selected: false,
              onSelected: (selected) {},
              backgroundColor: Colors.white,
            ),
            SizedBox(width: 8),
            ChoiceChip(
              label: Text('Officially recognized mountain guide'),
              selected: false,
              onSelected: (selected) {},
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}
