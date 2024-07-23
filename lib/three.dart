import 'dart:convert';

import 'package:api_tutorial_1/homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Model/UserModel.dart';

class three extends StatelessWidget {
  const three({super.key});

  @override
  Widget build(BuildContext context) {
    List<UserModel> userList = [];
    Future<List<UserModel>> getUserApi() async {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        for (Map i in data) {
          userList.add(UserModel.fromJson(i));
        }
        return userList;
      } else {
        throw Exception('Faild to load Data');
      }
    }

    ;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api tutorial'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getUserApi(),
            builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ReuseableRow(
                                    title: 'Name :',
                                    value:
                                        snapshot.data![index].name.toString()),
                                ReuseableRow(
                                    title: '   Address :',
                                    value: snapshot.data![index].address!.city
                                        .toString())
                              ],
                            )
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

class ReuseableRow extends StatelessWidget {
  ReuseableRow({super.key, required this.title, required this.value});
  String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [Text(title), Text(value)],
    );
  }
}
