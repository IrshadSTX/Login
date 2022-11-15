import 'package:flutter/material.dart';
import 'package:login_page/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Chat'),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
              onPressed: () {
                signout(context);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
          child: ListView.separated(
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text('PERSON ${index + 1}'),
                  subtitle: Text('Message ${index + 6}'),
                  leading: (index % 2 == 0)
                      ? const CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage('Assets/images/avatar1.jpg'),
                        )
                      : ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 44,
                            minHeight: 44,
                            maxWidth: 64,
                            maxHeight: 64,
                          ),
                          child: Image.asset('Assets/images/avatar2.jpg'),
                        ),
                  trailing: Text('${index + 2} min ago'),
                );
              },
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: 20)),
    );
  }
}

signout(BuildContext ctx) async {
  final sharedPrefs = await SharedPreferences.getInstance();
  await sharedPrefs.clear();
  // ignore: use_build_context_synchronously
  Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx1) => ScreenLogin()), (route) => false);
}
