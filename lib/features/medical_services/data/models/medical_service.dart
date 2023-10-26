class MedicalService {
  final String id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final List<String> imagesUrls;
  final String providerName;
  final double providerRating;
  final int numOfReviews;

  MedicalService({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.imagesUrls,
    required this.providerName,
    required this.providerRating,
    required this.numOfReviews,
  });

  MedicalService.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          title: json['title'] as String,
          description: json['description'] as String,
          price: json['price'] as double,
          rating: (json['rating'] as num).toDouble(),
          imagesUrls: (json['imagesUrls'] as List)
              .map((imageUrl) => imageUrl as String)
              .toList(),
          providerName: json['providerName'] as String,
          providerRating: json['providerRating'] as double,
          numOfReviews: json['numOfReviews'] as int,
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'price': price,
        'rating': rating,
        'imagesUrls': imagesUrls,
        'providerName': providerName,
        'providerRating': providerRating,
        'numOfReviews': numOfReviews,
      };
}
