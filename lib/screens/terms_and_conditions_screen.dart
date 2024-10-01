import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

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
              'Términos y Condiciones',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Texto de los términos y condiciones
            const Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'Al usar la aplicación IA MENTE, reconoces que no reemplaza la atención profesional en salud mental y que su uso debe ser de acuerdo con estos Términos y Condiciones. La aplicación utiliza inteligencia artificial para proporcionar apoyo emocional, pero no garantiza resultados específicos y se ofrece "tal cual". Debes tener al menos 15 años para usar la aplicación. La privacidad y protección de tus datos se manejan según nuestra Política de Privacidad.  No somos responsables de daños derivados del uso de la aplicación, y todos los derechos de propiedad intelectual pertenecen a IAmente. Podemos modificar estos términos y suspender tu acceso en caso de violaciones. Estos términos se rigen por las leyes de Perú, y cualquier disputa se resolverá en los tribunales de Perú. Para consultas, contáctanos en adiaz2@autonoma.edu.pe',
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
