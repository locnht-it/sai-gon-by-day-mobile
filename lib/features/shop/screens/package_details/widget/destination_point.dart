import 'package:flutter/material.dart';

class DestinationPointSection extends StatelessWidget {
  const DestinationPointSection({Key? key}) : super(key: key);

  void _showPopup(BuildContext context, String name, String startTime,
      String endTime, String transportation, String shortDescription) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Start Time: $startTime'),
              Text('End Time: $endTime'),
              Text('Transportation: $transportation'),
              Text('Description: $shortDescription'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Package Service',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // ChoiceChip(
              //   label: Text('Serang'),
              //   selected: false,
              //   onSelected: (selected) {},
              //   backgroundColor: Colors.white,
              // ),
              // SizedBox(width: 8),
              // ChoiceChip(
              //   label: Text('Bandung'),
              //   selected: false,
              //   onSelected: (selected) {},
              //   backgroundColor: Colors.white,
              // ),
              // SizedBox(width: 8),
              // ChoiceChip(
              //   label: Text('Tangerang'),
              //   selected: false,
              //   onSelected: (selected) {},
              //   backgroundColor: Colors.white,
              // ),
              // SizedBox(width: 8),
              // ChoiceChip(
              //   label: Text('Jakarta'),
              //   selected: false,
              //   onSelected: (selected) {},
              //   backgroundColor: Colors.white,
              // ),
              // SizedBox(width: 8),
              // ChoiceChip(
              //   label: Text('Bekasi'),
              //   selected: false,
              //   onSelected: (selected) {},
              //   backgroundColor: Colors.white,
              // ),
              // SizedBox(width: 8),
              // ChoiceChip(
              //   label: Text('Cikampek'),
              //   selected: false,
              //   onSelected: (selected) {},
              //   backgroundColor: Colors.white,
              // ),
              ChoiceChip(
                label: Text('Serang'),
                selected: false,
                onSelected: (selected) {
                  if (selected) {
                    _showPopup(context, 'Serang', '08:00 AM', '05:00 PM', 'Bus', 'Short description about Serang');
                  }
                },
                backgroundColor: Colors.white,
              ),
              const SizedBox(width: 8),
              ChoiceChip(
                label: Text('Bandung'),
                selected: false,
                onSelected: (selected) {
                  if (selected) {
                    _showPopup(context, 'Bandung', '09:00 AM', '06:00 PM',
                        'Train', 'Short description about Bandung');
                  }
                },
                backgroundColor: Colors.white,
              ),
              const SizedBox(width: 8),
              ChoiceChip(
                label: Text('Tangerang'),
                selected: false,
                onSelected: (selected) {
                  if (selected) {
                    _showPopup(context, 'Tangerang', '07:30 AM', '04:30 PM',
                        'Car', 'Short description about Tangerang');
                  }
                },
                backgroundColor: Colors.white,
              ),
              const SizedBox(width: 8),
              ChoiceChip(
                label: Text('Jakarta'),
                selected: false,
                onSelected: (selected) {
                  if (selected) {
                    _showPopup(context, 'Jakarta', '10:00 AM', '08:00 PM',
                        'Plane', 'Short description about Jakarta');
                  }
                },
                backgroundColor: Colors.white,
              ),
              const SizedBox(width: 8),
              ChoiceChip(
                label: Text('Bekasi'),
                selected: false,
                onSelected: (selected) {
                  if (selected) {
                    _showPopup(context, 'Bekasi', '11:00 AM', '09:00 PM', 'Bus',
                        'Short description about Bekasi');
                  }
                },
                backgroundColor: Colors.white,
              ),
              const SizedBox(width: 8),
              ChoiceChip(
                label: Text('Cikampek'),
                selected: false,
                onSelected: (selected) {
                  if (selected) {
                    _showPopup(context, 'Cikampek', '08:30 AM', '06:30 PM',
                        'Train', 'Short description about Cikampek');
                  }
                },
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
