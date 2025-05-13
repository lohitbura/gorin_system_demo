import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gs_demo/core/firebase/firebase_options.dart';
import 'package:gs_demo/features/auth_management/pages/login_screen.dart';
import 'package:gs_demo/features/auth_management/pages/register_screen.dart';
import 'package:gs_demo/resources/colors.dart';
import 'package:provider/provider.dart';

import 'core/router/app_router.dart';
import 'features/auth_management/provider/auth_providers.dart';

void main() async{
  await runZonedGuarded(() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // if (Firebase.apps.isNotEmpty) {
  //   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // }else{
  //   Firebase.initializeApp();
  // }
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());}, logError);
}

void logError(error, stack) async {
  print('Error Log');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp.router(
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
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
