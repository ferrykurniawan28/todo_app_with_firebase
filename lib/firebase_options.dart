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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBOzNl7rGFkD0XJpiY_Q1cBNafbL46vwjM',
    appId: '1:624219085200:web:52cc88c14f0c680672bb15',
    messagingSenderId: '624219085200',
    projectId: 'todo-list-3cbc6',
    authDomain: 'todo-list-3cbc6.firebaseapp.com',
    storageBucket: 'todo-list-3cbc6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSo0ic9f9-Csujt55IjVA1gJ-4sswTlno',
    appId: '1:624219085200:android:77364339aceebdde72bb15',
    messagingSenderId: '624219085200',
    projectId: 'todo-list-3cbc6',
    storageBucket: 'todo-list-3cbc6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBWyDSA2KIRv8k_RzPmP7KUwyOaTC5JPuw',
    appId: '1:624219085200:ios:0f564596bde356e072bb15',
    messagingSenderId: '624219085200',
    projectId: 'todo-list-3cbc6',
    storageBucket: 'todo-list-3cbc6.appspot.com',
    iosBundleId: 'com.example.todo',
  );
}
