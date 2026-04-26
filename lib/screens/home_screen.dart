// ─── Lumify Landing Page ──────────────────────────────────────────────────
// Brand colours mirror the app's AppColorThemes.sanctuary palette.
// ──────────────────────────────────────────────────────────────────────────

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

// ── Palette ────────────────────────────────────────────────────────────────
const _indigo = Color(0xFF4F46E5);
const _violet = Color(0xFF7C3AED);
const _gold = Color(0xFFF59E0B);
const _bg = Color(0xFFF8FAFC);
const _ink = Color(0xFF0F172A);
const _slate = Color(0xFF64748B);
const _border = Color(0xFFE2E8F0);
const _surface = Color(0xFFFFFFFF);
const _indigoLight = Color(0xFFEEF2FF);

const _appStoreUrl = 'https://apps.apple.com/app/lumify/id0000000000'; // placeholder
const _playStoreUrl = 'https://play.google.com/store/apps/details?id=com.example.educabr.dailylight'; // placeholder

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            _Navbar(),
            _HeroSection(),
            _FeaturesSection(),
            _TestimonialsSection(),
            _PlansSection(),
            _CtaSection(),
            _Footer(),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// NAV BAR
// ─────────────────────────────────────────────────────────────────────────────

class _Navbar extends StatelessWidget {
  const _Navbar();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 700;
    return Container(
      color: _surface,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Row(
        children: [
          // Logo
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [_indigo, _violet]),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.auto_stories_rounded, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 10),
          const Text(
            'Lumify',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: _ink),
          ),
          const Spacer(),
          if (!isMobile) ...[
            _NavLink('Recursos', () {}),
            const SizedBox(width: 24),
            _NavLink('Depoimentos', () {}),
            const SizedBox(width: 24),
            _NavLink('Planos', () {}),
            const SizedBox(width: 32),
          ],
          _PrimaryButton('Baixar grátis', () => _openUrl(_appStoreUrl), small: true),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink(this.label, this.onTap);
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(label, style: const TextStyle(fontSize: 15, color: _slate, fontWeight: FontWeight.w500)),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// HERO
// ─────────────────────────────────────────────────────────────────────────────

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final isMobile = w < 860;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1E1B4B), Color(0xFF4C1D95), Color(0xFF1E1B4B)],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: isMobile ? 60 : 96),
      child: isMobile
          ? Column(crossAxisAlignment: CrossAxisAlignment.center, children: _heroContent(isMobile: true))
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: _heroContent(isMobile: false))),
                const SizedBox(width: 64),
                const _PhoneMockup(),
              ],
            ),
    );
  }

  List<Widget> _heroContent({required bool isMobile}) => [
        // Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(20),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.white.withAlpha(40)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star_rounded, color: _gold, size: 16),
              const SizedBox(width: 6),
              Text(
                '4,9 · Mais de 10 mil avaliações',
                style: TextStyle(color: Colors.white.withAlpha(220), fontSize: 13, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),
        Text(
          'Aproxime-se de Deus\ntodos os dias.',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            height: 1.15,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Guia diário, planos de leitura bíblica, estudos e meditações — tudo em um só lugar para fortalecer sua fé.',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(fontSize: 18, color: Colors.white.withAlpha(180), height: 1.6),
        ),
        const SizedBox(height: 40),
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 16,
          runSpacing: 12,
          children: const [
            _StoreButton(store: _Store.apple),
            _StoreButton(store: _Store.google),
          ],
        ),
        if (isMobile) const SizedBox(height: 48),
        if (isMobile) const _PhoneMockup(),
      ];
}

// ─────────────────────────────────────────────────────────────────────────────
// PHONE MOCKUP
// ─────────────────────────────────────────────────────────────────────────────

class _PhoneMockup extends StatelessWidget {
  const _PhoneMockup();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 520,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1B4B),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.white.withAlpha(30), width: 2),
        boxShadow: [
          BoxShadow(color: _violet.withAlpha(80), blurRadius: 60, spreadRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(38),
        child: Column(
          children: [
            // Status bar placeholder
            Container(height: 32, color: const Color(0xFF1E1B4B)),
            // App UI preview
            Expanded(
              child: Container(
                color: const Color(0xFF12103A),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Daily guide card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [_indigo, _violet]),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            const Icon(Icons.wb_sunny_rounded, color: Colors.white70, size: 14),
                            const SizedBox(width: 6),
                            Text('Guia de Hoje', style: TextStyle(color: Colors.white.withAlpha(180), fontSize: 11)),
                          ]),
                          const SizedBox(height: 8),
                          const Text('"Porque Deus amou o mundo de tal maneira…"', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600, height: 1.4)),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                            child: const Text('Iniciar', style: TextStyle(color: _indigo, fontWeight: FontWeight.w700, fontSize: 12)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    // Mini plan cards
                    Row(children: [
                      Expanded(child: _MiniCard('Salmos 30 dias', Icons.book_outlined)),
                      const SizedBox(width: 10),
                      Expanded(child: _MiniCard('Novo Testamento', Icons.auto_stories_outlined)),
                    ]),
                    const SizedBox(height: 14),
                    _MiniCard('Meditação matinal · 5 min', Icons.headphones_rounded, wide: true),
                  ],
                ),
              ),
            ),
            // Bottom bar
            Container(height: 40, color: const Color(0xFF1E1B4B)),
          ],
        ),
      ),
    );
  }
}

class _MiniCard extends StatelessWidget {
  const _MiniCard(this.label, this.icon, {this.wide = false});
  final String label;
  final IconData icon;
  final bool wide;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(10),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withAlpha(15)),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(label, style: const TextStyle(color: Colors.white70, fontSize: 11), maxLines: 2, overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// FEATURES
// ─────────────────────────────────────────────────────────────────────────────

class _FeaturesSection extends StatelessWidget {
  const _FeaturesSection();

  static const _features = [
    (Icons.wb_sunny_rounded, 'Guia Diário', 'Versículo, reflexão e oração — tudo em 10 minutos para começar o dia com fé.', Color(0xFF4F46E5)),
    (Icons.book_rounded, 'Planos de Leitura', 'Planos estruturados para ler a Bíblia inteira ou explorar temas específicos no seu ritmo.', Color(0xFF059669)),
    (Icons.school_rounded, 'Estudos Bíblicos', 'Conteúdo aprofundado para crescer no conhecimento da Palavra de Deus.', Color(0xFFD97706)),
    (Icons.headphones_rounded, 'Áudio e Meditação', 'Músicas de adoração, histórias bíblicas e meditações guiadas para renovar sua mente.', Color(0xFF7C3AED)),
    (Icons.camera_alt_rounded, 'Scanner Bíblico', 'Aponte a câmera para qualquer versículo e receba reflexão instantânea com IA.', Color(0xFFE11D48)),
    (Icons.trending_up_rounded, 'Acompanhe seu Progresso', 'Sequências diárias e marcos para manter sua consistência e celebrar seu crescimento.', Color(0xFF0891B2)),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 700;
    return Container(
      color: _bg,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 80),
      child: Column(
        children: [
          _SectionLabel('RECURSOS'),
          const SizedBox(height: 12),
          const Text(
            'Tudo que você precisa para crescer na fé',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800, color: _ink, height: 1.2),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          const Text(
            'Uma experiência completa para sua jornada espiritual.',
            style: TextStyle(fontSize: 18, color: _slate, height: 1.6),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 56),
          _ResponsiveGrid(
            minChildWidth: 280,
            spacing: 20,
            children: _features.map((f) => _FeatureCard(icon: f.$1, title: f.$2, desc: f.$3, color: f.$4)).toList(),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({required this.icon, required this.title, required this.desc, required this.color});
  final IconData icon;
  final String title;
  final String desc;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: _surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _border),
        boxShadow: [BoxShadow(color: Colors.black.withAlpha(6), blurRadius: 20, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: color.withAlpha(20), borderRadius: BorderRadius.circular(14)),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: _ink)),
          const SizedBox(height: 8),
          Text(desc, style: const TextStyle(fontSize: 14, color: _slate, height: 1.6)),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// TESTIMONIALS
// ─────────────────────────────────────────────────────────────────────────────

class _TestimonialsSection extends StatelessWidget {
  const _TestimonialsSection();

  static const _testimonials = [
    ('Maria S.', 'O guia diário mudou minha rotina matinal. Versículo, reflexão e oração em 10 minutos todo dia. Não consigo mais imaginar minha manhã sem ele.', '★★★★★'),
    ('João P.', 'Os planos de leitura bíblica são incríveis! Em 3 meses li o Novo Testamento completo. A consistência que sempre quis e nunca consegui.', '★★★★★'),
    ('Ana C.', 'As meditações guiadas me ajudaram a reduzir a ansiedade e encontrar paz em Deus. Uso todos os dias antes de dormir. Recomendo muito!', '★★★★★'),
    ('Pedro R.', 'O scanner de versículos é genial. Fotografei um trecho da minha bíblia física e recebi uma reflexão linda na hora. Tecnologia a serviço da fé!', '★★★★★'),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 700;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [_indigoLight, const Color(0xFFF5F3FF)],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 80),
      child: Column(
        children: [
          _SectionLabel('DEPOIMENTOS'),
          const SizedBox(height: 12),
          const Text(
            'O que nossos usuários dizem',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800, color: _ink, height: 1.2),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 56),
          _ResponsiveGrid(
            minChildWidth: 280,
            spacing: 20,
            children: _testimonials.map((t) => _TestimonialCard(name: t.$1, text: t.$2, stars: t.$3)).toList(),
          ),
        ],
      ),
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  const _TestimonialCard({required this.name, required this.text, required this.stars});
  final String name;
  final String text;
  final String stars;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: _surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _border),
        boxShadow: [BoxShadow(color: Colors.black.withAlpha(6), blurRadius: 20, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(stars, style: const TextStyle(fontSize: 16, color: _gold, letterSpacing: 2)),
          const SizedBox(height: 12),
          Text('"$text"', style: const TextStyle(fontSize: 15, color: _ink, height: 1.65, fontStyle: FontStyle.italic)),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [_indigo, _violet]),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(name[0], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                ),
              ),
              const SizedBox(width: 10),
              Text(name, style: const TextStyle(fontWeight: FontWeight.w600, color: _ink)),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// PLANS
// ─────────────────────────────────────────────────────────────────────────────

class _PlansSection extends StatelessWidget {
  const _PlansSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 700;
    return Container(
      color: _bg,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 80),
      child: Column(
        children: [
          _SectionLabel('PLANOS'),
          const SizedBox(height: 12),
          const Text(
            'Comece grátis. Cresça com Premium.',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800, color: _ink, height: 1.2),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          const Text(
            '7 dias grátis. Sem compromisso.',
            style: TextStyle(fontSize: 18, color: _slate),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: isMobile
                ? Column(children: [
                    const _PlanCard(title: 'Gratuito', price: 'R\$ 0', period: '', highlight: false),
                    const SizedBox(height: 16),
                    const _PlanCard(title: 'Premium', price: 'R\$ 19,90', period: '/mês', highlight: true),
                  ])
                : const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _PlanCard(title: 'Gratuito', price: 'R\$ 0', period: '', highlight: false)),
                      SizedBox(width: 20),
                      Expanded(child: _PlanCard(title: 'Premium', price: 'R\$ 19,90', period: '/mês', highlight: true)),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  const _PlanCard({required this.title, required this.price, required this.period, required this.highlight});
  final String title;
  final String price;
  final String period;
  final bool highlight;

  static const _freeFeatures = ['Guia diário', 'Versículo do dia', 'Planos de leitura básicos', 'Histórias bíblicas'];
  static const _premiumFeatures = ['Tudo do Gratuito', 'Estudos bíblicos completos', 'Planos de leitura ilimitados', 'Áudios e meditações', 'Scanner de versículos com IA', 'Sem anúncios', 'Acesso offline'];

  @override
  Widget build(BuildContext context) {
    final features = highlight ? _premiumFeatures : _freeFeatures;
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: highlight ? const Color(0xFF1E1B4B) : _surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: highlight ? _violet : _border, width: highlight ? 2 : 1),
        boxShadow: highlight
            ? [BoxShadow(color: _indigo.withAlpha(40), blurRadius: 40, spreadRadius: 0, offset: const Offset(0, 8))]
            : [BoxShadow(color: Colors.black.withAlpha(6), blurRadius: 20, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (highlight)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [_gold, Color(0xFFEA580C)]),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Text('7 DIAS GRÁTIS', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
            ),
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: highlight ? Colors.white : _ink)),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price, style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900, color: highlight ? Colors.white : _ink)),
              if (period.isNotEmpty) ...[
                const SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(period, style: TextStyle(fontSize: 16, color: highlight ? Colors.white70 : _slate)),
                ),
              ],
            ],
          ),
          const SizedBox(height: 24),
          ...features.map((f) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Icon(Icons.check_circle_rounded, size: 18, color: highlight ? const Color(0xFF34D399) : _indigo),
                    const SizedBox(width: 10),
                    Text(f, style: TextStyle(fontSize: 14, color: highlight ? Colors.white.withAlpha(220) : _ink)),
                  ],
                ),
              )),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            child: highlight
                ? _PrimaryButton('Começar grátis', () => _openUrl(_appStoreUrl))
                : OutlinedButton(
                    onPressed: () => _openUrl(_appStoreUrl),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: _indigo,
                      side: const BorderSide(color: _indigo),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Baixar grátis', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                  ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// CTA
// ─────────────────────────────────────────────────────────────────────────────

class _CtaSection extends StatelessWidget {
  const _CtaSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 700;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1E1B4B), _violet],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 32 : 80, vertical: 80),
      child: Column(
        children: [
          const Text(
            'Comece sua jornada hoje.',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900, color: Colors.white, height: 1.2),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Junte-se a milhares de cristãos que crescem na fé todos os dias com o Lumify.',
            style: TextStyle(fontSize: 18, color: Colors.white.withAlpha(180), height: 1.6),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 12,
            children: const [
              _StoreButton(store: _Store.apple),
              _StoreButton(store: _Store.google),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// FOOTER
// ─────────────────────────────────────────────────────────────────────────────

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0F172A),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [_indigo, _violet]),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.auto_stories_rounded, color: Colors.white, size: 18),
              ),
              const SizedBox(width: 8),
              const Text('Lumify', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white)),
            ],
          ),
          const SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 24,
            runSpacing: 12,
            children: [
              _FooterLink('Termos de Uso', '/terms'),
              _FooterLink('Privacidade', '/privacy'),
              _FooterLink('Suporte', 'mailto:suporte@lumify-app.com'),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            '© ${DateTime.now().year} Lumify. Todos os direitos reservados.',
            style: TextStyle(color: Colors.white.withAlpha(100), fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  const _FooterLink(this.label, this.target);
  final String label;
  final String target;

  @override
  Widget build(BuildContext context) {
    final isInternal = target.startsWith('/');
    return GestureDetector(
      onTap: isInternal ? () => context.go(target) : () => _openUrl(target),
      child: Text(label, style: TextStyle(color: Colors.white.withAlpha(160), fontSize: 14)),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SHARED HELPERS
// ─────────────────────────────────────────────────────────────────────────────

enum _Store { apple, google }

class _StoreButton extends StatelessWidget {
  const _StoreButton({required this.store});
  final _Store store;

  @override
  Widget build(BuildContext context) {
    final isApple = store == _Store.apple;
    return GestureDetector(
      onTap: () => _openUrl(isApple ? _appStoreUrl : _playStoreUrl),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black.withAlpha(25), blurRadius: 12, offset: const Offset(0, 4))],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(isApple ? Icons.apple : Icons.android, size: 26, color: _ink),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(isApple ? 'Download na' : 'Disponível no', style: const TextStyle(fontSize: 10, color: _slate)),
                Text(isApple ? 'App Store' : 'Google Play', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: _ink)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton(this.label, this.onTap, {this.small = false});
  final String label;
  final VoidCallback onTap;
  final bool small;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: small ? 20 : 28, vertical: small ? 10 : 16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [_indigo, _violet]),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: _indigo.withAlpha(60), blurRadius: 20, offset: const Offset(0, 4))],
        ),
        child: Text(label, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: small ? 14 : 16)),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: _indigoLight,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(text, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: _indigo, letterSpacing: 1.2)),
    );
  }
}

/// Responsive grid that wraps children based on available width.
class _ResponsiveGrid extends StatelessWidget {
  const _ResponsiveGrid({required this.children, required this.minChildWidth, this.spacing = 16});
  final List<Widget> children;
  final double minChildWidth;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final cols = (constraints.maxWidth / (minChildWidth + spacing)).floor().clamp(1, children.length);
      final rows = <Widget>[];
      for (var i = 0; i < children.length; i += cols) {
        final rowChildren = children.sublist(i, (i + cols).clamp(0, children.length));
        // Pad with invisible spacers if last row is incomplete
        while (rowChildren.length < cols) {
          rowChildren.add(const SizedBox.shrink());
        }
        if (rows.isNotEmpty) rows.add(SizedBox(height: spacing));
        rows.add(IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: rowChildren
                .expand((w) => [Expanded(child: w), SizedBox(width: spacing)])
                .toList()
              ..removeLast(),
          ),
        ));
      }
      return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: rows);
    });
  }
}

void _openUrl(String url) => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
