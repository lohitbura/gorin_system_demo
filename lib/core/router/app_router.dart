import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gs_demo/features/auth_management/pages/login_screen.dart';
import 'package:gs_demo/features/auth_management/pages/register_screen.dart';
import 'package:gs_demo/features/home/pages/home_screen.dart';


final router = GoRouter(
  navigatorKey: navigatorKey,
  refreshListenable: GoRouterRefreshStream(FirebaseAuth.instance.authStateChanges()),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        final user = FirebaseAuth.instance.currentUser;
        return user != null ? HomeScreen() : LoginScreen();
      },
    ),
    GoRoute(path: '/login', builder: (_, __) => LoginScreen()),
    GoRoute(path: '/register', builder: (_, __) => RegisterScreen()),
    GoRoute(path: '/home', builder: (_, __) => HomeScreen()),
  ],
  redirect: (context, state) {
    final user = FirebaseAuth.instance.currentUser;
    final loggingIn = state.matchedLocation == '/login' || state.matchedLocation == '/register';

    if (user == null && !loggingIn) return '/login';
    if (user != null && loggingIn) return '/home';
    return null;
  },
);


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.asBroadcastStream().listen((_) {
      notifyListeners();
    });
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}