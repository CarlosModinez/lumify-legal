import { Link } from 'react-router-dom';
import { APP_STORE_URL, PLAY_STORE_URL } from './StoreButtons';

export default function Footer() {
  const year = new Date().getFullYear();
  return (
    <footer className="footer">
      <div className="footer-inner">
        <div className="footer-brand">
          <div className="footer-logo">
            <img src="/app-icon.png" alt="" aria-hidden />
            <strong>Lumify</strong>
          </div>
          <p>
            Bíblia e devocionais para se aproximar de Deus todos os dias — guia diário,
            scanner com IA, planos de leitura e meditações.
          </p>
        </div>
        <div className="footer-col">
          <span className="footer-title">Baixe o app</span>
          <a href={APP_STORE_URL} target="_blank" rel="noopener noreferrer">
            App Store (iOS)
          </a>
          <a href={PLAY_STORE_URL} target="_blank" rel="noopener noreferrer">
            Google Play (Android)
          </a>
        </div>
        <div className="footer-col">
          <span className="footer-title">Institucional</span>
          <Link to="/privacy">Política de Privacidade</Link>
          <Link to="/terms">Termos de Uso</Link>
          <Link to="/contact">Contato & Exclusão de Conta</Link>
          <a href="mailto:suporte@lumify-app.com">suporte@lumify-app.com</a>
        </div>
      </div>
      <div className="footer-copy">© {year} Lumify. Todos os direitos reservados.</div>
    </footer>
  );
}
