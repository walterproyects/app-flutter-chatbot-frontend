import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyectotwalterfrontend/widgets/custom_button.dart';
import 'important_notice_screen.dart'; // Importar la pantalla de aviso importante
import '../services/auth_service.dart'; // Importar el servicio de autenticación
import 'dart:developer'; // Para logs

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Función para manejar el login tradicional
  Future<void> _loginTraditional() async {
    String email = emailController.text;
    String password = passwordController.text;

    // Validar que los campos no estén vacíos
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, ingresa tu correo y contraseña')),
      );
      return;
    }

    try {
      // Llamar al servicio de login tradicional
      final response = await AuthService.loginTraditional(email, password);

      if (response.statusCode == 200) {
        // Después de autenticarse correctamente, usa pushReplacement

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ImportantNoticeScreen()),
        );
      } else {
        // Mostrar un mensaje de error si las credenciales son incorrectas
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
                  Text('Error al iniciar sesión. Verifica tus credenciales.')),
        );
      }
    } catch (e) {
      // Manejar errores
      log('Error en la solicitud de login: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error de conexión al servidor')),
      );
    }
  }

  Future<void> _handleGoogleSignIn(BuildContext context) async {
    try {
      // Iniciar sesión con Google
      User? user = await AuthService.signInWithGoogle();

      if (user != null) {
        // Obtener el token de usuario
        String? idToken = await user.getIdToken();

        if (idToken != null) {
          // Enviar el token al backend
          await AuthService.sendTokenToBackend(idToken);

          // Navegar a la pantalla de aviso importante
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ImportantNoticeScreen()),
          );
        } else {
          // Manejar el caso donde el idToken sea nulo
          print('Error: el token de ID es nulo');
        }
      } else {
        // Manejar el caso donde el usuario sea nulo
        print('Error: no se pudo obtener el usuario');
      }
    } catch (e) {
      // Manejar cualquier excepción
      print('Error during Google SignIn: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 80), // Espacio superior

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          style: TextStyle(fontSize: 24, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(text: '¡Hola! Soy '),
                            TextSpan(
                              text: 'IAMente',
                              style: TextStyle(
                                color: Colors.lightBlue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "Mucho gusto en poder hablar contigo, la mayoría de nuestras conversaciones serán privadas, pero necesitamos que inicies sesión. Ingresa tu cuenta o regístrate.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),

                      const SizedBox(height: 40),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/pandalogo2.png',
                            height: 60,
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Campo de texto para el correo electrónico
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          labelText: 'Ingresar correo electrónico o número',
                          labelStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Campo de texto para la contraseña
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          labelText: 'Contraseña',
                          labelStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Botón de ingreso utilizando el servicio de autenticación
                      CustomButton(
                          text: 'INGRESAR',
                          onPressed: () async {
                            await _loginTraditional();
                          }),

                      const SizedBox(height: 20),
                      const Text('or', style: TextStyle(color: Colors.grey)),

                      const SizedBox(height: 20),
                      // Botón para iniciar sesión con Google o Facebook
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Image.asset('assets/images/google_logo.png'),
                            iconSize: 40,
                            onPressed: () async {
                              await _handleGoogleSignIn(context);
                            },
                          ),
                          const SizedBox(width: 20),
                          IconButton(
                            icon:
                                Image.asset('assets/images/facebook_logo.png'),
                            iconSize: 40,
                            onPressed: () {
                              // Lógica para iniciar sesión con Facebook (puedes implementar después)
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
