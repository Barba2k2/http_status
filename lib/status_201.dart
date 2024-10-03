import 'package:dio/dio.dart';

void createData() async {
  var dio = Dio();
  try {
    var response = await dio.post(
      'https://jsonplaceholder.typicode.com/posts',
      data: {
        "title": "Http Status Codes",
        "body": "Este artigo fala um pouco sobre os códigos de status HTTP.",
        "userId": 1
      },
    );
    if (response.statusCode == 201) {
      print('Recurso criado com sucesso!');
      print(response.data); // Exibe os dados criados
    }
  } catch (e) {
    print('Erro ao criar recurso: $e');
  }
}

void main() {
  createData();
}
