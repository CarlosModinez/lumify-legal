import LegalDocument, { type LegalSection } from '../components/Legal';

const sections: LegalSection[] = [
  {
    title: '1. Aceitação dos Termos',
    body: 'Ao acessar ou utilizar o aplicativo Lumify ("Serviço"), você concorda em ficar vinculado a estes Termos de Uso. Se você não concordar com qualquer parte destes termos, não utilize o Serviço.',
  },
  {
    title: '2. Descrição do Serviço',
    body: 'Lumify é um aplicativo de devocionais cristãos que oferece guias diários, planos de leitura bíblica, estudos bíblicos, meditações e conteúdos de áudio. O Serviço está disponível em versão gratuita (com recursos limitados) e versão Premium (assinatura paga com acesso completo).',
  },
  {
    title: '3. Assinatura Premium',
    body: 'A assinatura Lumify Premium é uma assinatura com renovação automática. O valor será cobrado no seu método de pagamento (App Store ou Google Play) no início de cada período de assinatura. Você pode cancelar a qualquer momento nas configurações da sua conta na loja correspondente. O cancelamento entra em vigor ao final do período vigente — você não perderá o acesso até o término do período pago.',
  },
  {
    title: '4. Período de Teste Gratuito',
    body: 'Novos assinantes podem ter direito a um período de teste gratuito de 7 (sete) dias antes da cobrança do primeiro ciclo. Somente uma conta por usuário tem direito ao período de teste. Após o término do período de teste, a assinatura é cobrada automaticamente, salvo cancelamento antes do término.',
  },
  {
    title: '5. Conta de Usuário',
    body: 'Para utilizar determinadas funcionalidades do Serviço, você deve criar uma conta. Você é responsável por manter a confidencialidade das credenciais de acesso e por todas as atividades realizadas na sua conta. Notifique-nos imediatamente em caso de uso não autorizado.',
  },
  {
    title: '6. Uso Aceitável',
    body: 'Você concorda em utilizar o Serviço apenas para fins lícitos e de acordo com estes Termos. É vedado: (a) reproduzir, distribuir ou criar obras derivadas do conteúdo sem autorização; (b) fazer engenharia reversa do aplicativo; (c) utilizar o Serviço de forma a prejudicar outros usuários ou a infraestrutura da plataforma.',
  },
  {
    title: '7. Propriedade Intelectual',
    body: 'Todo o conteúdo do Serviço — incluindo textos, imagens, áudios, design e software — é de propriedade da Lumify ou de seus licenciadores e está protegido pelas leis de direitos autorais.',
  },
  {
    title: '8. Limitação de Responsabilidade',
    body: 'O Serviço é fornecido "como está", sem garantias de qualquer tipo. Na máxima extensão permitida pela lei, a Lumify não se responsabiliza por quaisquer danos indiretos, incidentais ou consequenciais decorrentes do uso ou da impossibilidade de uso do Serviço.',
  },
  {
    title: '9. Exclusão de Conta',
    body: 'Você pode solicitar a exclusão da sua conta a qualquer momento por meio das configurações do aplicativo. A exclusão é permanente e irreversível. Dados pessoais serão removidos conforme nossa Política de Privacidade.',
  },
  {
    title: '10. Alterações nos Termos',
    body: 'Podemos atualizar estes Termos periodicamente. Alterações materiais serão comunicadas dentro do aplicativo ou por e-mail. O uso continuado do Serviço após a notificação constitui aceitação dos novos termos.',
  },
  {
    title: '11. Lei Aplicável',
    body: 'Estes Termos são regidos pelas leis da República Federativa do Brasil. Quaisquer disputas serão submetidas ao foro da comarca de São Paulo — SP.',
  },
  {
    title: '12. Contato',
    body: 'Dúvidas sobre estes Termos? Entre em contato: suporte@lumify-app.com',
  },
];

export default function Terms() {
  return (
    <LegalDocument
      title="Termos de Uso"
      lastUpdated="26 de abril de 2026"
      sections={sections}
    />
  );
}
