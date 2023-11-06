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
    apiKey: 'AIzaSyBBz88eWdMNIPDYEI6ndVjTfMYGYlTIyOY',
    appId: '1:567806911759:web:2d6458a4366cd3cc0b4a7a',
    messagingSenderId: '567806911759',
    projectId: 'flutter-firebase-loginui',
    authDomain: 'flutter-firebase-loginui.firebaseapp.com',
    storageBucket: 'flutter-firebase-loginui.appspot.com',
    measurementId: 'G-M2W0C8ECRS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAiM8NBgR3IdtAORbA6lLP4A_dM03c5Y7M',
    appId: '1:567806911759:android:57529d9ae84961a20b4a7a',
    messagingSenderId: '567806911759',
    projectId: 'flutter-firebase-loginui',
    storageBucket: 'flutter-firebase-loginui.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBRm4QpuvOahZKiFiiEx0C5ntP8MFLn6cY',
    appId: '1:567806911759:ios:89c336c36019868f0b4a7a',
    messagingSenderId: '567806911759',
    projectId: 'flutter-firebase-loginui',
    storageBucket: 'flutter-firebase-loginui.appspot.com',
    iosBundleId: 'com.example.firebaseTest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBRm4QpuvOahZKiFiiEx0C5ntP8MFLn6cY',
    appId: '1:567806911759:ios:60aef9ae902b12070b4a7a',
    messagingSenderId: '567806911759',
    projectId: 'flutter-firebase-loginui',
    storageBucket: 'flutter-firebase-loginui.appspot.com',
    iosBundleId: 'com.example.firebaseTest.RunnerTests',
  );
}
