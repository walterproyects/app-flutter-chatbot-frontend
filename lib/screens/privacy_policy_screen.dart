import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 90), // Espacio superior

            // Imagen
            Image.asset(
              'assets/images/pandalogo4.png', // Cambia la ruta a tu imagen
              height: 150,
            ),
            const SizedBox(height: 20),

            // Título
            const Text(
              'Políticas de Privacidad',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Texto de las políticas de privacidad
            const Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'En IA MENTE, valoramos tu privacidad y protegemos tus datos personales de acuerdo con nuestra Política de Privacidad. Recopilamos información personal, datos de uso y datos sobre tu estado emocional para ofrecerte un apoyo emocional personalizado y mejorar nuestros servicios. No compartimos tu información con terceros, excepto con tu consentimiento, para cumplir con la ley o con proveedores de servicios que actúan en nuestro nombre bajo estrictas condiciones de protección de datos. Implementamos medidas de seguridad para proteger tu información, aunque no podemos garantizar una seguridad absoluta. Tienes derecho a acceder, corregir o eliminar tu información personal. Cualquier cambio a esta política será notificado a través de la aplicación o por correo electrónico. Para preguntas o inquietudes, contáctanos en adiaz22@autonoma.edu.pe.',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),

            // Botón "Comprendido"
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Regresar a la pantalla anterior
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text(
                'COMPRENDIDO',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),

            const SizedBox(height: 20), // Espacio inferior
          ],
        ),
      ),
    );
  }
}
