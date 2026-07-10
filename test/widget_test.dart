import 'package:flutter_test/flutter_test.dart';
import 'package:sajilni/main.dart';

void main() {
  testWidgets('App loads home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const SajilniApp());
    await tester.pumpAndSettle();

    expect(find.text('EduManage'), findsOneWidget);
    expect(find.text('أهلاً بك مجدداً'), findsOneWidget);
  });
}
