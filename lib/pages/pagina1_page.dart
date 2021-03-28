import 'package:flutter/material.dart';
import 'package:flutter_estados/models/usuario.dart';
import 'package:flutter_estados/services/usuario_service.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream ,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot){
          return snapshot.hasData
          //usuarioService.existeUsuario
          // se puede usar usuarioService.usuario o snapshot.data ya que es la misma data
          //? InformacionUsuario(usuarioService.usuario)
          ? InformacionUsuario(snapshot.data)
          : Center(child: Text('No hay información del usuario'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(title: Text('Profesion 1:')),
          ListTile(title: Text('Profesion 1:')),
          ListTile(title: Text('Profesion 1:')),
        ],
      ),
    );
  }
}
