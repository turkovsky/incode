import 'package:domain/entity/house.dart';
import 'package:domain/entity/student_entity.dart';

class StudentMapper {
  Student convert(dynamic json) {
    final map = json as Map<String, dynamic>;
    final houseName = (map['house'] as String?)?.toLowerCase();
    final house = House.values.firstWhere(
        (h) => h.title.toLowerCase() == houseName,
        orElse: () => House.not_in_house);
    return Student(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      house: house,
      dateOfBirth: map['dateOfBirth'] ?? '',
      actor: map['actor'] ?? '',
      species: map['species'] ?? '',
      image: map['image'] ?? '',
    );
  }
}
