class MedicalEquipment {
  final String title;
  final String description;
  final double price;
  final double rating;
  final List<String> imagesUrls;
  final DateTime createdAt;

  MedicalEquipment({
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.imagesUrls,
    required this.createdAt,
  });
}
