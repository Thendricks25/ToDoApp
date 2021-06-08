import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';
import 'package:to_do/counter.dart';

void main() {
  test('gets stored values', () async {
    SharedPreferences.setMockInitialValues({'deviceID': 'UniqueID'});
    SharedPreferences pref = await SharedPreferences.getInstance();
    String uniqueid = "1234";
    pref.setString('deviceID', uniqueid);
    expect(pref.getString('deviceID'), "1234");
  });
}
