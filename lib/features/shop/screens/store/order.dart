import 'package:flutter/material.dart';
import 'package:onedaytrip/common/widgets/appbar/appbar.dart';
import 'package:onedaytrip/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:onedaytrip/utils/constants/colors.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: const Text('My Order'),
        actions: [
          TCartCounterIcon(onPressed: (){}, iconColor: TColors.primary),
        ],
      ),
    );
  }
}