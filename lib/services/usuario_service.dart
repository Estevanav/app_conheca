import 'package:app_conheca/entities/usuario.dart';
import 'package:app_conheca/repositories/usuario_api_repository.dart';
import 'package:flutter/material.dart';

class UsuarioService extends ChangeNotifier {
  UsuarioAPIRepository? _repository;

  List<Usuario> usuarios = [];

  UsuarioService() {
    _repository = new UsuarioAPIRepository();
    this.read();
  }

  void read() {
    _repository!.read().then((value) {
      usuarios = value;
      notifyListeners();
    });
  }

  void create(Usuario entity) {
    _repository!.create(entity).then((_) {
      usuarios.add(entity);
      notifyListeners();
    });
  }

  // Revisar os parametros que são alterados
  void update(int id, String value) {
    var entity = usuarios.firstWhere((element) => element.id == id);
    //entity.nome = value;
    _repository!.update(id, entity).then((_) {
      notifyListeners();
    });
  }

  void delete(Usuario entity) {
    _repository!.delete(entity).then((_) {
      usuarios.remove(entity);
      notifyListeners();
    });
  }
}
