import 'package:flutter/material.dart';
import 'package:onedaytrip/utils/constants/sizes.dart';

class THorizontalLayout extends StatelessWidget {
  const THorizontalLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 80,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: TSizes.defaultSpace / 4),
          child: SizedBox(
            height: mainAxisExtent,
            child: itemBuilder(context, index),
          ),
        );
      },
    );
  }
}
