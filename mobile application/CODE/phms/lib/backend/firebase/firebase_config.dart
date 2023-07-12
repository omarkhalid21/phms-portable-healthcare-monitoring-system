import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAHifYaIrhpCtpKXEdGAqQqobbBHwOmQvQ",
            authDomain: "portable-monitoring-syst-caeb8.firebaseapp.com",
            projectId: "portable-monitoring-syst-caeb8",
            storageBucket: "portable-monitoring-syst-caeb8.appspot.com",
            messagingSenderId: "369437421038",
            appId: "1:369437421038:web:afd94b67e83cd747a8f2ff",
            measurementId: "G-8PW9Q5XTEM"));
  } else {
    await Firebase.initializeApp();
  }
}
