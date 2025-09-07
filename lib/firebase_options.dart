// lib/firebase_options.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError(
            'DefaultFirebaseOptions are not supported for this platform.');
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCuLdS2NQQaTs4eIsDeC8gbppsIFFyu35o',
    appId: '1:711064791836:web:8e1c14e2a5fb5e7875a8d9',
    messagingSenderId: '711064791836',
    projectId: 'perfume-f2172',
    authDomain: 'perfume-f2172.firebaseapp.com',
    storageBucket: 'perfume-f2172.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCuLdS2NQQaTs4eIsDeC8gbppsIFFyu35o',
    appId: '1:711064791836:android:8e1c14e2a5fb5e7875a8d9',
    messagingSenderId: '711064791836',
    projectId: 'perfume-f2172',
    storageBucket: 'perfume-f2172.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCuLdS2NQQaTs4eIsDeC8gbppsIFFyu35o',
    appId: '1:711064791836:ios:8e1c14e2a5fb5e7875a8d9',
    messagingSenderId: '711064791836',
    projectId: 'perfume-f2172',
    storageBucket: 'perfume-f2172.appspot.com',
    iosBundleId: 'com.example.perfumeapp',
  );
}