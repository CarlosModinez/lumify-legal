export type LegalSection = { title: string; body: string };

type Props = {
  title: string;
  lastUpdated: string;
  sections: LegalSection[];
};

export default function LegalDocument({ title, lastUpdated, sections }: Props) {
  return (
    <article className="legal">
      <header className="legal-header">
        <h1>{title}</h1>
        <p className="legal-updated">Última atualização: {lastUpdated}</p>
      </header>
      <div className="legal-body">
        {sections.map((s) => (
          <section key={s.title}>
            <h2>{s.title}</h2>
            {s.body.split('\n\n').map((para, i) => (
              <p key={i} style={{ whiteSpace: 'pre-line' }}>{para}</p>
            ))}
          </section>
        ))}
      </div>
    </article>
  );
}
