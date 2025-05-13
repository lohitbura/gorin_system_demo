import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gs_demo/core/theme.dart';
import 'package:provider/provider.dart';
import 'core/router/app_router.dart';
import 'features/auth_management/provider/auth_providers.dart';
import 'features/home/provider/home_provider.dart';

void main() async{
  await runZonedGuarded(() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
        ChangeNotifierProvider(create: (_) => UsersProvider()),
      ],
      child: MaterialApp.router(
        debugShowMaterialGrid: false,
        title: 'GS Demo',
        theme: theme,
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
