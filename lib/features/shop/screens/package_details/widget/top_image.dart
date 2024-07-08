import 'package:flutter/material.dart';

class TopImageSection extends StatelessWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onLogoutPressed;
  final VoidCallback onShowImagesPressed;

  const TopImageSection({
    Key? key,
    required this.onBackPressed,
    required this.onLogoutPressed,
    required this.onShowImagesPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/places/canada.jpg.avif', // Đường dẫn đến hình ảnh
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 40,
          left: 16,
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: onBackPressed,
          ),
        ),
        Positioned(
          top: 40,
          right: 16,
          child: IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: onLogoutPressed, // Logout here
          ),
        ),
        const Positioned(
          bottom: 16,
          left: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Semeru Mountain',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                'Malang, East Java',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: GestureDetector(
            onTap: onShowImagesPressed,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.photo_library, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    '5+',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
