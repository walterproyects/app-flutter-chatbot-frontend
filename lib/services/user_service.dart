import '../api/api_config.dart';
import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserService {
  // Instancia de FlutterSecureStorage para acceder a los tokens almacenados
  final storage = const FlutterSecureStorage();

  // Método para actualizar el perfil del usuario
  Future<void> updateProfile(String alias, bool isAdult) async {
    // Si isAdult es false, no realizamos la petición
    if (!isAdult) {
      log('No se realizó la petición porque el usuario no es adulto.');
      return;
    }

    final url = Uri.parse('${ApiConfig.baseUrl}/user/updateProfile');

    try {
      // Obtener el token desde Secure Storage
      final authToken = await storage.read(key: 'authToken');

      if (authToken == null) {
        log('No se encontró el token de autenticación.');
        throw Exception('No se encontró el token de autenticación.');
      }

      // Realizamos la petición HTTP POST con el token en el encabezado
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken', // Agregar el token al encabezado
        },
        body: jsonEncode({
          'alias': alias,
          'is_adult': isAdult,
        }),
      );

      log(response.body);

      if (response.statusCode == 200) {
        log('Perfil actualizado correctamente');
      } else {
        log('Error al actualizar el perfil: ${response.statusCode}');
      }
    } catch (e) {
      log('Error de conexión al servidor: $e');
      throw Exception('Error de conexión al servidor');
    }
  }
}
