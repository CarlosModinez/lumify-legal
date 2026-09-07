import { Link, NavLink } from 'react-router-dom';

export default function Navbar() {
  return (
    <header className="navbar">
      <Link to="/" className="logo" aria-label="Lumify — início">
        <img className="logo-icon" src="/app-icon.png" alt="" aria-hidden />
        <span className="logo-text">Lumify</span>
      </Link>
      <nav className="nav-links">
        <NavLink to="/" end>
          Início
        </NavLink>
        <NavLink to="/privacy">Privacidade</NavLink>
        <NavLink to="/terms">Termos</NavLink>
        <NavLink to="/contact">Contato</NavLink>
      </nav>
    </header>
  );
}
