import 'package:domain/entity/house.dart';

class Student {
  final String id;
  final String name;
  final House house;
  final String dateOfBirth;
  final String actor;
  final String species;
  final String image;

  Student({
    required this.id,
    required this.name,
    required this.house,
    required this.dateOfBirth,
    required this.actor,
    required this.species,
    required this.image,
  });
}
