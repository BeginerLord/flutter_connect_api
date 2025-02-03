import 'package:api_to_connet/hooks/Auth/login.dart';
import 'package:api_to_connet/widgets/Inputs/custom_text_field.dart';
import 'package:api_to_connet/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final login = useLogin(context);

    void handleLogin() {
      login.login(usernameController.text, passwordController.text);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar sesion')),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 100.0),
              child: Center(
                child: Column(
                  children: [
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: const TextStyle(color: Colors.blueGrey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(
                        height: 30.0), // Espacio entre los dos TextField
                    CustomTextField(
                      controller: passwordController,
                      labelText: 'contraseña',
                      obscureText: true,
                    ),
                    const SizedBox(height: 30.0),
                    CustomButton(onPressed: handleLogin, text: 'start'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
