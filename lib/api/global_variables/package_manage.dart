class PackageManage {
  final int id;
  final String packageName;
  final String packageDescription;
  final String packageShortDescription;
  final double price;
  final List<String> galleryUrls;

  PackageManage({
    required this.id,
    required this.packageName,
    required this.packageDescription,
    required this.packageShortDescription,
    required this.price,
    required this.galleryUrls,
  });

  factory PackageManage.fromJson(Map<String, dynamic> json) {
    return PackageManage(
      id: json['id'],
      packageName: json['packageName'],
      packageDescription: json['packageDescription'],
      packageShortDescription: json['packageShortDescription'],
      price: json['price'],
      galleryUrls: List<String>.from(json['galleryUrls']),
    );
  }
}
