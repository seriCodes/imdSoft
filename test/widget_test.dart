// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// import 'package:imdsoft/main.dart';
import '../lib/main.dart';

void main() {
  print("test Widget2");

  testWidgets(
    "Add and remove a todo",
    (WidgetTester tester) async {
      await tester.pumpWidget(const TodoList());
      await tester.enterText(find.byType(TextField), 'hi');
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();
      expect(find.text('hi'), findsOneWidget);
      await tester.drag(find.byType(Dismissible), const Offset(500, 0));
      await tester.pumpAndSettle();
      expect(find.text('hi'), findsNothing);
    },
  );
}
