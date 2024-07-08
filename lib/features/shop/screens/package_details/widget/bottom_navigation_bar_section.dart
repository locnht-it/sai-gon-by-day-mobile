import 'package:flutter/material.dart';

class BottomNavigationBarSection extends StatelessWidget {
  const BottomNavigationBarSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // Set background color to black
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '\$80 /person',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Set text color to white
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Action when the "Book Now" button is pressed
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'Book Now',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
