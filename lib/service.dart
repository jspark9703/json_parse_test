import "package:http/http.dart" as http;
import "package:json_parse_test/user.dart";
import 'package:fluttertoast/fluttertoast.dart';

class Services {
  static const String url =
      'https://jsonplaceholder.typicode.com/users/1/posts';

  static Future<List<User>> getInfo() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1/posts'));
      print(response);
      if (response.statusCode == 200) {
        final List<User> user = userFromJson(response.body);
        return user;
      } else {
        Fluttertoast.showToast(msg: 'Error');
        return <User>[];
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return <User>[];
    }
  }
}
