class Role {
  final int id;
  final String name;
  final String? image;
  final String? route;

  Role({
    required this.id,
    required this.name,
    this.image,
    this.route,
  });

//   factory Role.fromJson(Map<String, dynamic> json) {
//     return Role(
//       id: json['id'],
//       name: json['name'],
//       image: json['image'],
//       route: json['route'],
//     );
//   }
}
