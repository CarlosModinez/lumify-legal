# Lumify — Site institucional

Site simples em React + Vite + TypeScript que apresenta o aplicativo Lumify
(devocional cristão) e hospeda os documentos legais (Política de Privacidade
e Termos de Uso).

## Scripts

```bash
npm install     # instalar dependências
npm run dev     # ambiente de desenvolvimento (http://localhost:5173)
npm run build   # gera o bundle de produção em dist/
npm run preview # visualiza o build
npm run lint    # verificação de tipos com TypeScript
```

## Estrutura

- `src/pages/Home.tsx` — landing institucional
- `src/pages/Privacy.tsx` — política de privacidade
- `src/pages/Terms.tsx` — termos de uso
- `src/components/` — componentes compartilhados (Navbar, Footer, etc.)
