import 'package:flutter/material.dart';
import '../widgets/legal_scaffold.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LegalScaffold(
      title: 'Termos de Uso',
      lastUpdated: '26 de abril de 2026',
      sections: [
        LegalSection(
          '1. Aceitação dos Termos',
          'Ao acessar ou utilizar o aplicativo Lumify ("Serviço"), você concorda em ficar vinculado a estes Termos de Uso. Se você não concordar com qualquer parte destes termos, não utilize o Serviço.',
        ),
        LegalSection(
          '2. Descrição do Serviço',
          'Lumify é um aplicativo de devocionais cristãos que oferece guias diários, planos de leitura bíblica, estudos bíblicos, meditações e conteúdos de áudio. O Serviço está disponível em versão gratuita (com recursos limitados) e versão Premium (assinatura paga com acesso completo).',
        ),
        LegalSection(
          '3. Assinatura Premium',
          'A assinatura Lumify Premium é uma assinatura com renovação automática. O valor será cobrado no seu método de pagamento (App Store ou Google Play) no início de cada período de assinatura. Você pode cancelar a qualquer momento nas configurações da sua conta na loja correspondente. O cancelamento entra em vigor ao final do período vigente — você não perderá o acesso até o término do período pago.',
        ),
        LegalSection(
          '4. Período de Teste Gratuito',
          'Novos assinantes podem ter direito a um período de teste gratuito de 7 (sete) dias antes da cobrança do primeiro ciclo. Somente uma conta por usuário tem direito ao período de teste. Após o término do período de teste, a assinatura é cobrada automaticamente, salvo cancelamento antes do término.',
        ),
        LegalSection(
          '5. Conta de Usuário',
          'Para utilizar determinadas funcionalidades do Serviço, você deve criar uma conta. Você é responsável por manter a confidencialidade das credenciais de acesso e por todas as atividades realizadas na sua conta. Notifique-nos imediatamente em caso de uso não autorizado.',
        ),
        LegalSection(
          '6. Uso Aceitável',
          'Você concorda em utilizar o Serviço apenas para fins lícitos e de acordo com estes Termos. É vedado: (a) reproduzir, distribuir ou criar obras derivadas do conteúdo sem autorização; (b) fazer engenharia reversa do aplicativo; (c) utilizar o Serviço de forma a prejudicar outros usuários ou a infraestrutura da plataforma.',
        ),
        LegalSection(
          '7. Propriedade Intelectual',
          'Todo o conteúdo do Serviço — incluindo textos, imagens, áudios, design e software — é de propriedade da Lumify ou de seus licenciadores e está protegido pelas leis de direitos autorais.',
        ),
        LegalSection(
          '8. Limitação de Responsabilidade',
          'O Serviço é fornecido "como está", sem garantias de qualquer tipo. Na máxima extensão permitida pela lei, a Lumify não se responsabiliza por quaisquer danos indiretos, incidentais ou consequenciais decorrentes do uso ou da impossibilidade de uso do Serviço.',
        ),
        LegalSection(
          '9. Exclusão de Conta',
          'Você pode solicitar a exclusão da sua conta a qualquer momento por meio das configurações do aplicativo. A exclusão é permanente e irreversível. Dados pessoais serão removidos conforme nossa Política de Privacidade.',
        ),
        LegalSection(
          '10. Alterações nos Termos',
          'Podemos atualizar estes Termos periodicamente. Alterações materiais serão comunicadas dentro do aplicativo ou por e-mail. O uso continuado do Serviço após a notificação constitui aceitação dos novos termos.',
        ),
        LegalSection(
          '11. Lei Aplicável',
          'Estes Termos são regidos pelas leis da República Federativa do Brasil. Quaisquer disputas serão submetidas ao foro da comarca de São Paulo — SP.',
        ),
        LegalSection(
          '12. Contato',
          'Dúvidas sobre estes Termos? Entre em contato: suporte@lumify-app.com',
        ),
      ],
    );
  }
}
