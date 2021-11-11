import 'package:app_conheca/entities/categoria.dart';
import 'package:app_conheca/repositories/categoria_api_repository.dart';
import 'package:flutter/material.dart';

class CategoriaService extends ChangeNotifier {
  CategoriaAPIRepository? _repository;

  List<Categoria> categorias = [];

  CategoriaService() {
    _repository = new CategoriaAPIRepository();
    this.read();
  }

  void read() {
    _repository!.read().then((value) {
      categorias = value;
      notifyListeners();
    });
  }

  void create(Categoria entity) {
    _repository!.create(entity).then((_) {
      categorias.add(entity);
      notifyListeners();
    });
  }

  void update(int id, String value) {
    var entity = categorias.firstWhere((element) => element.id == id);
    entity.tipo = value;
    _repository!.update(id, entity).then((_) {
      notifyListeners();
    });
  }

  void delete(Categoria entity) {
    _repository!.delete(entity).then((_) {
      categorias.remove(entity);
      notifyListeners();
    });
  }
}