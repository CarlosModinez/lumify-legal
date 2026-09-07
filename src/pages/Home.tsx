import Reveal from '../components/Reveal';
import StoreButtons from '../components/StoreButtons';

type Feature = {
  id: string;
  eyebrow: string;
  title: string;
  description: string;
  bullets: string[];
  screenshot: string;
  alt: string;
};

const features: Feature[] = [
  {
    id: 'guia-diario',
    eyebrow: 'Guia Diário',
    title: 'Um encontro com Deus, todos os dias',
    description:
      'Todo dia o Lumify prepara um devocional completo para você: uma passagem bíblica, uma reflexão profunda e uma oração. E com o Check-in Espiritual, você acompanha a sua constância dia após dia.',
    bullets: [
      'Devocional novo toda manhã',
      'Check-in Espiritual com sequência semanal',
      'Passagens comentadas e aplicadas à sua vida',
    ],
    screenshot: '/screenshots/screen-1.jpg',
    alt: 'Tela inicial do Lumify com Check-in Espiritual e Guia Diário',
  },
  {
    id: 'scanner-ia',
    eyebrow: 'Scanner com IA',
    title: 'Aponte a câmera e entenda qualquer passagem',
    description:
      'Tire uma foto de qualquer página da sua Bíblia física e a inteligência artificial do Lumify gera um estudo exclusivo na hora: contexto histórico, explicação do texto e uma reflexão devocional feita para você.',
    bullets: [
      'Funciona com qualquer Bíblia impressa',
      'Contexto, reflexão e história em segundos',
      'Seus estudos ficam salvos para revisitar',
    ],
    screenshot: '/screenshots/screen-4.jpg',
    alt: 'Scanner da Bíblia do Lumify analisando uma página fotografada',
  },
  {
    id: 'biblia',
    eyebrow: 'Bíblia Integrada',
    title: 'Um leitor da Bíblia limpo e sem distrações',
    description:
      'Leia a Bíblia completa em uma interface pensada para o foco: tipografia confortável, navegação rápida por livros e capítulos e o modo Leitura Guiada para quem quer ser conduzido passo a passo.',
    bullets: [
      'Bíblia completa, do Gênesis ao Apocalipse',
      'Navegação rápida por capítulos',
      'Modo Leitura Guiada',
    ],
    screenshot: '/screenshots/screen-6.jpg',
    alt: 'Leitor da Bíblia do Lumify aberto em Gênesis capítulo 1',
  },
  {
    id: 'meditacoes',
    eyebrow: 'Meditações em Áudio',
    title: 'Devocionais em áudio para ouvir em qualquer lugar',
    description:
      'Áudios guiados de oração, meditação e descanso — perfeitos para o trajeto, a pausa do trabalho ou o fim do dia. Toda semana chegam conteúdos novos, exclusivos e personalizados para o seu momento.',
    bullets: [
      'Player completo, no seu ritmo',
      'Novos áudios toda semana',
      'Temas como perdão, paz, gratidão e fé',
    ],
    screenshot: '/screenshots/screen-5.jpg',
    alt: 'Player de áudio do Lumify reproduzindo a meditação Liberando o Perdão',
  },
  {
    id: 'cursos',
    eyebrow: 'Cursos e Planos',
    title: 'Estudos completos para aprofundar a sua fé',
    description:
      'Vá além do devocional: planos de leitura temáticos, estudos bíblicos e cursos completos organizados em trilhas. Do destaque da semana às meditações, tudo em um só lugar.',
    bullets: [
      'Planos de leitura no seu ritmo',
      'Estudos e cursos em trilhas organizadas',
      'Destaques novos toda semana',
    ],
    screenshot: '/screenshots/screen-3.jpg',
    alt: 'Aba de mídias do Lumify com cursos, planos e meditações',
  },
];

const extras = [
  {
    icon: '🔥',
    title: 'Check-in Espiritual',
    text: 'Crie o hábito: acompanhe sua sequência de dias com Deus.',
  },
  {
    icon: '✨',
    title: 'Personalizado para você',
    text: 'Conteúdos selecionados para o momento que você está vivendo.',
  },
  {
    icon: '📅',
    title: 'Novidades toda semana',
    text: 'Devocionais, áudios e estudos novos chegam continuamente.',
  },
  {
    icon: '🎧',
    title: 'Ouça offline, onde quiser',
    text: 'Meditações e devocionais em áudio para qualquer hora do dia.',
  },
  {
    icon: '📖',
    title: 'Leitura Guiada',
    text: 'Seja conduzido pela Bíblia com orientação passo a passo.',
  },
  {
    icon: '🕊️',
    title: 'Sem distrações',
    text: 'Uma experiência tranquila, feita para oração e foco.',
  },
];

const stats = [
  { value: '4,9 ★', label: 'nota média nas lojas' },
  { value: 'Exclusivo', label: 'conteúdo novo toda semana' },
  { value: 'Cursos', label: 'aulas e estudos completos' },
  { value: 'iOS & Android', label: 'disponível nas duas lojas' },
];

export default function Home() {
  return (
    <>
      <section className="hero">
        <div className="hero-glow" aria-hidden />
        <div className="hero-inner">
          <Reveal className="hero-text">
            <span className="badge">★ 4,9 · Bíblia, devocionais e cursos</span>
            <h1>
              Aproxime-se de Deus.
              <br />
              <em>Todos os dias.</em>
            </h1>
            <p className="hero-sub">
              O Lumify reúne guia devocional diário, Bíblia integrada, scanner com IA,
              planos de leitura e meditações em áudio — tudo em um aplicativo feito para
              a sua jornada espiritual.
            </p>
            <StoreButtons />
            <p className="hero-note">Grátis para baixar · Conteúdos exclusivos toda semana</p>
          </Reveal>

          <Reveal className="hero-shots" delay={120}>
            <div className="shot shot--side shot--left">
              <img src="/screenshots/screen-4.jpg" alt="" aria-hidden loading="eager" />
            </div>
            <div className="shot shot--main">
              <img
                src="/screenshots/screen-1.jpg"
                alt="Tela inicial do aplicativo Lumify"
                loading="eager"
              />
            </div>
            <div className="shot shot--side shot--right">
              <img src="/screenshots/screen-5.jpg" alt="" aria-hidden loading="eager" />
            </div>
          </Reveal>
        </div>
      </section>

      <section className="intro">
        <Reveal className="intro-inner">
          <img className="intro-icon" src="/app-icon.png" alt="Ícone do Lumify" />
          <h2>O que é o Lumify?</h2>
          <p>
            O Lumify é um aplicativo cristão de devocionais e estudo bíblico que transforma
            a sua rotina espiritual. Em vez de conteúdos genéricos, ele entrega um guia
            diário personalizado, permite escanear a sua própria Bíblia para gerar estudos
            com inteligência artificial e acompanha o seu crescimento com check-ins,
            planos de leitura, cursos e meditações em áudio.
          </p>
          <div className="stats" role="list">
            {stats.map((s) => (
              <div className="stat" role="listitem" key={s.label}>
                <strong>{s.value}</strong>
                <span>{s.label}</span>
              </div>
            ))}
          </div>
        </Reveal>
      </section>

      <section className="feature-rows" id="funcionalidades">
        {features.map((f, i) => (
          <Reveal key={f.id} className={`feature-row${i % 2 ? ' feature-row--flip' : ''}`}>
            <div className="feature-row-text">
              <span className="eyebrow">{f.eyebrow}</span>
              <h2>{f.title}</h2>
              <p>{f.description}</p>
              <ul className="feature-bullets">
                {f.bullets.map((b) => (
                  <li key={b}>{b}</li>
                ))}
              </ul>
            </div>
            <div className="feature-row-media">
              <div className="shot shot--feature">
                <img src={f.screenshot} alt={f.alt} loading="lazy" />
              </div>
            </div>
          </Reveal>
        ))}
      </section>

      <section className="extras">
        <Reveal>
          <h2>E ainda tem mais</h2>
          <p className="extras-sub">
            Pequenos detalhes que fazem diferença na sua caminhada.
          </p>
        </Reveal>
        <div className="extras-grid">
          {extras.map((e, i) => (
            <Reveal key={e.title} delay={Math.min(i * 60, 240)}>
              <div className="extra-card">
                <span className="extra-icon" aria-hidden>
                  {e.icon}
                </span>
                <h3>{e.title}</h3>
                <p>{e.text}</p>
              </div>
            </Reveal>
          ))}
        </div>
      </section>

      <section className="cta">
        <Reveal className="cta-card">
          <img className="cta-icon" src="/app-icon.png" alt="" aria-hidden />
          <h2>Comece sua jornada hoje</h2>
          <p>
            Baixe gratuitamente e descubra devocionais, cursos e meditações exclusivas.
            <br />
            Um passo por dia, mais perto de Deus.
          </p>
          <StoreButtons />
        </Reveal>
      </section>
    </>
  );
}
