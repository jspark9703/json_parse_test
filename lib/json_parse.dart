import 'package:flutter/material.dart';
import 'service.dart';
import 'user.dart';

class JsonParse extends StatefulWidget {
  JsonParse({super.key});

  @override
  State<JsonParse> createState() => _JsonParseState();
}

class _JsonParseState extends State<JsonParse> {
  List<User> _user = <User>[];
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Services.getInfo().then((value) {
      setState(() {
        _user = value;
        loading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(loading ? 'User' : 'Loading..'),
      ),
      body: ListView.builder(
        itemCount: _user.length,
        itemBuilder: ((context, index) {
          User user = _user[index];
          return ListTile(
            leading: const Icon(
              Icons.account_balance_rounded,
              color: Colors.blue,
            ),
            trailing: const Icon(
              Icons.phone_android_outlined,
              color: Colors.red,
            ),
            title: Text(user.id.toString()),
            subtitle: Text(user.title),
          );
        }),
      ),
    );
  }
}
