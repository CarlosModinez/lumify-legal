import { Link } from 'react-router-dom';

export default function NotFound() {
  return (
    <section className="not-found">
      <h1>404</h1>
      <p>A página que você procurou não foi encontrada.</p>
      <Link to="/" className="link">Voltar ao início</Link>
    </section>
  );
}
