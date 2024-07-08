import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:onedaytrip/features/shop/screens/package_details/widget/bottom_navigation_bar_section.dart';
import 'package:onedaytrip/features/shop/screens/package_details/widget/date_section.dart';
import 'package:onedaytrip/features/shop/screens/package_details/widget/description_section.dart';
import 'package:onedaytrip/features/shop/screens/package_details/widget/destination_point.dart';
import 'package:onedaytrip/features/shop/screens/package_details/widget/detail_section.dart';
import 'package:onedaytrip/features/shop/screens/package_details/widget/facilities_section.dart';
import 'package:onedaytrip/features/shop/screens/package_details/widget/pax_section.dart';
import 'package:onedaytrip/features/shop/screens/package_details/widget/top_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/constants/image_strings.dart';


class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  void _launchURL(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  void _showImages(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Additional Images',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                CarouselSlider(
                  options: CarouselOptions(height: 400.0),
                  items: [
                    TImages.chicago,
                    TImages.chicago,
                    TImages.chicago,
                    TImages.chicago,
                    TImages.chicago,
                    TImages.chicago,
                  ].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 1000),
                          child: Image.asset(i, fit: BoxFit.cover),
                        );
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopImageSection(
              onBackPressed: () => Navigator.pop(context),
              onLogoutPressed: () {
                // Logout logic here
              },
              onShowImagesPressed: () => _showImages(context),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailSection(),
                  SizedBox(height: 16),
                  DescriptionSection(),
                  SizedBox(height: 16),
                  DateSection(),
                  SizedBox(height: 16),
                  DestinationPointSection(),
                  SizedBox(height: 16),
                  PaxSection(),
                  SizedBox(height: 16),
                  FacilitiesSection(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarSection(),
    );
  }
}


