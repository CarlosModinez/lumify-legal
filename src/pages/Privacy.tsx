import LegalDocument, { type LegalSection } from '../components/Legal';

const sections: LegalSection[] = [
  {
    title: '1. Introdução',
    body: 'A Lumify valoriza a sua privacidade. Esta Política descreve como coletamos, usamos, armazenamos e protegemos suas informações pessoais quando você utiliza nosso aplicativo e serviços.',
  },
  {
    title: '2. Dados que Coletamos',
    body:
      'Coletamos as seguintes categorias de dados:\n\n' +
      '• Dados de conta: nome, endereço de e-mail e foto de perfil fornecidos no cadastro ou via login social (Google/Apple).\n' +
      '• Dados de uso: progresso em planos de leitura, guias diários completados, preferências de conteúdo.\n' +
      '• Dados de assinatura: status da assinatura, identificador de transação (fornecido pela App Store ou Google Play). Não armazenamos dados de cartão de crédito.\n' +
      '• Dados de diagnóstico: logs de falhas e métricas de desempenho coletados via Firebase Crashlytics e Firebase Performance, usados exclusivamente para melhorar a estabilidade do aplicativo.\n' +
      '• Dados de notificação: token de dispositivo para envio de notificações push (Firebase Messaging).',
  },
  {
    title: '3. Como Usamos Seus Dados',
    body:
      'Utilizamos seus dados para:\n\n' +
      '• Fornecer e personalizar as funcionalidades do Serviço.\n' +
      '• Processar sua assinatura e verificar seu status Premium.\n' +
      '• Enviar notificações relevantes (com sua permissão).\n' +
      '• Diagnosticar e corrigir falhas no aplicativo.\n' +
      '• Cumprir obrigações legais e regulatórias.\n\n' +
      'Não utilizamos seus dados para publicidade direcionada de terceiros nem os vendemos a terceiros.',
  },
  {
    title: '4. Compartilhamento de Dados',
    body:
      'Seus dados podem ser compartilhados com:\n\n' +
      '• Google Firebase: para autenticação, banco de dados, armazenamento, notificações push, análise de desempenho e diagnóstico de falhas.\n' +
      '• Apple / Google: para validação de compras in-app.\n' +
      '• Nosso servidor backend (Heroku): para armazenar dados de conta e assinatura.\n\n' +
      'Todos os fornecedores de serviço são contratualmente obrigados a proteger seus dados e a não utilizá-los para outros fins.',
  },
  {
    title: '5. Rastreamento',
    body: 'O Lumify não rastreia você entre outros aplicativos ou sites. Não utilizamos dados de comportamento para publicidade. Os dados de diagnóstico coletados pelo Firebase Crashlytics destinam-se exclusivamente à estabilidade do aplicativo e não são usados para fins publicitários.',
  },
  {
    title: '6. Retenção de Dados',
    body: 'Mantemos seus dados enquanto sua conta estiver ativa. Ao solicitar a exclusão da conta, seus dados pessoais são apagados permanentemente dos nossos servidores em até 30 dias, salvo obrigação legal de retenção.',
  },
  {
    title: '7. Seus Direitos (LGPD)',
    body:
      'Conforme a Lei Geral de Proteção de Dados (Lei nº 13.709/2018), você tem direito a:\n\n' +
      '• Confirmar a existência de tratamento de dados.\n' +
      '• Acessar seus dados.\n' +
      '• Corrigir dados incompletos, inexatos ou desatualizados.\n' +
      '• Solicitar a exclusão dos dados.\n' +
      '• Revogar o consentimento a qualquer momento.\n\n' +
      'Para exercer esses direitos, entre em contato: suporte@lumify-app.com',
  },
  {
    title: '8. Segurança',
    body: 'Adotamos medidas técnicas e organizacionais adequadas para proteger seus dados contra acesso não autorizado, perda ou destruição, incluindo criptografia em trânsito (HTTPS/TLS) e controles de acesso ao banco de dados.',
  },
  {
    title: '9. Crianças',
    body: 'O Serviço não é direcionado a menores de 13 anos. Não coletamos intencionalmente dados pessoais de crianças. Se você acredita que uma criança forneceu dados pessoais, entre em contato conosco para que possamos removê-los.',
  },
  {
    title: '10. Alterações nesta Política',
    body: 'Podemos atualizar esta Política periodicamente. Notificaremos sobre alterações materiais por meio do aplicativo ou por e-mail. O uso continuado do Serviço após a notificação constitui aceitação da Política atualizada.',
  },
  {
    title: '11. Contato',
    body: 'Dúvidas sobre privacidade ou solicitações relacionadas a dados pessoais:\n\nsuporte@lumify-app.com\n\nLumify — São Paulo, SP, Brasil.',
  },
];

export default function Privacy() {
  return (
    <LegalDocument
      title="Política de Privacidade"
      lastUpdated="26 de abril de 2026"
      sections={sections}
    />
  );
}
