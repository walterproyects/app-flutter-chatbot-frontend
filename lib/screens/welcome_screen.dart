import 'package:flutter/material.dart';
import 'login_screen.dart';  // Asegúrate de importar la pantalla de login

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Imagen del panda
              Image.asset(
                'assets/images/pandalogo1.png',
                height: 200,
              ),
              const SizedBox(height: 40),
              
              // Texto "¡Hola! Soy IAMente"
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(fontSize: 24, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: '¡Hola! Soy '),
                    TextSpan(
                      text: 'IAMente',
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 10),
              
              // Texto de descripción
              const Text(
                'Estoy aquí para escucharte y cuidarte',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
      
      // Botón flotante que lleva a la pantalla de login
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar a la pantalla de login cuando se presiona el botón
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.arrow_downward, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
