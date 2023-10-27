import 'package:cloud_firestore/cloud_firestore.dart';

class MedicalEquipment {
  final String id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final List<String> imagesUrls;
  final String vendorName;
  final String brandName;
  final String productType;
  final double sellerRating;
  final int numOfReviews;
  final DateTime createdAt;

  MedicalEquipment({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.imagesUrls,
    required this.vendorName,
    required this.brandName,
    required this.productType,
    required this.sellerRating,
    required this.numOfReviews,
    required this.createdAt,
  });

  MedicalEquipment.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          title: json['title'] as String,
          description: json['description'] as String,
          price: json['price'] as double,
          rating: (json['rating'] as num).toDouble(),
          imagesUrls: (json['imagesUrls'] as List)
              .map((imageUrl) => imageUrl as String)
              .toList(),
          vendorName: json['sellerName'] as String,
          brandName: json['brandName'] as String,
          productType: json['productType'] as String,
          sellerRating: json['sellerRating'] as double,
          numOfReviews: json['numOfReviews'] as int,
          createdAt: (json['createdAt'] as Timestamp).toDate(),
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'price': price,
        'rating': rating,
        'imagesUrls': imagesUrls,
        'sellerName': vendorName,
        'sellerRating': sellerRating,
        'brandName': brandName,
        'productType': productType,
        'numOfReviews': numOfReviews,
        'createdAt': createdAt,
      };
}
