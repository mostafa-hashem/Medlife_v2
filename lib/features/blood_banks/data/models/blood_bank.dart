class BloodBank {
  final String id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final List<String> imagesUrls;
  final int numOfReviews;
  final String providerId;

  BloodBank({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.imagesUrls,
    required this.numOfReviews,
    required this.providerId,
  });

  BloodBank.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          title: json['title'] as String,
          description: json['description'] as String,
          price: json['price'] as double,
          rating: json['rating'] as double,
          imagesUrls: (json['imagesUrls'] as List)
              .map((imageUrl) => imageUrl as String)
              .toList(),
          numOfReviews: json['numOfReviews'] as int,
          providerId: json['providerId'] as String,
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'price': price,
        'rating': rating,
        'imagesUrls': imagesUrls,
        'numOfReviews': numOfReviews,
        'providerId': providerId,
      };
}
