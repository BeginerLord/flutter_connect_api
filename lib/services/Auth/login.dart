import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:api_to_connet/api/api.dart';

// Define la clase LoginService
class LoginService {
  final Api api;

  // Constructor que inicializa la instancia de Api
  LoginService(this.api);

  // Método asíncrono para iniciar sesión
  Future<Map<String, dynamic>> login(String username, String password) async {
    // Realiza una solicitud POST a la ruta '/login' con los datos de usuario y contraseña
    final response = await api.scheduleApi.post('/login', data: {
      'username': username,
      'password': password,
    });

    // Obtiene los datos de la respuesta
    final data = response.data;
    final String jwt = data['jwt'];

    // Almacena el JWT en SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt', jwt);

    // Decodifica el JWT para obtener las autoridades
    final authorities = JwtDecoder.decode(jwt)['authorities'];

    // Retorna los datos de la respuesta junto con las autoridades
    return {
      ...data,
      'authorities': authorities,
    };
  }
}