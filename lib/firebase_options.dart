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
    apiKey: 'AIzaSyAFmeHBQ6zb-wmzldBelT_aD0VK9ShoMQM',
    appId: '1:125771631778:web:dc57441dcf2b3a7f549bfb',
    messagingSenderId: '125771631778',
    projectId: 'caasi-todo',
    authDomain: 'caasi-todo.firebaseapp.com',
    storageBucket: 'caasi-todo.appspot.com',
    measurementId: 'G-H4G6TRVHCC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQfj1aupWEktuRxoyuP4Pdg_6-mTijj8w',
    appId: '1:125771631778:android:c40654efa57181a6549bfb',
    messagingSenderId: '125771631778',
    projectId: 'caasi-todo',
    storageBucket: 'caasi-todo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDl5q_2raou4SJu1zy-sYqIvtrSkVzlDUo',
    appId: '1:125771631778:ios:e934b4258426b0bb549bfb',
    messagingSenderId: '125771631778',
    projectId: 'caasi-todo',
    storageBucket: 'caasi-todo.appspot.com',
    iosBundleId: 'com.example.caasiTodo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDl5q_2raou4SJu1zy-sYqIvtrSkVzlDUo',
    appId: '1:125771631778:ios:d29ed021619bd68e549bfb',
    messagingSenderId: '125771631778',
    projectId: 'caasi-todo',
    storageBucket: 'caasi-todo.appspot.com',
    iosBundleId: 'com.example.caasiTodo.RunnerTests',
  );
}