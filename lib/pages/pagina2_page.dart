import 'package:flutter/material.dart';
import 'package:flutter_estados/models/usuario.dart';
import 'package:flutter_estados/services/usuario_service.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer Usuario',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                final usuarioService = Provider.of<UsuarioService>(context,
                    //listen: true // aunque este por true, al estar dentro
                    // del metodo no podra redibujarse al no tener un metodo
                    // rebuild por lo cual dara error, por lo cual la
                    // recomendacion es set listen a false
                    listen: false);
                final newUser = new Usuario(nombre: 'Carlos', edad: 39);
                usuarioService.usuario = newUser;
              },
            ),
            MaterialButton(
              child:
                  Text('Cambiar edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                final usuarioService = Provider.of<UsuarioService>(
                  context,listen: false
                );
                if (usuarioService.existeUsuario) {
                  usuarioService.cambiarEdad(45);
                }
              },
            ),
            MaterialButton(
              child: Text('Añadir Profesion',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
