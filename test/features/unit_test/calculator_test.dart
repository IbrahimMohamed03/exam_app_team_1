import 'package:exam_app_team_1/features/unit_test/calculator.dart';
import 'package:test/test.dart';
void main(){
  late Calculator calculator;

  setUp((){
    print("setuppp");

  });
  setUpAll((){
    print("setuppp All");
    calculator = Calculator();
  });
  tearDown((){

  });
  tearDownAll((){

  });

  group("Add function tests", (){
    test("testing add function on 2 pos numbers",(){
      int a=5;
      int b=11;


      int res=calculator.add(a, b);
      expect(res, 16);
      expect(res, isNonZero);
      expect(res, isNonNegative);
    });

    test("testing add function on 2 neg numbers", (){
      int a=-3;
      int b=-10;
      int res = calculator.add(a, b);
      expect(res, isNegative);
      expect(res, -13);
    });
    // test("testing add function on one pos & one neg numbers", (){
    //   Calculator calculator = Calculator();
    //   int a=3;
    //   int b=-10;
    //   int res = calculator.add(a, b);
    //   expect(res, -7);
    // });
  });
}