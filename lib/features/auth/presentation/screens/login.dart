import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _showPassword = false; // Controla si la contraseña es visible

  final AuthRemoteDataSource _authService =
      AuthRemoteDataSourceImpl(); // Instancia del servicio

  Future<void> _authenticateUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      final token = await _authService.login(email, password);

      setState(() {
        _isLoading = false;
      });

      if (token != null) {
        // Si el login es exitoso, redirige al menú principal
        Navigator.pushNamed(context, '/main/menu');
      } else {
        // Si el login falla, muestra un mensaje de error
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Credenciales incorrectas')),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      // Manejo de errores
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.blue[900]!,
              Colors.blue[800]!,
              Colors.blue[400]!,
            ],
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double logoWidth = constraints.maxWidth * 0.3;
            logoWidth = logoWidth.clamp(100.0, 200.0);

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.15,
                ),
                Image.asset(
                  "assets/images/ULV.png",
                  width: logoWidth,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Iniciar Sesión',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Título en blanco
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),
                        TextFormField(
                          controller: _emailController,
                          style: const TextStyle(
                              color: Colors.white), // Texto en blanco
                          decoration: const InputDecoration(
                            labelText: 'Correo electrónico',
                            labelStyle: TextStyle(
                                color: Colors.white), // Etiqueta en blanco
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white), // Borde blanco
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      Colors.white), // Borde blanco al enfocar
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, ingresa tu correo';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Ingresa un correo válido';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _passwordController,
                          style: const TextStyle(
                              color: Colors.white), // Texto en blanco
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            labelStyle: const TextStyle(
                                color: Colors.white), // Etiqueta en blanco
                            border: const OutlineInputBorder(),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white), // Borde blanco
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      Colors.white), // Borde blanco al enfocar
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white, // Ícono en blanco
                              ),
                              onPressed: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                            ),
                          ),
                          obscureText:
                              !_showPassword, // Controla si la contraseña es visible
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, ingresa tu contraseña';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Checkbox(
                              value: _showPassword,
                              onChanged: (value) {
                                setState(() {
                                  _showPassword = value!;
                                });
                              },
                              activeColor: Colors.white, // Color del checkbox
                              checkColor: Colors.blue[900], // Color del check
                            ),
                            const Text(
                              'Mostrar contraseña',
                              style: TextStyle(
                                  color: Colors.white), // Texto en blanco
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        _isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : ElevatedButton(
                                onPressed: _authenticateUser,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors
                                      .blue[900], // Color de fondo del botón
                                  foregroundColor:
                                      Colors.white, // Color del texto del botón
                                ),
                                child: const Text('Iniciar Sesión'),
                              ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.1),
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        text: "No tienes cuenta: ",
                        children: [
                          TextSpan(
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            text: "Regístrate",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/register');
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            );
          },
        ),
      ),
    );
  }
}
