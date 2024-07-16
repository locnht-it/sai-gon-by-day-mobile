import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:onedaytrip/common/widgets/layouts/grid_layout.dart';
import 'package:onedaytrip/common/widgets/layouts/horizontal_layout.dart';
import 'package:onedaytrip/features/shop/screens/all_products/all_products.dart';
import 'package:onedaytrip/features/shop/screens/home/widgets/%20promo_slider.dart';
import 'package:onedaytrip/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:onedaytrip/features/shop/screens/home/widgets/home_categories.dart';
import 'package:onedaytrip/features/shop/screens/home/widgets/nearest_location_section.dart';
import 'package:onedaytrip/navigation_menu.dart';
import 'package:onedaytrip/utils/constants/image_strings.dart';
import 'package:onedaytrip/utils/constants/sizes.dart';
import '../../../../api/fetch_api/package.dart';
import '../../../../api/global_variables/package_manage.dart';
import '../../../../common/widgets/articles/article_card.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/products/product_cards/product_card_horizontal.dart';
import '../../../../common/widgets/products/product_cards/product_card_verticle.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import 'package:http/http.dart' as http;


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> selectedCategories = [];
  List<String> selectedBrands = [];
  RangeValues selectedPriceRange = RangeValues(50, 5000);
  int selectedReview = 0;
  int minAttendee = 0;
  int maxAttendee = 100;
  bool sortAsc = false;
  bool sortDesc = false;
  DateTime? selectedDate;
  String searchQuery = '';
  Future<List<PackageManage>>? searchResults;
  String? selectedCity;
  List<String> cities = ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix'];



  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            final List<String> categories = ['Vegetables', 'Groceries', 'Fruits', 'Chicken'];
            final List<String> brands = ['KANKANI MANDI', 'RICE BRAND', 'MALIGALI', 'THANGAM SEAFOOD'];
            List<String> localSelectedCategories = [...selectedCategories];
            List<String> localSelectedBrands = [...selectedBrands];
            RangeValues localPriceRange = selectedPriceRange;
            int localSelectedReview = selectedReview;
            int localMinAttendee = minAttendee;
            int localMaxAttendee = maxAttendee;
            bool isSortAsc = sortAsc;
            bool isSortDesc = sortDesc;
            DateTime? localSelectedDate = selectedDate;
            String? localSelectedCity = selectedCity;

            TextEditingController minPriceController = TextEditingController(text: localPriceRange.start.toStringAsFixed(0));
            TextEditingController maxPriceController = TextEditingController(text: localPriceRange.end.toStringAsFixed(0));
            TextEditingController minAttendeeController = TextEditingController(text: localMinAttendee.toString());
            TextEditingController maxAttendeeController = TextEditingController(text: localMaxAttendee.toString());

            return AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Filters'),
                  GestureDetector(
                    onTap: () {
                      // Reset action
                      setState(() {
                        localSelectedCategories.clear();
                        localSelectedBrands.clear();
                        localPriceRange = RangeValues(50, 5000);
                        localSelectedReview = 0;
                        localMinAttendee = 0;
                        localMaxAttendee = 100;
                        isSortAsc = false;
                        isSortDesc = false;
                        selectedDate = null;
                        localSelectedDate = null;
                        localSelectedCity = null;
                      });
                    },
                    child: Text('Reset', style: TextStyle(color: Colors.green)),
                  ),
                ],
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Search Categories
                    // TextField(
                    //   decoration: InputDecoration(
                    //     hintText: 'Search Categories',
                    //     prefixIcon: Icon(Icons.search),
                    //     border: OutlineInputBorder(),
                    //   ),
                    // ),

                    // City/Country Selection
                    Text('Việt Nam của tôi', style: TextStyle(fontFamily: 'Poppins'),),
                    FutureBuilder<List<String>>(
                      future: fetchCities(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Text('No cities available');
                        } else {
                          return DropdownButton<String>(
                            isExpanded: true,
                            value: localSelectedCity,
                            hint: Text('Select City/Country'),
                            items: snapshot.data!.map((city) {
                              return DropdownMenuItem<String>(
                                value: city,
                                child: Text(city, style: TextStyle(fontFamily: 'Inter'),),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                localSelectedCity = value;
                              });
                            },
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 16),

                    // Price Range
                    Text('Price Range'),
                    // RangeSlider(
                    //   values: localPriceRange,
                    //   min: 50,
                    //   max: 5000,
                    //   divisions: 100,
                    //   labels: RangeLabels('\$${localPriceRange.start.toStringAsFixed(0)}', '\$${localPriceRange.end.toStringAsFixed(0)}'),
                    //   onChanged: (RangeValues values) {
                    //     setState(() {
                    //       localPriceRange = values;
                    //     });
                    //   },
                    // ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: minPriceController,
                            decoration: InputDecoration(
                              labelText: 'Min',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              final newValue = double.tryParse(value) ?? localPriceRange.start;
                              setState(() {
                                localPriceRange = RangeValues(newValue, localPriceRange.end);
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            controller: maxPriceController,
                            decoration: InputDecoration(
                              labelText: 'Max',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              final newValue = double.tryParse(value) ?? localPriceRange.end;
                              setState(() {
                                localPriceRange = RangeValues(localPriceRange.start, newValue);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Attendee Number
                    Text('Attendee Number'),
                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: minAttendeeController,
                            decoration: InputDecoration(
                              labelText: 'Min',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              final newValue = int.tryParse(value) ?? localMinAttendee;
                              setState(() {
                                localMinAttendee = newValue;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            controller: maxAttendeeController,
                            decoration: InputDecoration(
                              labelText: 'Max',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              final newValue = int.tryParse(value) ?? localMaxAttendee;
                              setState(() {
                                localMaxAttendee = newValue;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // // Sort Options
                    // Text('Sort Options'),
                    // CheckboxListTile(
                    //   title: Text('Sort Ascending'),
                    //   value: isSortAsc,
                    //   onChanged: (bool? value) {
                    //     setState(() {
                    //       isSortAsc = value ?? false;
                    //       if (isSortAsc) {
                    //         isSortDesc = false;
                    //       }
                    //     });
                    //   },
                    // ),
                    // CheckboxListTile(
                    //   title: Text('Sort Descending'),
                    //   value: isSortDesc,
                    //   onChanged: (bool? value) {
                    //     setState(() {
                    //       isSortDesc = value ?? false;
                    //       if (isSortDesc) {
                    //         isSortAsc = false;
                    //       }
                    //     });
                    //   },
                    // ),

                    // Sort Options
                    Text('Sort Options'),
                    CheckboxListTile(
                      title: Text('Sort Ascending'),
                      value: isSortAsc,
                      onChanged: (bool? value) {
                        setState(() {
                          isSortAsc = value ?? false;
                          if (isSortAsc) {
                            isSortDesc = false;
                          }
                          sortAsc = isSortAsc;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: Text('Sort Descending'),
                      value: isSortDesc,
                      onChanged: (bool? value) {
                        setState(() {
                          isSortDesc = value ?? false;
                          if (isSortDesc) {
                            isSortAsc = false;
                          }
                          sortDesc = isSortDesc;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    // Date Picker
                    Text('Select Date'),
                    TextButton(
                      onPressed: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: localSelectedDate ?? DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null && pickedDate != selectedDate) {
                          setState(() {
                            selectedDate = pickedDate;
                          });
                        }
                      },
                      child: Text(
                        localSelectedDate == null ? 'Pick a date' : DateFormat('yyyy-MM-dd').format(selectedDate!),
                    ),
                    // Customer Review (Commented Out)
                    // Text('Customer Review'),
                    // Column(
                    //   children: [
                    //     RadioListTile(
                    //       title: Row(
                    //         children: [
                    //           Icon(Icons.star, color: Colors.amber),
                    //           Icon(Icons.star, color: Colors.amber),
                    //           Icon(Icons.star, color: Colors.amber),
                    //           Icon(Icons.star, color: Colors.grey),
                    //           Icon(Icons.star, color: Colors.grey),
                    //           Text(' & up'),
                    //         ],
                    //       ),
                    //       value: 3,
                    //       groupValue: localSelectedReview,
                    //       onChanged: (value) {
                    //         setState(() {
                    //           localSelectedReview = value as int;
                    //         });
                    //       },
                    //     ),
                    //     RadioListTile(
                    //       title: Row(
                    //         children: [
                    //           Icon(Icons.star, color: Colors.amber),
                    //           Icon(Icons.star, color: Colors.amber),
                    //           Icon(Icons.star, color: Colors.grey),
                    //           Icon(Icons.star, color: Colors.grey),
                    //           Icon(Icons.star, color: Colors.grey),
                    //           Text(' & up'),
                    //         ],
                    //       ),
                    //       value: 2,
                    //       groupValue: localSelectedReview,
                    //       onChanged: (value) {
                    //         setState(() {
                    //           localSelectedReview = value as int;
                    //         });
                    //       },
                    //     ),
                    //     RadioListTile(
                    //       title: Row(
                    //         children: [
                    //           Icon(Icons.star, color: Colors.amber),
                    //           Icon(Icons.star, color: Colors.grey),
                    //           Icon(Icons.star, color: Colors.grey),
                    //           Icon(Icons.star, color: Colors.grey),
                    //           Icon(Icons.star, color: Colors.grey),
                    //           Text(' & up'),
                    //         ],
                    //       ),
                    //       value: 1,
                    //       groupValue: localSelectedReview,
                    //       onChanged: (value) {
                    //         setState(() {
                    //           localSelectedReview = value as int;
                    //         });
                    //       },
                    //     ),
                    //   ],
                    // ),
                    )],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      selectedCategories = localSelectedCategories;
                      selectedBrands = localSelectedBrands;
                      selectedPriceRange = localPriceRange;
                      selectedReview = localSelectedReview;
                      minAttendee = localMinAttendee;
                      maxAttendee = localMaxAttendee;
                      sortAsc = isSortAsc;
                      sortDesc = isSortDesc;
                      selectedDate = localSelectedDate;
                      selectedCity = localSelectedCity;
                    });
                    Navigator.of(context).pop();
                    // Apply filter action
                    // Pass selectedCategories, selectedBrands, selectedPriceRange, selectedReview, minAttendee, maxAttendee, sortAsc, sortDesc, and selectedDate to the search function
                  },

              // actions: [
              //   TextButton(
              //     onPressed: () {
              //       setState(() {
              //         selectedCategories = localSelectedCategories;
              //         selectedBrands = localSelectedBrands;
              //         selectedPriceRange = localPriceRange;
              //         selectedReview = localSelectedReview;
              //         minAttendee = localMinAttendee;
              //         maxAttendee = localMaxAttendee;
              //         sortAsc = isSortAsc;
              //         sortDesc = isSortDesc;
              //         selectedDate = localSelectedDate;
              //       });
              //       Navigator.of(context).pop();
              //       // Apply filter action
              //       // Pass selectedCategories, selectedBrands, selectedPriceRange, selectedReview, minAttendee, maxAttendee, sortAsc, sortDesc, and selectedDate to the search function
              //     },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      },
    );
  }


  void _searchPackages(String query) {
    setState(() {
      searchQuery = query;
      searchResults = fetchPackagesByName(query);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const THomeAppBar(),
            const SizedBox(height: 16),
            TSearchContainer(
              text: 'Search',
              onFilterTap: () => _showFilterDialog(context),
              selectedCategories: selectedCategories,
              selectedBrands: selectedBrands,
              priceRange: selectedPriceRange,
              onSearch: _searchPackages, // Callback for searching
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            // Display search results if any
            FutureBuilder<List<PackageManage>>(
              future: searchResults,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No packages found'));
                }

                final searchPackages = snapshot.data!;

                return TGridLayout(
                  itemCount: searchPackages.length,
                  itemBuilder: (_, index) => TProductCardVertical(
                    packageId: searchPackages[index].id,
                    packageName: searchPackages[index].packageName,
                    packageDescription: searchPackages[index].packageDescription,
                    price: searchPackages[index].price.toString(),
                    galleryUrls: searchPackages[index].galleryUrls,
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace),
              child: Column(
                children: [
                  TSectionHeading(
                    title: 'Popular Nearby',
                    showActionButton: true,
                    textColor: Colors.black,
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const THomeCategories(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(banners: [
                    TImages.chicago,
                    TImages.lima,
                    TImages.tokyo,
                  ]),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(
                    title: 'Nearest your location',
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  FutureBuilder<List<PackageManage>>(
                    future: fetchPackages(ids: [3, 4]),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No packages found'));
                      }

                      final nearestPackages = snapshot.data!;

                      return TGridLayout(
                        itemCount: nearestPackages.length,
                        itemBuilder: (_, index) => TProductCardVertical(
                          packageId: nearestPackages[index].id,
                          packageName: nearestPackages[index].packageName,
                          packageDescription: nearestPackages[index].packageDescription,
                          price: nearestPackages[index].price.toString(),
                          galleryUrls: nearestPackages[index].galleryUrls,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace,
                vertical: TSizes.defaultSpace / 2,
              ),
              child: Column(
                children: [
                  TSectionHeading(
                    title: 'Recommended',
                    showActionButton: true,
                    textColor: Colors.black,
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  FutureBuilder<List<PackageManage>>(
                    future: fetchRecommendedPackages(), // Gọi hàm fetchRecommendedPackages
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No recommended packages found'));
                      }

                      final recommendedPackages = snapshot.data!;

                      return THorizontalLayout(
                        itemCount: recommendedPackages.length,
                        itemBuilder: (_, index) => TProductCardHorizontal(
                          packageId: recommendedPackages[index].id,
                          packageName: recommendedPackages[index].packageName,
                          packageDescription: recommendedPackages[index].packageDescription,
                          galleryUrls: recommendedPackages[index].galleryUrls,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace,
                vertical: TSizes.defaultSpace / 2,
              ),
              child: Column(
                children: [
                  TSectionHeading(
                    title: 'Article',
                    showActionButton: true,
                    textColor: Colors.black,
                    onPressed: () {},
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return const ArticleCard(
                          imageUrl: AssetImage(TImages.canada),
                          title: 'The essential guide to visiting Canada',
                          author: 'Alexander Wooley',
                          date: '5 June 2024',
                          url: 'https://www.nationalgeographic.com/travel/article/essential-guide-canada',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}