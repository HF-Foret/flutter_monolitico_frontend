import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/user_management/data/datasourses/user_service.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final UserService _userService = UserService();
  late Future<List<dynamic>> _usersFuture;
  List<dynamic> _allUsers = []; // Lista completa de usuarios
  List<dynamic> _filteredUsers = []; // Lista filtrada de usuarios
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usersFuture = _userService.getAllUsers();
    _usersFuture.then((users) {
      setState(() {
        _allUsers = users;
        _filteredUsers =
            users; // Inicialmente, la lista filtrada es igual a la completa
      });
    });
  }

  void _filterUsers(String query) {
    final filtered = _allUsers.where((user) {
      final name = user['name'].toLowerCase();
      final lastName = user['lastName'].toLowerCase();
      final email = user['email'].toLowerCase();
      final phone = user['phone'].toLowerCase();
      final searchQuery = query.toLowerCase();

      return name.contains(searchQuery) ||
          lastName.contains(searchQuery) ||
          email.contains(searchQuery) ||
          phone.contains(searchQuery);
    }).toList();

    setState(() {
      _filteredUsers = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuarios'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterUsers,
              decoration: InputDecoration(
                hintText: 'Buscar por nombre, correo o teléfono',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _usersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child:
                    CircularProgressIndicator()); // Muestra un indicador de carga
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
                    'Error: ${snapshot.error}')); // Muestra un mensaje de error
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text(
                    'No hay usuarios registrados')); // Muestra un mensaje si no hay usuarios
          }

          return ListView.builder(
            itemCount: _filteredUsers.length,
            itemBuilder: (context, index) {
              final user = _filteredUsers[index];
              return ListTile(
                leading: CircleAvatar(
                    child:
                        Text(user['name'][0])), // Muestra la inicial del nombre
                title: Text(
                    '${user['name']} ${user['lastName']}'), // Muestra el nombre completo
                subtitle: Text(user['email']), // Muestra el email
                trailing: Text(user['phone']), // Muestra el teléfono
              );
            },
          );
        },
      ),
    );
  }
}
