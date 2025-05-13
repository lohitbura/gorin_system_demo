import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gs_demo/core/firebase/firebase_options.dart';
import 'package:gs_demo/features/auth_management/pages/login_screen.dart';
import 'package:gs_demo/features/auth_management/pages/register_screen.dart';
import 'package:gs_demo/resources/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GS Demo',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(AppColor.colorCFD3E4),
            textStyle:WidgetStateProperty.all<TextStyle>( TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18
            )),
            padding:WidgetStatePropertyAll( EdgeInsets.symmetric(vertical: 12,horizontal: 30)),
            foregroundColor: WidgetStatePropertyAll(AppColor.color12267B),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0), // Set your desired border radius here
              ),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 12,
          ),
          border: InputBorder.none,
          hintStyle: TextStyle(
              color: AppColor.color12267B, fontSize: 16
          ),
          suffixIconColor: AppColor.color8C8C8C
        ),
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme(brightness: Brightness.light, primary: AppColor.colorCFD3E4, onPrimary: AppColor.color12267B, secondary: AppColor.colorCFD3E4, onSecondary: AppColor.color12267B, error: AppColor.colorFF0000, onError: AppColor.colorFFFFFF, surface: AppColor.colorCFD3E4, onSurface: AppColor.color12267B)
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,
          surface: AppColor.colorDEE1ED,
          onSurface: AppColor.color12267B,
        ),
      ),
      home:  RegisterScreen(),
    );
  }
}
