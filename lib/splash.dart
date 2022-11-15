import 'package:flutter/material.dart';
import 'package:login_page/home.dart';
import 'package:login_page/login.dart';
import 'package:login_page/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  // ignore: must_call_super
  void didChangeDependencies() {}

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: const Image(
            image: AssetImage('Assets/images/img1.jpg'),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => ScreenLogin(),
      ),
    );
  }

  Future<void> checkUserLoggedIn() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final userLoggedIn = sharedPrefs.getBool(SAVE_KEY_NAME);
    if (userLoggedIn == null || userLoggedIn == false) {
      gotoLogin();
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx1) => const ScreenHome(),
        ),
      );
    }
  }
}
