import { useState, FormEvent } from 'react';

const API = 'https://lumify-main-api-6f67e772fbca.herokuapp.com/api/contact';

type RequestType = 'contact' | 'deletion';

export default function Contact() {
  const [type, setType] = useState<RequestType>('contact');
  const [email, setEmail] = useState('');
  const [message, setMessage] = useState('');
  const [status, setStatus] = useState<'idle' | 'loading' | 'success' | 'error'>('idle');
  const [errorMsg, setErrorMsg] = useState('');

  async function handleSubmit(e: FormEvent) {
    e.preventDefault();
    setStatus('loading');
    setErrorMsg('');

    try {
      const res = await fetch(API, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email, type, message: message || null }),
      });

      if (!res.ok) {
        const data = await res.json().catch(() => ({}));
        throw new Error(data?.detail || 'Erro ao enviar solicitação.');
      }

      setStatus('success');
    } catch (err: unknown) {
      setErrorMsg(err instanceof Error ? err.message : 'Erro inesperado.');
      setStatus('error');
    }
  }

  if (status === 'success') {
    return (
      <div className="legal">
        <div className="contact-success">
          <span className="contact-success-icon">✓</span>
          <h2>Solicitação recebida</h2>
          <p>
            {type === 'deletion'
              ? 'Sua solicitação de exclusão de conta foi registrada. Entraremos em contato em até 5 dias úteis.'
              : 'Sua mensagem foi enviada. Responderemos em breve.'}
          </p>
        </div>
      </div>
    );
  }

  return (
    <div className="legal">
      <h1>Fale conosco</h1>
      <p className="contact-lead">
        Envie uma mensagem ou solicite a exclusão da sua conta a qualquer momento.
      </p>

      <form className="contact-form" onSubmit={handleSubmit} noValidate>
        <fieldset className="contact-type-group">
          <legend>Tipo de solicitação</legend>
          <label className={`contact-type-option${type === 'contact' ? ' selected' : ''}`}>
            <input
              type="radio"
              name="type"
              value="contact"
              checked={type === 'contact'}
              onChange={() => setType('contact')}
            />
            <span className="contact-type-label">
              <strong>Mensagem geral</strong>
              <small>Dúvidas, sugestões ou qualquer outro assunto</small>
            </span>
          </label>
          <label className={`contact-type-option${type === 'deletion' ? ' selected' : ''}`}>
            <input
              type="radio"
              name="type"
              value="deletion"
              checked={type === 'deletion'}
              onChange={() => setType('deletion')}
            />
            <span className="contact-type-label">
              <strong>Exclusão de conta</strong>
              <small>Solicitar remoção permanente dos seus dados</small>
            </span>
          </label>
        </fieldset>

        <label className="contact-field">
          <span>E-mail</span>
          <input
            type="email"
            required
            placeholder="seu@email.com"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
          />
        </label>

        <label className="contact-field">
          <span>Mensagem {type === 'deletion' ? '(opcional)' : ''}</span>
          <textarea
            rows={5}
            placeholder={
              type === 'deletion'
                ? 'Conte-nos o motivo da exclusão (opcional)'
                : 'Escreva sua mensagem aqui...'
            }
            required={type === 'contact'}
            value={message}
            onChange={(e) => setMessage(e.target.value)}
          />
        </label>

        {type === 'deletion' && (
          <p className="contact-warning">
            ⚠ A exclusão de conta é permanente e irreversível. Todos os seus dados serão removidos.
          </p>
        )}

        {status === 'error' && (
          <p className="contact-error">{errorMsg}</p>
        )}

        <button
          type="submit"
          className="contact-submit"
          disabled={status === 'loading'}
        >
          {status === 'loading'
            ? 'Enviando...'
            : type === 'deletion'
            ? 'Solicitar exclusão'
            : 'Enviar mensagem'}
        </button>
      </form>
    </div>
  );
}
