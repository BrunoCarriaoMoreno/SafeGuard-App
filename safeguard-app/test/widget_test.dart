// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:safeguard/main.dart';

void main() {

testWidgets('Testar interação com o botão de monitoramento', (WidgetTester tester) async {
    // Cria o widget para o teste
    await tester.pumpWidget(MyApp());

    // Verifica se o botão está com o texto inicial
    expect(find.text('Ativar Monitoramento'), findsOneWidget);
    expect(find.text('Monitoramento Ativado'), findsNothing);

    // Clica no botão
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump(); // Atualiza a tela

    // Verifica se o texto do botão foi alterado
    expect(find.text('Ativar Monitoramento'), findsNothing);
    expect(find.text('Monitoramento Ativado'), findsOneWidget);

    // Clica novamente no botão para alternar de volta
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump(); // Atualiza a tela

    // Verifica se o texto voltou ao estado inicial
    expect(find.text('Ativar Monitoramento'), findsOneWidget);
    expect(find.text('Monitoramento Ativado'), findsNothing);
  });

testWidgets('Verifica se a lista de anomalias está presente', (WidgetTester tester) async {
  // Cria o widget para o teste
  await tester.pumpWidget(MyApp());

  // Verifica se o texto da primeira anomalia está presente
  final listFinder = find.text('Anomalia 1: Atividade suspeita detectada as 18:30!');

  // Verifica se o texto da anomalia é encontrado na lista
  expect(listFinder, findsOneWidget);
});



testWidgets('Verifica se a navegação para a tela de configurações funciona', (WidgetTester tester) async {

  await tester.pumpWidget(MyApp());


  final floatingButtonFinder = find.byIcon(Icons.settings);
  expect(floatingButtonFinder, findsOneWidget);


  await tester.tap(floatingButtonFinder);

  await tester.pumpAndSettle();


  final settingsScreenFinder = find.text('Configurações');
  expect(settingsScreenFinder, findsOneWidget);
});

}
