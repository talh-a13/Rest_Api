import 'dart:convert';

import 'package:api_tutorial_1/Model/PostsModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class complex extends StatelessWidget {
  const complex({super.key});

  @override
  Widget build(BuildContext context) {
    var data;
    Future<PostsModel> getapi() async {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return PostsModel.fromJson(data);
      } else {
        return PostsModel.fromJson(data);
      }
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Building Complex JSONS',
      )),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<PostsModel>(
            future: getapi(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, builder) {
                      Text('we can call our api accordingly'
                          '');
                    });
              } else {
                return CircularProgressIndicator();
              }
            },
          ))
        ],
      ),
    );
  }
}
