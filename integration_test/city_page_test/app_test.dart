import 'dart:io';

import 'package:flutter/cupertino.dart';
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
          final Finder fab = find.byKey(Key('cityButton'));
          // Emulate a tap on the floating action button.
          await tester.tap(fab);
          // Trigger a frame.
          await tester.pumpAndSettle();
          // Verify the counter increments by 1.
          expect(find.text('Get Weather'), findsOneWidget);
        });

    testWidgets('tap on city icon and choose a new location, verify updated city_name and cityPage',
            (tester) async {
          app.main();
          await tester.pumpAndSettle();
          // Finds the floating action button to tap on.
          final Finder fab = find.byKey(Key('cityButton'));
          final Finder weatherfield = find.byKey(Key('weather_textfield'));
          // Emulate a tap on the floating action button.
          await tester.tap(fab);
          // Trigger a frame.
          await tester.pumpAndSettle();

          await tester.enterText(weatherfield, "Toronto");
          await tester.press(find.text('Get Weather'));
          // Verify the counter increments by 1.
          expect(find.text('Toronto'), findsOneWidget);
          await tester.pumpAndSettle();

        });

  });
}