import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Shared scaffold for all legal pages.
class LegalScaffold extends StatelessWidget {
  const LegalScaffold({
    super.key,
    required this.title,
    required this.lastUpdated,
    required this.sections,
  });

  final String title;
  final String lastUpdated;
  final List<LegalSection> sections;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6B4EFF),
        foregroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Image.network(
              'https://lumify-app.com/logo.png',
              height: 28,
              errorBuilder: (context, error, stack) => const Icon(Icons.book, color: Colors.white, size: 28),
            ),
            const SizedBox(width: 10),
            const Text(
              'Lumify',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => context.go('/terms'),
            child: Text(
              'Termos de Uso',
              style: TextStyle(
                color: GoRouterState.of(context).uri.path == '/terms'
                    ? Colors.white
                    : Colors.white70,
                fontWeight: GoRouterState.of(context).uri.path == '/terms'
                    ? FontWeight.w700
                    : FontWeight.w400,
              ),
            ),
          ),
          TextButton(
            onPressed: () => context.go('/privacy'),
            child: Text(
              'Privacidade',
              style: TextStyle(
                color: GoRouterState.of(context).uri.path == '/privacy'
                    ? Colors.white
                    : Colors.white70,
                fontWeight: GoRouterState.of(context).uri.path == '/privacy'
                    ? FontWeight.w700
                    : FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 780),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF6B4EFF),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Última atualização: $lastUpdated',
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              ...sections.map((s) => _SectionWidget(section: s)),
              const SizedBox(height: 48),
              const Divider(),
              const SizedBox(height: 16),
              Text(
                '© ${DateTime.now().year} Lumify — Todos os direitos reservados.',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class LegalSection {
  const LegalSection(this.heading, this.body);
  final String heading;
  final String body;
}

class _SectionWidget extends StatelessWidget {
  const _SectionWidget({required this.section});
  final LegalSection section;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.heading,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A2E),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            section.body,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF444466),
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}
