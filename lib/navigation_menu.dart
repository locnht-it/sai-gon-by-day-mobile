import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: const[
           NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
           NavigationDestination(icon: Icon(Iconsax.shopping_cart), label: 'Order'),
           NavigationDestination(icon: Icon(Iconsax.ticket), label: 'My Booking'),
           NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
        ],
      ),
    );
  }
}
