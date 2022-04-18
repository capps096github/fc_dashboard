// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB11_lhOgwCl76j6rMZ43ogv4nzdT0IT8k',
    appId: '1:586749295447:web:5a55b6bc5094cf8529dc12',
    messagingSenderId: '586749295447',
    projectId: 'fluttercommdashboard',
    authDomain: 'fluttercommdashboard.firebaseapp.com',
    storageBucket: 'fluttercommdashboard.appspot.com',
    measurementId: 'G-BEEXGT4FNJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyARNx84z058Bk962dvRx1qzixfb1hWLG48',
    appId: '1:586749295447:android:8c1e557ffefd0fa129dc12',
    messagingSenderId: '586749295447',
    projectId: 'fluttercommdashboard',
    storageBucket: 'fluttercommdashboard.appspot.com',
  );
}
