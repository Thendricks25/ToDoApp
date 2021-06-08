import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:to_do/View-UI/ListTile.dart';
import 'package:to_do/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("adding item to list test", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
    final textfield = find.byType(TextField);
    final submitbutton = find.byType(TextButton);
    await tester.enterText(textfield, "pick apples");
    await tester.pumpAndSettle();
    await tester.tap(submitbutton);
    await tester.pumpAndSettle();
  });
}
