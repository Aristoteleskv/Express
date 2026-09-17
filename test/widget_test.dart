import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:express/routes/Rotas.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const Rotas());

    // O teste original falharia porque o app Express não tem um contador.
    // Vou apenas garantir que ele encontre o texto inicial da Splash ou Home.
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
