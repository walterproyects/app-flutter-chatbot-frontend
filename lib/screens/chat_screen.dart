import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importa la librería intl para formatear la hora

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // Lista para almacenar los mensajes
  List<Map<String, String>> messages = [];

  // Controlador para el campo de texto del mensaje
  TextEditingController messageController = TextEditingController();

  // Función para agregar un mensaje a la lista
  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      // Obtener la hora actual en formato de hora del sistema
      String formattedTime = DateFormat('h:mm a').format(DateTime.now()); // Usa intl para formatear la hora local

      setState(() {
        messages.add({
          'message': messageController.text,
          'time': formattedTime // Añadir la hora formateada correctamente
        });
        messageController.clear(); // Limpiar el campo de texto después de enviar
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Aquí simplemente devolvemos `false` para que no realice la acción de retroceso
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true, // Para que el último mensaje aparezca al final
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Align(
                      alignment: Alignment.centerRight, // Mensajes alineados a la derecha
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.lightBlue[100],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              messages[index]['message'] ?? '',
                              style: const TextStyle(fontSize: 16, color: Colors.black87),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            messages[index]['time'] ?? '',
                            style: const TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Barra de texto para escribir el mensaje con SafeArea para evitar que esté pegado al borde inferior
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        decoration: InputDecoration(
                          hintText: 'Escribe tu mensaje...',
                          filled: true,
                          fillColor: Colors.grey.shade200, // Cambiado para evitar null
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Botón de enviar mensaje
                    GestureDetector(
                      onTap: sendMessage,
                      child: const CircleAvatar(
                        backgroundColor: Colors.lightBlue,
                        child: Icon(Icons.send, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
