import 'package:dio/dio.dart';

void invalidRequest() async {
  var dio = Dio();
  try {
    print('Enviando requisição...');
    // Fazendo a requisição para o endpoint de registro do Reqres
    var response = await dio.post(
      'https://reqres.in/api/register',
      data: {
        // O campo "email" é necessário para a requisição ser bem-sucedida,
        // aqui estamos omitindo para causar o erro 400
        "password": "12345" // Enviando apenas o campo obrigatório "password"
      },
    );

    // Verificando a resposta
    if (response.statusCode == 200) {
      print('Requisição bem-sucedida');
    } else {
      print('Código de status: ${response.statusCode}');
    }
  } catch (e) {
    if (e is DioException && e.response?.statusCode == 400) {
      print('Erro 400 - Requisição inválida: ${e.response?.data}');
    }
  }
}

void main() {
  invalidRequest();
}
