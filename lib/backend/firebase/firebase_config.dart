import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAVmO1JRU552L2OhuDi0sdRhwgleBPNO3c",
            authDomain: "allnimall.firebaseapp.com",
            projectId: "allnimall",
            storageBucket: "allnimall.appspot.com",
            messagingSenderId: "81093612277",
            appId: "1:81093612277:web:f8c7816169e792424febbc",
            measurementId: "G-16YBC1PDL5"));
  } else {
    await Firebase.initializeApp();
  }
}
