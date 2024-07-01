import 'package:flutter/material.dart';


// class THomeCategoryItem extends StatelessWidget {
//   final String image;
//   final String title;
//   final String location;
//   final double rating;
//
//   const THomeCategoryItem({
//     required this.image,
//     required this.title,
//     required this.location,
//     required this.rating,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 160,
//       margin: const EdgeInsets.symmetric(horizontal: 8.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12.0),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
//             child: Image.asset(
//               image,
//               height: 100,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: Theme.of(context).textTheme.bodyMedium,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 Text(
//                   location,
//                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
//                 ),
//                 Row(
//                   children: [
//                     const Icon(Icons.star, color: Colors.amber, size: 16.0),
//                     Text(rating.toString(), style: Theme.of(context).textTheme.bodyMedium),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class THomeCategoryItem extends StatelessWidget {
  final String image;
  final String title;
  final String location;
  final double rating;

  const THomeCategoryItem({
    required this.image,
    required this.title,
    required this.location,
    required this.rating,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.asset(
              image,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  location,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16.0),
                    Text(rating.toString(), style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

