// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBFoCwcn-aC1wi1DEU_MKiuyOHbYzaW4Pw',
    appId: '1:1083145845658:web:13504762c6f73c49be5823',
    messagingSenderId: '1083145845658',
    projectId: 'proyecto-flutter-app-prod',
    authDomain: 'proyecto-flutter-app-prod.firebaseapp.com',
    storageBucket: 'proyecto-flutter-app-prod.appspot.com',
    measurementId: 'G-MWN73WKXKM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCDVt7l4Cw6nWrYvQO6I7aFsVdEU1a4fKs',
    appId: '1:1083145845658:android:cb51073cb2e2ccb9be5823',
    messagingSenderId: '1083145845658',
    projectId: 'proyecto-flutter-app-prod',
    storageBucket: 'proyecto-flutter-app-prod.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDYgangdgDle58QAWQSHsZm7qSrbLRZffo',
    appId: '1:1083145845658:ios:f48a8780b7a600fabe5823',
    messagingSenderId: '1083145845658',
    projectId: 'proyecto-flutter-app-prod',
    storageBucket: 'proyecto-flutter-app-prod.appspot.com',
    iosBundleId: 'com.example.proyectotwalterfrontend',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDYgangdgDle58QAWQSHsZm7qSrbLRZffo',
    appId: '1:1083145845658:ios:f48a8780b7a600fabe5823',
    messagingSenderId: '1083145845658',
    projectId: 'proyecto-flutter-app-prod',
    storageBucket: 'proyecto-flutter-app-prod.appspot.com',
    iosBundleId: 'com.example.proyectotwalterfrontend',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBFoCwcn-aC1wi1DEU_MKiuyOHbYzaW4Pw',
    appId: '1:1083145845658:web:135269d78f993103be5823',
    messagingSenderId: '1083145845658',
    projectId: 'proyecto-flutter-app-prod',
    authDomain: 'proyecto-flutter-app-prod.firebaseapp.com',
    storageBucket: 'proyecto-flutter-app-prod.appspot.com',
    measurementId: 'G-R429CF2PH1',
  );
}
