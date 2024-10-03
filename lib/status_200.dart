import 'package:dio/dio.dart';

void fetchData() async {
  var dio = Dio();
  try {
    var response = await dio.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      print('Dados recebidos com sucesso!');
      print(response.data); // Exibe os dados recebidos
    }
  } catch (e) {
    print('Erro ao buscar dados: $e');
  }
}

void main() {
  fetchData();
}
