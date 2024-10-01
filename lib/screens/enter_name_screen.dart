import 'package:flutter/material.dart';
import 'package:proyectotwalterfrontend/screens/important_notice_screen.dart';
import 'select_age_screen.dart'; // Importa la pantalla de selección de edad

class EnterNameScreen extends StatefulWidget {
  const EnterNameScreen({super.key});

  @override
  _EnterNameScreenState createState() => _EnterNameScreenState();
}

class _EnterNameScreenState extends State<EnterNameScreen> {
  final TextEditingController _nameController = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Aquí simplemente devolvemos `false` para que no realice la acción de retroceso
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ImportantNoticeScreen(),
          ),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Añadimos SingleChildScrollView para permitir el scroll si el contenido es grande
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 140),

                      // Imagen del panda con el globo
                      Image.asset(
                        'assets/images/pandalogo5.png', // Cambia la ruta de la imagen si es necesario
                        height: 150,
                      ),
                      const SizedBox(height: 20),

                      const Text(
                        '¡Mucho gusto!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),

                      const Text(
                        '¿Cómo te llamas?',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),

                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Escribe tu nombre o apodo favorito:',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          errorText: _errorMessage,
                        ),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  onPressed: () {
                    // Validar que el nombre tenga al menos 3 letras
                    if (_nameController.text.trim().length < 3) {
                      setState(() {
                        _errorMessage = 'El nombre debe tener al menos 3 caracteres';
                      });
                    } else {
                      setState(() {
                        _errorMessage = null;
                      });

                      // Navegar a la pantalla de selección de edad, pasando el alias
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectAgeScreen(
                            alias: _nameController.text.trim(), // Aquí pasamos el alias ingresado
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 15),
                  ),
                  child: const Text(
                    'CONTINUAR',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
