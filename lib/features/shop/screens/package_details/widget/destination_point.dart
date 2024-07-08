import 'package:flutter/material.dart';

class DestinationPointSection extends StatelessWidget {
  const DestinationPointSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose Meeting Point',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ChoiceChip(
                label: Text('Serang'),
                selected: false,
                onSelected: (selected) {},
                backgroundColor: Colors.white,
              ),
              SizedBox(width: 8),
              ChoiceChip(
                label: Text('Bandung'),
                selected: false,
                onSelected: (selected) {},
                backgroundColor: Colors.white,
              ),
              SizedBox(width: 8),
              ChoiceChip(
                label: Text('Tangerang'),
                selected: false,
                onSelected: (selected) {},
                backgroundColor: Colors.white,
              ),
              SizedBox(width: 8),
              ChoiceChip(
                label: Text('Jakarta'),
                selected: false,
                onSelected: (selected) {},
                backgroundColor: Colors.white,
              ),
              SizedBox(width: 8),
              ChoiceChip(
                label: Text('Bekasi'),
                selected: false,
                onSelected: (selected) {},
                backgroundColor: Colors.white,
              ),
              SizedBox(width: 8),
              ChoiceChip(
                label: Text('Cikampek'),
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
