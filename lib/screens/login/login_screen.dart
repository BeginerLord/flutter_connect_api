import 'package:api_to_connet/hooks/Auth/login.dart';
import 'package:api_to_connet/widgets/Inputs/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final login = useLogin(context);

    return Scaffold(
      appBar: AppBar(title: Text('Iniciar sesion')),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 100.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 30.0), // Espacio entre los dos TextField
              CustomTextField(
                controller: passwordController,
                labelText: 'contraseña',
                obscureText: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
