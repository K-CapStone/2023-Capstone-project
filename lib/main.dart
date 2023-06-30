import 'package:cap_stone_project/Theme/light_theme.dart';
import 'package:cap_stone_project/mainPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
<<<<<<< Updated upstream
<<<<<<< Updated upstream
import 'home.dart';
=======
=======
>>>>>>> Stashed changes
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'firebase_options.dart';
>>>>>>> Stashed changes

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  KakaoSdk.init(nativeAppKey: 'e220d9e63fb4fc5ab03a24544579ea34');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  KakaoSdk.init(nativeAppKey: 'e220d9e63fb4fc5ab03a24544579ea34');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
<<<<<<< Updated upstream
      debugShowCheckedModeBanner: false,
      theme: lightTheme,  
      home: const MainPage(),
=======
      theme: lightTheme,
      home: const AuthPage(),
>>>>>>> Stashed changes
    );
  }
}
