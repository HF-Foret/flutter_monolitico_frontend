// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../presentation/state/role_provider.dart';

// class RolesScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final roleProvider = Provider.of<RoleProvider>(context);

//     return Scaffold(
//       appBar: AppBar(title: Text('Roles')),
//       body: FutureBuilder(
//         future: roleProvider.fetchRoles(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             return ListView.builder(
//               itemCount: roleProvider.roles.length,
//               itemBuilder: (context, index) {
//                 final role = roleProvider.roles[index];
//                 return ListTile(
//                   title: Text(role.name),
//                   subtitle: Text(role.route ?? ''),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
