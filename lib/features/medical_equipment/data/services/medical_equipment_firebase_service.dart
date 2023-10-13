import 'package:medlife_v2/features/medical_equipment/data/models/medical_equipment.dart';

class MedicalEquipmentFirebaseService {
  Future<List<MedicalEquipment>> getAllMedicalEquipments() async {
    await Future.delayed(const Duration(seconds: 1));
    return List.generate(
      10,
      (index) => MedicalEquipment(
        title: 'Compression device',
        description:
            'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad',
        price: 9.98,
        rating: index.isEven ? 4.5 : 3.5,
        imagesUrls: [
          "assets/images/Frame 69.png",
        ],
        createdAt: DateTime.now(),
      ),
    );
  }
}
