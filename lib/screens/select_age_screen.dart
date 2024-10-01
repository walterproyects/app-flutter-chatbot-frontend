import 'package:flutter/material.dart';
import 'package:proyectotwalterfrontend/screens/important_notice_screen.dart';
import 'chat_screen.dart'; // Importa la pantalla de chat
import '../widgets/custom_button.dart'; // Importa tu custom button
import '../services/user_service.dart'; // Importa el servicio de usuario

class SelectAgeScreen extends StatefulWidget {
  final String alias; // Asegúrate de que el alias sea requerido

  const SelectAgeScreen(
      {super.key, required this.alias}); // El alias es requerido

  @override
  _SelectAgeScreenState createState() => _SelectAgeScreenState();
}

class _SelectAgeScreenState extends State<SelectAgeScreen> {
  String? selectedAge;
  final UserService _userService = UserService(); // Instancia del servicio

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Aquí simplemente devolvemos `false` para evitar retroceder
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const ImportantNoticeScreen()),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 140),
                  // Imagen del panda
                  Image.asset('assets/images/pandalogo6.png', height: 150),
                  const SizedBox(height: 20),

                  // Título con el alias del usuario
                  Text(
                    '¡Hola, ${widget.alias}!, ¿Cuántos años tienes?',
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),

                  // Subtítulo
                  const Text(
                    'Estamos encantados de escucharte y ayudarte, pero necesitamos saber tu edad para tener una mejor experiencia.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),

                  // Opción: 18 años o más
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAge = '18 años o más';
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: selectedAge == '18 años o más'
                              ? Colors.green
                              : Colors.grey,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: const Center(
                        child: Text(
                          '18 años o más',
                          style: TextStyle(fontSize: 18, color: Colors.black87),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Opción: 13 - 17 años
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAge = '13 - 17 años';
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: selectedAge == '13 - 17 años'
                              ? Colors.red
                              : Colors.grey,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: const Center(
                        child: Text(
                          '13 - 17 años',
                          style: TextStyle(fontSize: 18, color: Colors.black87),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Botón Continuar
                  CustomButton(
                    text: 'CONTINUAR',
                    onPressed: selectedAge != null
                        ? _onContinuePressed
                        : () {}, // Si no selecciona edad, no hace nada
                    color: selectedAge != null ? Colors.orange : Colors.grey,
                    textColor: Colors.white,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Función separada para manejar el botón de continuar
  void _onContinuePressed() async {
    bool isAdult = selectedAge == '18 años o más';

    // Llamar al servicio para actualizar el perfil
    await _userService.updateProfile(widget.alias, isAdult);

    // Navegar a la siguiente pantalla (chat)
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ChatScreen(),
      ),
    );
  }
}
