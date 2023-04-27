import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCecli0giGx_CRhnrErLWcGGNnT496HAcg",
            authDomain: "breakroom-7465c.firebaseapp.com",
            projectId: "breakroom-7465c",
            storageBucket: "breakroom-7465c.appspot.com",
            messagingSenderId: "207242520990",
            appId: "1:207242520990:web:bb6778042eadaf53f90e8f"));
  } else {
    await Firebase.initializeApp();
  }
}
