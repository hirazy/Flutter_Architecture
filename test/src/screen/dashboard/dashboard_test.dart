import 'package:flutter_map/src/screen/dashboard/dashboard_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  group('Dash Board Test', (){
    testWidgets('Change ', (WidgetTester tester) async{

      await tester.pumpWidget(DashBoard());
      
      // expect(actual, matcher)

    });
  });
}