import 'package:app_conheca/entities/categoria.dart';
import 'package:app_conheca/entities/endereco.dart';
import 'package:app_conheca/entities/usuario.dart';

class PontoTuristico {
  int? id;
  String? nome;
  String? descricao;
  double? latitude;
  double? longitude;
  DateTime? data;
  Usuario? usuario;
  Endereco? endereco;
  List<Categoria>? categorias;

  PontoTuristico(
      {id, nome, descricao, latitude, longitude, data, usuario, categorias}) {
        endereco = Endereco();
      }
}
