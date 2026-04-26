import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

// ─── Sanctuary Palette ──────────────────────────────────────────────────────
const _bg       = Color(0xFF131110);
const _surface  = Color(0xFF1C1917);
const _elevated = Color(0xFF231F1B);
const _card     = Color(0xFF1E1A16);
const _border   = Color(0xFF2E2720);
const _divider  = Color(0xFF292420);

const _textPrimary   = Color(0xFFF5F0EB);
const _textSecondary = Color(0xFFA89E94);
const _textTertiary  = Color(0xFF78716C);

const _gold      = Color(0xFFD4A574);
const _goldLight = Color(0xFFE8C97A);

const _appStoreUrl  = 'https://apps.apple.com/app/lumify/id0000000000';
const _playStoreUrl = 'https://play.google.com/store/apps/details?id=com.example.educabr.dailylight';

// ─── Typography helpers ──────────────────────────────────────────────────────
TextStyle _display(double size, {FontWeight weight = FontWeight.w900, Color color = _textPrimary}) =>
    GoogleFonts.lora(fontSize: size, fontWeight: weight, color: color, height: 1.12, letterSpacing: -0.5);

TextStyle _sans(double size, {FontWeight weight = FontWeight.w400, Color color = _textSecondary}) =>
    GoogleFonts.inter(fontSize: size, fontWeight: weight, color: color, height: 1.6);

// ─── HomeScreen ──────────────────────────────────────────────────────────────
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
            _StatsBar(),
            _FeatureSpotlight(
              tag: 'GUIA DIÁRIO',
              headline: 'Aproxime-se de Deus.\nTodos os dias.',
              body: 'Receba cada dia uma passagem bíblica, reflexão guiada e oração — tudo em 10 minutos. Construa o hábito que transforma a sua vida.',
              imagePath: 'assets/images/frame1.jpg',
              imageOnRight: true,
              bg: _surface,
            ),
            _FeatureSpotlight(
              tag: 'SCANNER COM IA',
              headline: 'Escaneie qualquer\nversículo e receba\numa reflexão única.',
              body: 'Aponte a câmera para qualquer trecho da sua Bíblia física. Nossa IA gera contexto histórico, reflexão profunda e uma oração personalizada na hora.',
              imagePath: 'assets/images/frame4.jpg',
              imageOnRight: false,
              bg: _bg,
            ),
            _FeatureSpotlight(
              tag: 'ESTUDOS BÍBLICOS',
              headline: 'Cursos completos\npara aprofundar\nsua Fé.',
              body: 'Mais de 50 estudos estruturados sobre temas como graça, perdão, propósito e identidade — com áudio, reflexões e exercícios práticos.',
              imagePath: 'assets/images/frame3.jpg',
              imageOnRight: true,
              bg: _surface,
            ),
            _FeatureSpotlight(
              tag: 'ÁUDIO & MEDITAÇÕES',
              headline: 'Conteúdo exclusivo\ne personalizado\ntoda semana.',
              body: 'Meditações guiadas, histórias bíblicas narradas e músicas de adoração. Conteúdo novo toda semana para renovar sua mente e fortalecer seu espírito.',
              imagePath: 'assets/images/frame5.jpg',
              imageOnRight: false,
              bg: _bg,
            ),
            _FeatureSpotlight(
              tag: 'BÍBLIA INTEGRADA',
              headline: 'O melhor leitor\nda Bíblia.',
              body: 'Navegue por todos os livros, capítulos e versículos com a interface mais bonita e intuitiva. Com destaque de versículos e planos de leitura integrados.',
              imagePath: 'assets/images/frame6.jpg',
              imageOnRight: true,
              bg: _surface,
            ),
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

// ─── NAVBAR ──────────────────────────────────────────────────────────────────
class _Navbar extends StatelessWidget {
  const _Navbar();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 760;
    return Container(
      decoration: BoxDecoration(
        color: _bg.withValues(alpha: 0.92),
        border: const Border(bottom: BorderSide(color: _border)),
      ),
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40, vertical: 16),
      child: Row(
        children: [
          _Logo(),
          const Spacer(),
          if (!isMobile) ...[
            _NavLink('Recursos', () {}),
            const SizedBox(width: 32),
            _NavLink('Depoimentos', () {}),
            const SizedBox(width: 32),
            _NavLink('Planos', () {}),
            const SizedBox(width: 32),
          ],
          _GoldButton('Baixar grátis', () => _openUrl(_appStoreUrl), small: true),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/'),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('assets/images/icon.png', width: 36, height: 36),
          ),
          const SizedBox(width: 10),
          Text('Lumify', style: GoogleFonts.lora(fontSize: 22, fontWeight: FontWeight.w700, color: _textPrimary)),
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
      child: Text(label, style: _sans(15, weight: FontWeight.w500, color: _textSecondary)),
    );
  }
}

// ─── HERO ────────────────────────────────────────────────────────────────────
class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final isMobile = w < 900;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1C1510), _bg],
        ),
      ),
      padding: EdgeInsets.only(
        left: isMobile ? 24 : 80,
        right: isMobile ? 24 : 0,
        top: 80,
        bottom: 80,
      ),
      child: isMobile
          ? Column(crossAxisAlignment: CrossAxisAlignment.center, children: _content(mobile: true))
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: _content(mobile: false))),
                const SizedBox(width: 24),
                _HeroImage(),
              ],
            ),
    );
  }

  List<Widget> _content({required bool mobile}) => [
        // Rating badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: _gold.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: _gold.withValues(alpha: 0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star_rounded, color: _gold, size: 15),
              const SizedBox(width: 6),
              Text('4,9 · Mais de 10 mil avaliações', style: _sans(13, weight: FontWeight.w600, color: _gold)),
            ],
          ),
        ),
        const SizedBox(height: 28),
        // Headline
        Text(
          'Aproxime-se de\nDeus. Todos\nos dias.',
          textAlign: mobile ? TextAlign.center : TextAlign.start,
          style: _display(mobile ? 48 : 64),
        ),
        const SizedBox(height: 20),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Text(
            'Guia diário, Bíblia integrada, scanner com IA, planos de leitura e meditações — um aplicativo para a sua jornada espiritual.',
            textAlign: mobile ? TextAlign.center : TextAlign.start,
            style: _sans(17, color: _textSecondary),
          ),
        ),
        const SizedBox(height: 40),
        Wrap(
          alignment: mobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 16,
          runSpacing: 12,
          children: const [
            _StoreBtn(store: _Store.apple),
            _StoreBtn(store: _Store.google),
          ],
        ),
        if (mobile) ...[const SizedBox(height: 56), _HeroImage()],
      ];
}

class _HeroImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 900;
    final size = isMobile ? 340.0 : 420.0;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: _gold.withValues(alpha: 0.15), blurRadius: 80, spreadRadius: 10),
          BoxShadow(color: Colors.black.withValues(alpha: 0.5), blurRadius: 40, offset: const Offset(0, 20)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.asset('assets/images/frame1.jpg', width: size, fit: BoxFit.fitWidth),
      ),
    );
  }
}

// ─── STATS BAR ───────────────────────────────────────────────────────────────
class _StatsBar extends StatelessWidget {
  const _StatsBar();

  static const _stats = [
    ('10 mil+', 'Usuários ativos'),
    ('4,9 ★', 'App Store'),
    ('100+', 'Planos de leitura'),
    ('50+', 'Estudos bíblicos'),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 700;
    return Container(
      color: _elevated,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 32),
      child: Wrap(
        alignment: WrapAlignment.spaceAround,
        runSpacing: 24,
        children: _stats
            .map((s) => _StatItem(value: s.$1, label: s.$2))
            .toList(),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.value, required this.label});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Column(children: [
        Text(value, style: _display(32, color: _gold)),
        const SizedBox(height: 4),
        Text(label, style: _sans(14, color: _textTertiary)),
      ]),
    );
  }
}

// ─── FEATURE SPOTLIGHT ───────────────────────────────────────────────────────
class _FeatureSpotlight extends StatelessWidget {
  const _FeatureSpotlight({
    required this.tag,
    required this.headline,
    required this.body,
    required this.imagePath,
    required this.imageOnRight,
    required this.bg,
  });

  final String tag;
  final String headline;
  final String body;
  final String imagePath;
  final bool imageOnRight;
  final Color bg;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final isMobile = w < 900;

    final imgWidget = _FeatureImage(path: imagePath);
    final textWidget = _FeatureText(tag: tag, headline: headline, body: body);

    return Container(
      color: bg,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      child: isMobile
          ? Column(
              children: [
                imgWidget,
                const SizedBox(height: 40),
                textWidget,
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: imageOnRight
                  ? [Expanded(child: textWidget), const SizedBox(width: 64), imgWidget]
                  : [imgWidget, const SizedBox(width: 64), Expanded(child: textWidget)],
            ),
    );
  }
}

class _FeatureImage extends StatelessWidget {
  const _FeatureImage({required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 900;
    final w = isMobile ? 300.0 : 380.0;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: _gold.withValues(alpha: 0.10), blurRadius: 60, spreadRadius: 5),
          BoxShadow(color: Colors.black.withValues(alpha: 0.4), blurRadius: 30, offset: const Offset(0, 12)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(path, width: w, fit: BoxFit.fitWidth),
      ),
    );
  }
}

class _FeatureText extends StatelessWidget {
  const _FeatureText({required this.tag, required this.headline, required this.body});
  final String tag;
  final String headline;
  final String body;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 900;
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Tag pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: _gold.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: _gold.withValues(alpha: 0.25)),
          ),
          child: Text(tag, style: _sans(11, weight: FontWeight.w700, color: _gold)),
        ),
        const SizedBox(height: 20),
        Text(
          headline,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: _display(isMobile ? 36 : 44),
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: Text(
            body,
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
            style: _sans(16, color: _textSecondary),
          ),
        ),
      ],
    );
  }
}

// ─── TESTIMONIALS ────────────────────────────────────────────────────────────
class _TestimonialsSection extends StatelessWidget {
  const _TestimonialsSection();

  static const _reviews = [
    ('Maria S.', 'SP',
     'O guia diário mudou minha rotina. Versículo, reflexão e oração em 10 minutos todo dia. Não consigo imaginar minha manhã sem ele.'),
    ('João P.', 'MG',
     'Em 3 meses li o Novo Testamento completo com os planos de leitura. A consistência que sempre quis e nunca consegui ter.'),
    ('Ana C.', 'RJ',
     'As meditações guiadas me ajudaram a encontrar paz em momentos difíceis. Uso todos os dias antes de dormir.'),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 760;
    return Container(
      color: _elevated,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 80),
      child: Column(
        children: [
          _SectionLabel('DEPOIMENTOS'),
          const SizedBox(height: 16),
          Text('O que os usuários\nestão dizendo', style: _display(isMobile ? 32 : 40), textAlign: TextAlign.center),
          const SizedBox(height: 56),
          _ReviewGrid(reviews: _reviews),
        ],
      ),
    );
  }
}

class _ReviewGrid extends StatelessWidget {
  const _ReviewGrid({required this.reviews});
  final List<(String, String, String)> reviews;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 760;
    if (isMobile) {
      return Column(
        children: reviews.map((r) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _ReviewCard(name: r.$1, city: r.$2, text: r.$3),
        )).toList(),
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: reviews
          .expand((r) => [Expanded(child: _ReviewCard(name: r.$1, city: r.$2, text: r.$3)), const SizedBox(width: 20)])
          .toList()
        ..removeLast(),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({required this.name, required this.city, required this.text});
  final String name;
  final String city;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(20),
        border: Border(left: BorderSide(color: _gold, width: 3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('★★★★★', style: TextStyle(color: _gold, fontSize: 16, letterSpacing: 3)),
          const SizedBox(height: 16),
          Text('"$text"', style: _sans(15, color: _textPrimary).copyWith(fontStyle: FontStyle.italic, height: 1.7)),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [_gold, _goldLight]),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(child: Text(name[0], style: _sans(15, weight: FontWeight.w800, color: _bg))),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: _sans(14, weight: FontWeight.w700, color: _textPrimary)),
                  Text(city, style: _sans(12, color: _textTertiary)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── PLANS ───────────────────────────────────────────────────────────────────
class _PlansSection extends StatelessWidget {
  const _PlansSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 760;
    return Container(
      color: _bg,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 80),
      child: Column(
        children: [
          _SectionLabel('PLANOS'),
          const SizedBox(height: 16),
          Text('Comece grátis.\nCresça com Premium.', style: _display(isMobile ? 32 : 40), textAlign: TextAlign.center),
          const SizedBox(height: 8),
          Text('7 dias de teste gratuito · Sem compromisso', style: _sans(16, color: _textSecondary), textAlign: TextAlign.center),
          const SizedBox(height: 48),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 820),
            child: isMobile
                ? const Column(children: [
                    _PlanCard(free: true),
                    SizedBox(height: 20),
                    _PlanCard(free: false),
                  ])
                : const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _PlanCard(free: true)),
                      SizedBox(width: 20),
                      Expanded(child: _PlanCard(free: false)),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  const _PlanCard({required this.free});
  final bool free;

  static const _freeItems = ['Guia diário', 'Versículo do dia', 'Bíblia integrada', 'Planos de leitura básicos'];
  static const _premiumItems = ['Tudo do Gratuito', 'Estudos bíblicos completos', 'Planos de leitura ilimitados', 'Áudios e meditações guiadas', 'Scanner com IA', 'Conteúdo novo toda semana', 'Sem anúncios'];

  @override
  Widget build(BuildContext context) {
    final items = free ? _freeItems : _premiumItems;
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: free ? _surface : _card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: free ? _border : _gold.withValues(alpha: 0.4), width: free ? 1 : 1.5),
        boxShadow: free ? [] : [BoxShadow(color: _gold.withValues(alpha: 0.12), blurRadius: 40, spreadRadius: 0)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!free)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [_gold, _goldLight]),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text('7 DIAS GRÁTIS', style: _sans(11, weight: FontWeight.w800, color: _bg)),
            ),
          Text(free ? 'Gratuito' : 'Premium', style: _sans(18, weight: FontWeight.w700, color: _textPrimary)),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                free ? 'R\$ 0' : 'R\$ 19,90',
                style: _display(40, color: free ? _textPrimary : _gold),
              ),
              if (!free) ...[
                const SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text('/mês', style: _sans(16, color: _textTertiary)),
                ),
              ],
            ],
          ),
          const SizedBox(height: 28),
          Container(height: 1, color: _divider),
          const SizedBox(height: 24),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Icon(Icons.check_rounded, size: 18, color: free ? _textTertiary : _gold),
                    const SizedBox(width: 10),
                    Text(item, style: _sans(14, color: _textPrimary)),
                  ],
                ),
              )),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            child: free
                ? OutlinedButton(
                    onPressed: () => _openUrl(_appStoreUrl),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: _textSecondary,
                      side: const BorderSide(color: _border),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text('Baixar grátis', style: _sans(15, weight: FontWeight.w600, color: _textSecondary)),
                  )
                : _GoldButton('Começar agora', () => _openUrl(_appStoreUrl)),
          ),
        ],
      ),
    );
  }
}

// ─── CTA ─────────────────────────────────────────────────────────────────────
class _CtaSection extends StatelessWidget {
  const _CtaSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 760;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 32 : 80, vertical: 100),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2A1F0E), Color(0xFF1C1410), Color(0xFF0E1218)],
        ),
        border: const Border(top: BorderSide(color: _border)),
      ),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            margin: const EdgeInsets.only(bottom: 28),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              boxShadow: [BoxShadow(color: _gold.withValues(alpha: 0.3), blurRadius: 30, spreadRadius: 5)],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset('assets/images/icon.png'),
            ),
          ),
          Text(
            'Comece sua jornada\nespiritual hoje.',
            style: _display(isMobile ? 36 : 52),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Text(
              'Junte-se a mais de 10 mil cristãos que crescem na fé todos os dias com o Lumify.',
              style: _sans(17, color: _textSecondary),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          const Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 12,
            children: [
              _StoreBtn(store: _Store.apple),
              _StoreBtn(store: _Store.google),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── FOOTER ──────────────────────────────────────────────────────────────────
class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0D0B09),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset('assets/images/icon.png', width: 30, height: 30),
              ),
              const SizedBox(width: 8),
              Text('Lumify', style: GoogleFonts.lora(fontSize: 18, fontWeight: FontWeight.w700, color: _textPrimary)),
            ],
          ),
          const SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 28,
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
            style: _sans(12, color: _textTertiary),
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
      child: Text(label, style: _sans(13, color: _textSecondary)),
    );
  }
}

// ─── SHARED WIDGETS ──────────────────────────────────────────────────────────
enum _Store { apple, google }

class _StoreBtn extends StatelessWidget {
  const _StoreBtn({required this.store});
  final _Store store;

  @override
  Widget build(BuildContext context) {
    final isApple = store == _Store.apple;
    return GestureDetector(
      onTap: () => _openUrl(isApple ? _appStoreUrl : _playStoreUrl),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        decoration: BoxDecoration(
          color: _surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(isApple ? Icons.apple : Icons.android, size: 28, color: _textPrimary),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(isApple ? 'Download na' : 'Disponível no', style: _sans(10, color: _textTertiary)),
                Text(isApple ? 'App Store' : 'Google Play', style: _sans(15, weight: FontWeight.w800, color: _textPrimary)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _GoldButton extends StatelessWidget {
  const _GoldButton(this.label, this.onTap, {this.small = false});
  final String label;
  final VoidCallback onTap;
  final bool small;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: small ? 20 : 32, vertical: small ? 10 : 16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [_gold, _goldLight]),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: _gold.withValues(alpha: 0.25), blurRadius: 20, offset: const Offset(0, 6))],
        ),
        child: Text(label, style: _sans(small ? 14 : 16, weight: FontWeight.w800, color: _bg)),
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
        color: _gold.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: _gold.withValues(alpha: 0.25)),
      ),
      child: Text(text, style: _sans(11, weight: FontWeight.w700, color: _gold).copyWith(letterSpacing: 1.5)),
    );
  }
}

void _openUrl(String url) => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
