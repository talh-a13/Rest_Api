import 'dart:convert';

import 'package:api_tutorial_1/three.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class four extends StatefulWidget {
  const four({super.key});

  @override
  State<four> createState() => _fourState();
}

class _fourState extends State<four> {
  var data;
  Future<void> getApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutorial 4! '),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getApi(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            reuseableRow(
                              title: 'Name : ',
                              value: data[index]['name'].toString(),
                            ),
                            reuseableRow(
                                title: 'UserName :',
                                value: data[index]['username'].toString()),
                            reuseableRow(
                                title: 'Address :',
                                value: data[index]['address']['street']
                                    .toString()),
                            reuseableRow(
                                title: 'Latitude :',
                                value: data[index]['address']['geo']['lat']
                                    .toString())
                          ],
                        ),
                      );
                    });
              }
            },
          ))
        ],
      ),
    );
  }
}

class reuseableRow extends StatelessWidget {
  reuseableRow({super.key, required this.value, required this.title});
  String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [Text(title), Text(value)],
    );
  }
}
