// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAhvE0QVpH978G4n644BXVqysQ0vIQjjrM',
    appId: '1:275157779949:web:4dc072dfa666e52b1513e4',
    messagingSenderId: '275157779949',
    projectId: 'watchflix-acaf4',
    authDomain: 'watchflix-acaf4.firebaseapp.com',
    storageBucket: 'watchflix-acaf4.appspot.com',
    measurementId: 'G-7NHF0E2DNQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA5_fKL_zwCPYr5Xe_2dfNK-JijVNk2sq0',
    appId: '1:275157779949:android:8c3436de1af1b9c01513e4',
    messagingSenderId: '275157779949',
    projectId: 'watchflix-acaf4',
    storageBucket: 'watchflix-acaf4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCkwd2HNNf0O-8SfWH27IF5S7cXzzUAwCo',
    appId: '1:275157779949:ios:69ee33b000a7802d1513e4',
    messagingSenderId: '275157779949',
    projectId: 'watchflix-acaf4',
    storageBucket: 'watchflix-acaf4.appspot.com',
    iosBundleId: 'com.example.watchflix',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCkwd2HNNf0O-8SfWH27IF5S7cXzzUAwCo',
    appId: '1:275157779949:ios:2894d393eed3929f1513e4',
    messagingSenderId: '275157779949',
    projectId: 'watchflix-acaf4',
    storageBucket: 'watchflix-acaf4.appspot.com',
    iosBundleId: 'com.example.watchflix.RunnerTests',
  );
}
