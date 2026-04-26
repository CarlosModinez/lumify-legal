import 'package:flutter_test/flutter_test.dart';
import 'package:lumify_legal/main.dart';

void main() {
  testWidgets('app launches', (tester) async {
    await tester.pumpWidget(const LumifyLegalApp());
    expect(find.byType(LumifyLegalApp), findsOneWidget);
  });
}
