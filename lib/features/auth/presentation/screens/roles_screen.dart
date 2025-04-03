// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../../domain/entities/role.dart';
// import '../../domain/repositories/role_repository.dart';

// class RoleRepositoryImpl implements RoleRepository {
//   final String apiUrl = 'http://tu-api-url.com/api';

//   @override
//   Future<List<Role>> getRoles() async {
//     final response = await http.get(Uri.parse('$apiUrl/roles'));

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       return data
//           .map((json) => Role(
//                 id: json['id'],
//                 name: json['name'],
//                 route: json['route'],
//               ))
//           .toList();
//     } else {
//       throw Exception('Error al obtener los roles');
//     }
//   }
// }
