// import 'package:flutter/material.dart';
// import '../../domain/entities/role.dart';
// import '../../aplication/useCases/get_roles_usecase.dart';

// class RoleProvider with ChangeNotifier {
//   final GetRolesUseCase getRolesUseCase;
//   List<Role> _roles = [];

//   RoleProvider(this.getRolesUseCase);

//   List<Role> get roles => _roles;

//   Future<void> fetchRoles() async {
//     _roles = await getRolesUseCase.execute();
//     notifyListeners();
//   }
// }
