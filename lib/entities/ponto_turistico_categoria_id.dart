import 'package:app_conheca/entities/categoria.dart';
import 'package:app_conheca/entities/ponto_turistico.dart';

class PontoTuristicoCategoriaId {
  int? pontoTuristicoId;
  int? categoriaId;

  PontoTuristicoCategoriaId({pontoTuristicoId, categoriaId}) {
    this.pontoTuristicoId = PontoTuristico().id;
    this.categoriaId = Categoria().id;
  }
}
