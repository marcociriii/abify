import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCWNxi8fD1oARNiMugUVS1ypZNXQRAZMOc",
            authDomain: "abify-habit.firebaseapp.com",
            projectId: "abify-habit",
            storageBucket: "abify-habit.appspot.com",
            messagingSenderId: "68059988155",
            appId: "1:68059988155:web:00bbc50f790b0ce17c699e",
            measurementId: "G-P0K4RGCFB7"));
  } else {
    await Firebase.initializeApp();
  }
}
