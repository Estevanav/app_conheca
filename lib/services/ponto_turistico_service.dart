import 'package:app_conheca/entities/ponto_turistico.dart';
import 'package:app_conheca/repositories/ponto_turistico_api_repository.dart';
import 'package:flutter/material.dart';

class PontoTuristicoService extends ChangeNotifier {
  PontoTuristicoAPIRepository? _repository;

  List<PontoTuristico> pontosTuristicos = [];

  PontoTuristicoService() {
    _repository = new PontoTuristicoAPIRepository();
    this.read();
  }

  void read() {
    _repository!.read().then((value) {
      pontosTuristicos = value;
      notifyListeners();
    });
  }

  void create(PontoTuristico entity) {
    _repository!.create(entity).then((_) {
      pontosTuristicos.add(entity);
      notifyListeners();
    });
  }

  // Revisar os parametros que são alterados
  void update(int id, String value) {
    var entity = pontosTuristicos.firstWhere((element) => element.id == id);
    //entity.nome = value;
    _repository!.update(id, entity).then((_) {
      notifyListeners();
    });
  }

  void delete(PontoTuristico entity) {
    _repository!.delete(entity).then((_) {
      pontosTuristicos.remove(entity);
      notifyListeners();
    });
  }
}
