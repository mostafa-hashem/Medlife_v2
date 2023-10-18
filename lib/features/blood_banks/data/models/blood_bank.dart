import 'package:cloud_firestore/cloud_firestore.dart';

class BloodBank {
  final String title;
  final String description;
  final double price;
  final List<String> imagesUrls;
  final String providerName;
  final int numOfReviews;
  final DateTime createdAt;

  BloodBank({
    required this.title,
    required this.description,
    required this.price,
    required this.imagesUrls,
    required this.providerName,
    required this.numOfReviews,
    required this.createdAt,
  });

  BloodBank.fromJson(Map<String, dynamic> json)
      : this(
          title: json['title'] as String,
          description: json['description'] as String,
          price: json['price'] as double,
          imagesUrls: (json['imagesUrls'] as List)
              .map((imageUrl) => imageUrl as String)
              .toList(),
          providerName: json['providerName'] as String,
          numOfReviews: json['numOfReviews'] as int,
          createdAt: (json['createdAt'] as Timestamp).toDate(),
        );
}
