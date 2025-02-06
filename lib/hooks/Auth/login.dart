import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:api_to_connet/services/Auth/login.dart';
import 'package:api_to_connet/api/api.dart';

class UseLoginResult {
  final Future<Map<String, dynamic>> Function(String username, String password) login;
  final bool isLoading;

  UseLoginResult({required this.login, required this.isLoading});
}

UseLoginResult useLogin(Api api) {
  final loginService = useMemoized(() => LoginService(api));
  final isLoading = useState(false);

  Future<Map<String, dynamic>> login(String username, String password) async {
    isLoading.value = true;
    try {
      final result = await loginService.login(username, password);
      // Aquí puedes invalidar las queries o realizar otras acciones en caso de éxito
      return result;
    } finally {
      isLoading.value = false;
    }
  }

  return UseLoginResult(login: login, isLoading: isLoading.value);
}