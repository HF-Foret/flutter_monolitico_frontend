import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/presentation/screens/login.dart';
import 'package:flutter_application_1/features/auth/presentation/screens/main_menu.dart';
import 'package:flutter_application_1/features/auth/presentation/screens/order_detail_screen.dart';
import 'package:flutter_application_1/features/auth/presentation/screens/order_history_screen.dart';
import 'package:flutter_application_1/features/auth/presentation/screens/orders_screen.dart';
import 'package:flutter_application_1/features/auth/presentation/screens/products_list.dart';
import 'package:flutter_application_1/features/auth/presentation/screens/register.dart';
import 'package:flutter_application_1/features/auth/presentation/screens/profile.dart';
import 'package:flutter_application_1/features/auth/presentation/screens/admin_users.dart';
import 'package:flutter_application_1/features/auth/presentation/screens/user_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestión de Usuarios',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/main/menu': (context) => const MainMenu(),
        '/register': (context) => const Register(),
        '/profile': (context) => const Profile(),
        '/user_list': (context) => const UserListScreen(),
        '/admin/users': (context) => const AdminUsers(),
        '/orders': (context) => const OrdersScreen(),
        '/product/list': (context) => const ProductsScreen(),
        '/orders/history': (context) => const OrderHistoryScreen(),
        '/order/detail': (context) => const OrderDetailScreen(
              orderId: '#',
            ),
      },
      onGenerateRoute: (settings) {
        if (settings.name != null && settings.name!.startsWith('/order/')) {
          final orderId = settings.name!.split('/').last;
          return MaterialPageRoute(
            builder: (context) => OrderDetailScreen(orderId: orderId),
          );
        }
        return null;
      },
    );
  }
}

void main() {
  runApp(const MyApp());
}
