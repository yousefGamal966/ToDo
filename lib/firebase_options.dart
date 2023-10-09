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
    apiKey: 'AIzaSyDLoN-g8pBu5yPzTk24VNd0sPT4VeI49_0',
    appId: '1:774190510567:web:07d543624ece33562acd42',
    messagingSenderId: '774190510567',
    projectId: 'todo-11c77',
    authDomain: 'todo-11c77.firebaseapp.com',
    storageBucket: 'todo-11c77.appspot.com',
    measurementId: 'G-NDH84F76X7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVVerb6Wz4qg6MT6pZ3F-iqwS9UBUGIZI',
    appId: '1:774190510567:android:b4705e1ec0b2c05d2acd42',
    messagingSenderId: '774190510567',
    projectId: 'todo-11c77',
    storageBucket: 'todo-11c77.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZTXl5r1PH36_A5Kk41r9trBKQhNV72NM',
    appId: '1:774190510567:ios:28adba42b550a0452acd42',
    messagingSenderId: '774190510567',
    projectId: 'todo-11c77',
    storageBucket: 'todo-11c77.appspot.com',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAZTXl5r1PH36_A5Kk41r9trBKQhNV72NM',
    appId: '1:774190510567:ios:28adba42b550a0452acd42',
    messagingSenderId: '774190510567',
    projectId: 'todo-11c77',
    storageBucket: 'todo-11c77.appspot.com',
    iosBundleId: 'com.example.todo',
  );
}