import 'dart:convert';
import 'package:bytebank2/http/web_cliente.dart';
import 'package:bytebank2/models/transaction.dart';
import 'package:http/http.dart' as http;

class TransactionWebClient {
  // Retorna todas as transações
  Future<List<Transaction>> findAll() async {
    final http.Response response =
        await client.get(baseUrl).timeout(Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    // Transforma o Map em uma String JSON
    final String transactionJson = jsonEncode(transaction.toJson());

    // POST para criação de uma transação
    final http.Response response = await client.post(baseUrl,
        headers: {
          'Content-type': 'application/json',
          'password': password,
        },
        body: transactionJson);

    return Transaction.fromJson(jsonDecode(response.body));
  }
}
