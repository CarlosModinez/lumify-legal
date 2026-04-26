import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/terms_screen.dart';
import 'screens/privacy_screen.dart';
import 'screens/not_found_screen.dart';

void main() => runApp(const LumifyLegalApp());

final _router = GoRouter(
  initialLocation: '/terms',
  errorBuilder: (context, state) => const NotFoundScreen(),
  routes: [
    GoRoute(path: '/terms', builder: (context, state) => const TermsScreen()),
    GoRoute(path: '/privacy', builder: (context, state) => const PrivacyScreen()),
  ],
);

class LumifyLegalApp extends StatelessWidget {
  const LumifyLegalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Lumify — Legal',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6B4EFF),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Georgia',
      ),
    );
  }
}
