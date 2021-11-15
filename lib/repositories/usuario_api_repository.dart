import 'dart:convert';
import 'dart:async';
import 'package:app_conheca/entities/usuario.dart';
import 'package:http/http.dart' as http;

class UsuarioAPIRepository {
  final String url = 'https://conheca-api.herokuapp.com/usuario';

  Future<List<Usuario>> read() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var json = response.body;

      var dados = jsonDecode(json);

      List<Usuario> lista = [];

      for (var json in dados["\$values"]) {
        Usuario u = Usuario.fromJson(json);
        lista.add(u);
      }
      return lista;
    }
    return [];
  }

  Future<void> create(Usuario entity) async {
    await http.post(Uri.parse(url),
        headers: {"content-type": "application/json"},
        body: jsonEncode(entity.toJson()));
  }

  Future<void> update(int id, Usuario entity) async {
    await http.put(Uri.parse("$url/$id"),
        headers: {"content-type": "application/json"},
        body: jsonEncode(entity.toJson()));
  }

  Future<void> delete(Usuario entity) async {
    await http.delete(Uri.parse("$url/${entity.id}"));
  }
}
