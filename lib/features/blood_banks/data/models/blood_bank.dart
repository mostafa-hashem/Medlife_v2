class BloodBank {
  final String id;
  final String title;
  final String description;
  final double price;
  final List<String> imagesUrls;
  final String providerName;

  BloodBank({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imagesUrls,
    required this.providerName,
  });

  BloodBank.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          title: json['title'] as String,
          description: json['description'] as String,
          price: json['price'] as double,
          imagesUrls: (json['imagesUrls'] as List)
              .map((imageUrl) => imageUrl as String)
              .toList(),
          providerName: json['providerName'] as String,
        );
}
