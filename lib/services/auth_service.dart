import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../api/api_config.dart';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  // Función para hacer login con correo y contraseña
  static Future<http.Response> loginTraditional(
      String email, String password) async {
    final url = Uri.parse('${ApiConfig.baseUrl}/auth/login/traditional');

    log('Intentando hacer login con:');
    log('Email: $email');
    log('Password: $password');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      log('Respuesta del servidor: ${response.statusCode}');
      log('Cuerpo de la respuesta: ${response.body}');

      return response;
    } catch (e) {
      log('Error en la solicitud de login: $e');
      throw Exception('Error de conexión al servidor');
    }
  }

  // Nueva función para hacer login con Google y Firebase
  static Future<User?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      log('Error during sign-in: $e', error: e);
      return null;
    }
  }

  // Función para enviar el token de Google a tu backend
  static Future<void> sendTokenToBackend(String idToken) async {
    final url = Uri.parse('${ApiConfig.baseUrl}/auth/login/google');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'token': idToken, // El token obtenido de Firebase
        }),
      );

      if (response.statusCode == 200) {
        // Extraer el token del cuerpo de la respuesta
        final responseData = json.decode(response.body);
        final token = responseData['token'];
        final emailUser = responseData['data']['email'];
        const storage = FlutterSecureStorage();

        // Guardar el token de manera segura en Secure Storage
        await storage.write(key: 'authToken', value: token);
        await storage.write(key: 'emailUser', value: emailUser);

        log('Token guardado correctamente en Secure Storage');
      }
    } catch (e) {
      log('Error al enviar el token al backend: $e');
      throw Exception('Error al conectar con el backend');
    }
  }
}
