import 'dart:convert';

import 'package:data/mapper/student_mapper.dart';
import 'package:domain/entity/student_entity.dart';

import 'package:http/http.dart' as http;

class ApiDataSource {
  final StudentMapper _mapper;

  ApiDataSource(this._mapper);

  Future<List<Student>> getStudentsList() async {
    final response = await http.get(
      Uri.parse('https://hp-api.onrender.com/api/characters/students'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    final list = jsonDecode(response.body) as List<dynamic>;
    return list.map((e) => _mapper.convert(e)).toList();
  }
}
