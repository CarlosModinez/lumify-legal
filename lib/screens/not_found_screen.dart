import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('404', style: TextStyle(fontSize: 64, fontWeight: FontWeight.w800, color: Color(0xFF6B4EFF))),
            const SizedBox(height: 8),
            const Text('Página não encontrada.'),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () => context.go('/terms'),
              child: const Text('Voltar ao início'),
            ),
          ],
        ),
      ),
    );
  }
}
