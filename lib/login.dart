// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:login_page/home.dart';
import 'package:login_page/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final String uname = 'irshad';
  final String pword = '12345';
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isDataMatched = true;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'User Name',
                    ),
                    validator: (value) {
                      // if (_isDataMatched) {
                      //   return null;
                      // } else {
                      //   return 'Error';
                      // }
                      if (value == null || value.isEmpty) {
                        return 'Value is Empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                  validator: (value) {
                    //
                    if (value == null || value.isEmpty) {
                      return 'Value is Empty';
                    } else {
                      return null;
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: !_isDataMatched,
                        // ignore: prefer_const_constructors
                        child: Text(
                          'username or Password is incorrect!',
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            checkLogin(context);
                          } else {
                            print('Data is empty');
                          }

                          // checkLogin(context);
                        },
                        icon: const Icon(Icons.check),
                        label: const Text('Login'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  void checkLogin(BuildContext ctx) async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username == uname && password == pword) {
      final sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setBool(SAVE_KEY_NAME, true);
      // ignore: use_build_context_synchronously
      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(
          // ignore: prefer_const_constructors
          builder: (ctx1) => ScreenHome(),
        ),
      );
    } else {
      setState(() {
        _isDataMatched = false;
      });
    }
  }
}
