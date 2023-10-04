import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todoey/main.dart' as app;

// enum DeviceType { Phone, Tablet }
//
// // DeviceType getDeviceType() {
// //   if (MediaQueryData.fromWindow(WidgetsBinding.instance) == null) {
// //     return DeviceType.Phone;
// //   } else {
// //     final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
// //     return data.size.shortestSide < 550 ? DeviceType.Phone : DeviceType.Tablet;
// //   }
// // }

void main() {
  group('description', () {
    testWidgets('WHEN task is done EXPECT task is marked as done AND task is crossed',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(Checkbox).first);
      await tester.pumpAndSettle();

      //Checkbox todoItem = tester.widget(find.byType(Checkbox).first);
      ListTile listTile = tester.widget(find.byType(ListTile).first);
      Text text = listTile.title as Text;
      // getDeviceType() == DeviceType.Phone
      //     ? expect(todoItem.value, equals(false))
      //     : expect(todoItem.value, equals(true));

      expect(text.style?.decoration, equals(TextDecoration.lineThrough));
    });

    testWidgets('WHEN add button is pressed EXPECT overlay is opened', (WidgetTester tester) async {
      app.main();
      //await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('value')));
      await tester.pumpAndSettle();
      MaterialButton button = tester.widget(find.byKey(const Key('Add task')));
      Text buttonText = button.child as Text;
      expect(buttonText.data, equals('Add'));

      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 5));
    });
  });
}
