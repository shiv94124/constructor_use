import 'package:flutter/material.dart';
import 'package:constructor_use/callingConstructor.dart';
import 'package:http/http.dart' as http;
import 'json.dart';

class Tiles extends StatefulWidget {
  @override
  _TilesState createState() => _TilesState();
}

class _TilesState extends State<Tiles> {
  List<User> httpData;
  bool waiting = true;
  @override
  void initState() {
    super.initState();
    getHttpData();
  }

  getHttpData() async {
    http.Response response =
        await http.get('https://jsonplaceholder.typicode.com/users');
    if (response.statusCode == 200) {
      final user = userFromJson(response.body);
      httpData = user;
      setState(() {
        waiting = false;
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  ConstList list = ConstList();

  @override
  Widget build(BuildContext context) {
    getHttpData();
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: (waiting)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: (httpData != null) ? 10 : 1,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    leading:
                        Icon(Icons.people_alt_rounded, color: Colors.white),
                    title: Text(
                      httpData[index].name,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(httpData[index].email,
                        style: TextStyle(color: Colors.white)),
                    tileColor: Colors.blueAccent,
                    hoverColor: Colors.lightBlueAccent,
                  );
                }),
        appBar: AppBar(
            title: Center(
                child: Text(
          "List Of Users",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.blue,
          ),
        ))));
  }
}
