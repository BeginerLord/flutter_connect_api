import 'package:api_to_connet/hooks/Auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final login = useLogin(context);

    return Scaffold(
        appBar: AppBar(title: Text('Login')),
        body: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
            children: [
                TextField(
                    controller: usernameController,
                    decoration: InputDecoration(labelText: 'username'),
                ),
                TextField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,

                )
            ],
        ),
        ),
    );
  }
}
