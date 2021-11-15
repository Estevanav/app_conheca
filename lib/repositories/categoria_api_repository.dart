import 'dart:convert';
import 'dart:async';
import 'package:app_conheca/entities/categoria.dart';
import 'package:http/http.dart' as http;

class CategoriaAPIRepository {
  final String url = 'https://conheca-api.herokuapp.com/categoria';

  Future<List<Categoria>> read() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var json = response.body;

      var dados = jsonDecode(json);
      //print(dados["\$values"]);

      List<Categoria> lista = [];

      for (var json in dados["\$values"]) {
        Categoria c = Categoria.fromJson(json);
        lista.add(c);
      }
      return lista;
    }
    return [];
  }

  Future<void> create(Categoria entity) async {
    await http.post(Uri.parse(url),
        headers: {"content-type": "application/json"},
        body: jsonEncode(entity.toJson()));
  }

  Future<void> update(int id, Categoria entity) async {
    await http.put(Uri.parse("$url/$id"),
        headers: {"content-type": "application/json"},
        body: jsonEncode(entity.toJson()));
  }

  Future<void> delete(Categoria entity) async {
    await http.delete(Uri.parse("$url/${entity.id}"));
  }
}
