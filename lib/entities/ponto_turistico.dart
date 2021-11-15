import 'package:app_conheca/entities/ponto_turistico_categoria.dart';
import 'package:app_conheca/entities/usuario.dart';

class PontoTuristico {
  int? id;
  String? nome;
  String? descricao;
  double? latitude;
  double? longitude;
  String? data;
  Usuario? usuario;
  List<PontoTuristicoCategoria>? categorias;

  PontoTuristico(
      {id,
      nome,
      descricao,
      latitude,
      longitude,
      data,
      usuario,
      endereco,
      categorias}) {
    this.id = id;
    this.nome = nome;
    this.descricao = descricao;
    this.latitude = latitude;
    this.longitude = longitude;
    this.data = data;
    this.usuario = usuario;
    this.categorias = categorias;
  }

  factory PontoTuristico.fromJson(Map<String, dynamic> json) {
    return PontoTuristico(
      id: json['id'],
      nome: json['nome'],
      descricao: json['descricao'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      data: json['data'],
      usuario: json['usuario'],
      categorias: json['categorias'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nome": nome,
      "descricao": descricao,
      "latitude": latitude,
      "longitude": longitude,
      "data": data,
      "usuario": usuario,
      "categorias": categorias,
    };
  }
}
