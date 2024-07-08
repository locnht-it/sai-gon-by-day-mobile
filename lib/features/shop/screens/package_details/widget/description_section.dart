import 'package:flutter/material.dart';


class DescriptionSection extends StatelessWidget {
  const DescriptionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Mount Semeru or Mount Meru is a cone volcano in East Java, Indonesia. '
              'Mount Semeru is the highest mountain on the island of Java, with its peak Mahameru, '
              '3676 meters above sea level.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
