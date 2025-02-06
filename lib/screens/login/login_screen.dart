import 'package:api_to_connet/api/api.dart';
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
    final api = Api(); // Asegúrate de tener una instancia de Api
    final loginResult = useLogin(api);

    Future<void> handleLogin() async {
    await loginResult.login(usernameController.text, passwordController.text);
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/bgtwo.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 100.0),
              child: Center(
                child: Column(
                  children: [
                    Image.asset("images/logo.png",
                    height: 80.0,
                    ),
                    const SizedBox(height: 25.0,),
                    const Text("Niks's NOTE",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.blueAccent,
                          offset: Offset(-1.5, -1.5)
                        ),
                      ]
                    ),
                    ),
                    const SizedBox(height: 10.0),
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
                        filled: true, // Añadir esta línea
                        fillColor: Colors.white, // Añadir esta línea
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
                    CustomButton(onPressed: handleLogin,
                     text: 'start',
                     isLoading: loginResult.isLoading,
                    ),
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
