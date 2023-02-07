import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:cimilada/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on city icon, verify city_name and cityPage',
            (tester) async {
          app.main();
          await tester.pumpAndSettle();

          // Verify the city is Meoqui
          expect(find.text('Meoqui'), findsOneWidget);

          // Finds the floating action button to tap on.
          final Finder fab = find.byTooltip('City');

          // Emulate a tap on the floating action button.
          await tester.tap(fab);

          // Trigger a frame.
          await tester.pumpAndSettle();

          // Verify the counter increments by 1.
          expect(find.text('Get Weather'), findsOneWidget);
        });
  });
}