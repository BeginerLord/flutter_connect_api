import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  late final Dio scheduleApi;

  Api() {
    _initialize();
  }

  Future<void> _initialize() async {
    await dotenv.load();

    final String baseUrl = dotenv.env['API_URL'] ?? '';
    final String secretKey = dotenv.env['SECRET_KEY'] ?? '';

    scheduleApi = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          'api-key': secretKey,
        },
      ),
    );

    scheduleApi.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Obtener el token directamente de SharedPreferences
          final prefs = await SharedPreferences.getInstance();
          final String? jwt = prefs.getString('jwt');

          if (jwt != null) {
            // Configurar el header de autorización si el token es válido
            options.headers['Authorization'] = 'Bearer $jwt';
          }

          return handler.next(options);
        },
        onError: (DioException error, handler) {
          // Manejo de errores
          return handler.next(error);
        },
      ),
    );
  }
}