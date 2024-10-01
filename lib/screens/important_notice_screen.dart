import 'package:flutter/material.dart';
import 'enter_name_screen.dart'; // Importa la pantalla con nombre actualizado
import '../widgets/notice_item.dart'; // Importa tu nuevo widget reutilizable
import '../widgets/custom_button.dart'; // Importa el botón reutilizable

class ImportantNoticeScreen extends StatelessWidget {
  const ImportantNoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Interceptar el botón "Atrás" para que no vuelva a la pantalla de inicio de sesión
    return WillPopScope(
      onWillPop: () async {
        // Aquí simplemente devolvemos `false` para que no realice la acción de retroceso
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 140),

              Image.asset(
                'assets/images/pandalogo3.png',
                height: 150,
              ),
              const SizedBox(height: 20),

              const Text(
                'Aviso importante',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),

              const Text(
                'Por favor, toma en cuenta lo siguiente:',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),

              // Utilizar el widget reutilizable
              const NoticeItem(
                  text:
                      'No estoy capacitado para atender situaciones en crisis'),
              const NoticeItem(text: 'No puedo reemplazar la terapia profesional'),
              const NoticeItem(text: 'No puedo determinar un diagnóstico'),

              const Spacer(),

              // Aquí usas tu componente CustomButton
              CustomButton(
                text: 'CONTINUAR',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EnterNameScreen()),
                  );
                },
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
