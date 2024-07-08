import 'package:flutter/material.dart';

class PaxSection extends StatelessWidget {
  const PaxSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Number of pax',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Decrease the number of pax
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Icon(Icons.remove, size: 20),
                    ),
                  ),
                  SizedBox(width: 8),
                  const Text(
                    '1',
                    style: TextStyle(fontSize: 24), // Kích thước số lớn hơn
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      // Increase the number of pax
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Icon(Icons.add, size: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          const Text(
            '\$80 /pax',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
