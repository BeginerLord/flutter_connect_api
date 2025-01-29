import 'package:flutter_hooks/flutter_hooks.dart'; // Importa el paquete flutter_hooks para usar hooks en Flutter
import 'package:flutter/material.dart'; // Importa el paquete flutter/material.dart para usar widgets de Flutter
import 'package:api_to_connet/services/Auth/login.dart'; // Importa el servicio de login
import 'package:api_to_connet/api/api.dart'; // Importa la clase Api

// Define la clase UseLogin que contiene la función de login y un indicador de estado
class UseLogin {
  final Function login; // Función de login
  final bool isPending; // Indicador de si la operación de login está en curso

  // Constructor que inicializa los campos login e isPending
  UseLogin({required this.login, required this.isPending});
}

// Hook personalizado useLogin que maneja el proceso de login
UseLogin useLogin(BuildContext context) {
  final api = Api(); // Crea una instancia de la clase Api
  final loginService = LoginService(api); // Crea una instancia de LoginService con la instancia de Api
  final isPending = useState(false); // Estado para indicar si la operación de login está en curso

  // Función de login que toma el nombre de usuario y la contraseña
  Future<void> login(String username, String password) async {
    isPending.value = true; // Establece isPending a true para indicar que la operación está en curso
    try {
      final data = await loginService.login(username, password); // Llama al servicio de login y obtiene los datos
      final authorities = data['authorities']; // Obtiene las autoridades del usuario desde los datos
      final path = authorities == "ROLE_ADMIN" // Determina la ruta de navegación basada en las autoridades del usuario
          ? "/home"
          : authorities == "ROLE_STUDENT"
              ? "/horario-estudiante"
              : authorities == "ROLE_TEACHER"
                  ? "/horario-docente"
                  : "/";

      Navigator.pushNamed(context, path); // Navega a la ruta determinada
    } finally {
      isPending.value = false; // Establece isPending a false para indicar que la operación ha terminado
    }
  }

  // Retorna una instancia de UseLogin con la función de login y el estado isPending
  return UseLogin(login: login, isPending: isPending.value);
}