import 'package:flutter/material.dart';
import 'package:flutter_estados/models/usuario.dart';

// ChangeNotifier viene con material no con Provider
class UsuarioService with ChangeNotifier {
  Usuario _usuario;

  Usuario get usuario => this._usuario;

  bool get existeUsuario => this._usuario != null ? true : false;

  set usuario(Usuario user) {
    this._usuario = user;
    notifyListeners(); // notificar a los interesados
  }

  void cambiarEdad(int edad) {
    this._usuario.edad = edad;
    notifyListeners();
  }

  void removerUsuario() {
    this._usuario = null;
    notifyListeners();
  }
}
