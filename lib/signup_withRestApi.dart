import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void login(String email, password) async {
  try {
    Response response = await post(Uri.parse('https://reqres.in/api/register'),
        body: {'email': email, 'password': password});
    var data =jsonDecode(response.body.toString());
    print(data); // Here we get the access about Api data
     if (response.statusCode == 200) {
       var data =jsonDecode(response.body.toString());
       print(data);
       print('SuccessFull Login');
    } else {
      print('Login Failed');
    }
  } catch (e) {
    print(e.toString());
  }
}

class signup extends StatefulWidget {
  const signup({super.key});
  @override
  State<signup> createState() => _signupState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Screen Using Post Api'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              )),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(hintText: 'Password'),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              login(emailController.text.toString(),
                  passwordController.text.toString());
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text('Sign Up'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
