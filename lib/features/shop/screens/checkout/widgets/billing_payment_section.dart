import 'package:flutter/material.dart';
import 'package:onedaytrip/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:onedaytrip/common/widgets/texts/section_heading.dart';
import 'package:onedaytrip/utils/constants/colors.dart';
import 'package:onedaytrip/utils/constants/image_strings.dart';
import 'package:onedaytrip/utils/constants/sizes.dart';
import 'package:onedaytrip/utils/helpers/helper_functions.dart';

// class TBillingPaymentSection extends StatelessWidget {
//   const TBillingPaymentSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);
//     return Column(
//       children: [
//         TSectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: (){}),
//         const SizedBox(height: TSizes.spaceBtwItems / 2),
//         Row(
//           children: [
//             TRoundedContainer(
//               width: 60,
//               height: 35,
//               backgroundColor: dark ? TColors.light : TColors.white,
//               padding: const EdgeInsets.all(TSizes.sm),
//               child: const Image(image: AssetImage(TImages.payPal), fit: BoxFit.contain),
//             ),
//             const SizedBox(width: TSizes.spaceBtwItems / 2),
//             Text('Paypal', style: Theme.of(context).textTheme.bodyLarge),
//           ],
//         )
//       ],
//     );
//   }
// }


class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Payment Information',
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  title: Text('Thông tin chuyển khoản',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Nội dung chuyển khoản: \nSDT_HoVaTen',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18, // Increase the font size as needed
                        ),
                      ),
                      SizedBox(height: 10),
                      // Text('STK: 0312341934234', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                      // SizedBox(height: 10),
                      // Text('Người nhận: Namlee Entertainment', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      // SizedBox(height: 10),
                      // Text('Vietcombank - Ngân hàng thương mại cổ phần Ngoại thương Việt Nam', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      // SizedBox(height: 10),
                      // Thêm hình ảnh QR Code
                      Image.asset(
                        TImages.qrCode,
                        height: 250,
                        width: 250,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            TRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? TColors.light : TColors.white,
              padding: const EdgeInsets.all(TSizes.sm),
              child: const Image(
                image: AssetImage(TImages.domesticTransfer),
                width: 100,
                height: 100,
                // fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Text('Domestic Transfer', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoRow(String title, {String? subtitle, double? fontSize}) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: TSizes.xs),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize ?? TSizes.fontSizeMd,
          ),
        ),
        subtitle: subtitle != null ? Text(subtitle) : null,
      ),
    );
  }
}
