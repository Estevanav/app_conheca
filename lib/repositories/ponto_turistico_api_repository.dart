import 'dart:convert';
import 'dart:async';
import 'package:app_conheca/entities/ponto_turistico.dart';
import 'package:http/http.dart' as http;

class PontoTuristicoAPIRepository {
  final String url = 'https://conheca-api.herokuapp.com/pontoturistico';

  Future<List<PontoTuristico>> read() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var json = response.body;

      var dados = jsonDecode(json);
      //print(dados["\$values"]);

      List<PontoTuristico> lista = [];

      for (var json in dados["\$values"]) {
        PontoTuristico p = PontoTuristico.fromJson(json);
        lista.add(p);
      }
      return lista;
    }
    return [];
  }

  Future<void> create(PontoTuristico entity) async {
    print(jsonEncode(entity.toJson()));
    await http.post(Uri.parse(url),
        headers: {"content-type": "application/json"},
        body: jsonEncode(entity.toJson()));
  }

  Future<void> update(int id, PontoTuristico entity) async {
    await http.put(Uri.parse("$url/$id"),
        headers: {"content-type": "application/json"},
        body: jsonEncode(entity.toJson()));
  }

  Future<void> delete(PontoTuristico entity) async {
    await http.delete(Uri.parse("$url/${entity.id}"));
  }
}
