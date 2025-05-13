
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'App Not supporting this platform',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'App Not supporting this platform',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'App Not supporting this platform',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'App Not supporting this platform',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'App Not supporting this platform',
        );
      default:
        throw UnsupportedError(
          'App Not supporting this platform',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBN5_zZuvqfg-9UFhrE8E4rrTDk2O2mTwk',
    appId: '1:1099488156156:android:dd1aef9c8743bd7f20ba79',
    messagingSenderId: '1099488156156',
    projectId: 'gs-demo-bf3e0',
    storageBucket: 'gs-demo-bf3e0.appspot.com',
  );
}
