import 'package:dio/dio.dart';

void fetchNonExistentData() async {
  var dio = Dio();
  try {
    print('Enviando requisição...');
    // Tentativa de buscar um recurso que não existe
    var response =
        await dio.get('https://jsonplaceholder.typicode.com/nonexistent');

    // Verifica se a resposta é bem-sucedida
    if (response.statusCode == 200) {
      print('Recurso encontrado!');
    } else {
      print('Código de status: ${response.statusCode}');
    }
  } catch (e) {
    if (e is DioException && e.response?.statusCode == 404) {
      print('Erro 404 - Recurso não encontrado: ${e.response?.statusCode}');
    } else {
      print('Erro inesperado: $e');
    }
  }
}

void main() {
  fetchNonExistentData();
}
