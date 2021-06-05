import 'package:test/test.dart';
import 'package:to_do/counter.dart';

void main() {
  test('num should be increased', () {
    var counter = Counter();

    counter.increase;

    expect(counter.num, 1);
  });
  test('fran should have correct response', () {
    var response = Peaches();

    response.askForPeach(response.suzy = "");
    expect(response.fran, "can I have a peach?");
  });
}
