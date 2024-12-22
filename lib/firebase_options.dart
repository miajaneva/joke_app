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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAclSbUU1uAWSsCyFJg5Yab3MOCR7qMQT0',
    appId: '1:540635589600:web:a2649bf4c8d00e5319d985',
    messagingSenderId: '540635589600',
    projectId: 'randomjokesapp-10769',
    authDomain: 'randomjokesapp-10769.firebaseapp.com',
    storageBucket: 'randomjokesapp-10769.firebasestorage.app',
    measurementId: 'G-DKZ5CLTW2Z',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAWOdjUQ-PIXyTvwK70hwKVjeXpfnLiP6o',
    appId: '1:540635589600:ios:68ff1ee3e4fce13c19d985',
    messagingSenderId: '540635589600',
    projectId: 'randomjokesapp-10769',
    storageBucket: 'randomjokesapp-10769.firebasestorage.app',
    iosBundleId: 'com.example.randomJokesApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAclSbUU1uAWSsCyFJg5Yab3MOCR7qMQT0',
    appId: '1:540635589600:web:420667ad02a40ace19d985',
    messagingSenderId: '540635589600',
    projectId: 'randomjokesapp-10769',
    authDomain: 'randomjokesapp-10769.firebaseapp.com',
    storageBucket: 'randomjokesapp-10769.firebasestorage.app',
    measurementId: 'G-B0G1K2DDY3',
  );
}
