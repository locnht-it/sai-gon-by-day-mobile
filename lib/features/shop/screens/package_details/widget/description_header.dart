import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';


class DescriptionHeader extends StatelessWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onLogoutPressed;
  final String packageName;
  final String packageShortDescription;

  const DescriptionHeader({
    Key? key,
    required this.onBackPressed,
    required this.onLogoutPressed,
    required this.packageName,
    required this.packageShortDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          TImages.canada,
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 40,
          left: 16,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: onBackPressed,
          ),
        ),
        Positioned(
          top: 40,
          right: 16,
          child: IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: onLogoutPressed,
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                packageName.isNotEmpty ? packageName : 'Loading...',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                packageShortDescription.isNotEmpty ? packageShortDescription : 'Loading...',
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ],
    );
  }
}