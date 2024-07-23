import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Model/PostsModel.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

List<PostsModel> postslist = [];
Future<List<PostsModel>> getPostApi() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  var data = jsonDecode(response.body.toString()); // Simple Decode
  if (response.statusCode == 200) {
    postslist.clear();
    for (Map i in data) {
      postslist.add(PostsModel.fromJson(i));
    }
    return postslist; // Iterating each element in data
  } else {
    return postslist;
  }
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Tutorial 1'),
      ),
      body: Column(
        children: [
          // To get Data From Api
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text('Loading !!');
                } else {
                  return ListView.builder(
                    itemCount: postslist.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text(postslist[index].title.toString())],
                        ),
                      ); // here we get the data from Api
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
