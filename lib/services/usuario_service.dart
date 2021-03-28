import 'dart:async';

import 'package:flutter_estados/models/usuario.dart';

class _UsuarioService {
  Usuario _usuario;
  StreamController<Usuario> _usuarioStremController = new StreamController<
      Usuario>.broadcast(); // para habilitar multiple listeners

  Usuario get usuario => this._usuario;
  bool get existeUsuario => (this._usuario != null) ? true : false;

  Stream<Usuario> get usuarioStream => _usuarioStremController.stream;

  void cargarUsuario(Usuario user) {
    this._usuario = user;
    this._usuarioStremController.add(user);
  }

  void cambiarEdad(int edad) {
    this._usuario.edad = edad;
    this._usuarioStremController.add(this._usuario);
  }

  dispose() {
    this._usuarioStremController?.close();
  }
}

final usuarioService = new _UsuarioService();
