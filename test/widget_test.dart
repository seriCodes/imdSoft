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
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   print("testWidgets3");

  //   await tester.pumpWidget(MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);
  //   // expect(find.text('1'), fin);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);

  //   await tester.tap(find.byIcon(Icons.add));
  //       //!not working// await tester.tap(find.byWidget(Icon(Icons.add)));

  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('1'), findsNothing);
  //   expect(find.text('2'), findsOneWidget);
  //   //!not working// expect(find.byWidget(Text("2")) ,  findsOneWidget);

  //   await tester.tap(find.byIcon(Icons.remove));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('2'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });

// testWidgets("using key", (WidgetTester tester) async{
//   const testKey= Key('k');
//     await tester.pumpWidget(MaterialApp(key: testKey, home: Container()));

//   // Find the MaterialApp widget using the testKey.
//   expect(find.byKey(testKey), findsOneWidget);

// },
// );
  testWidgets('finds a specific instance', (WidgetTester tester) async {
    const childWidget = Padding(padding: EdgeInsets.zero);

    // Provide the childWidget to the Container.
    await tester.pumpWidget(Container(child: childWidget));

    // Search for the childWidget in the tree and verify it exists.
    expect(find.byWidget(childWidget), findsOneWidget); //V
    // expect(Padding(padding: EdgeInsets.zero), findsNothing);//fail
    // expect(Padding(padding: EdgeInsets.zero), findsOneWidget);//fail
  });
}
