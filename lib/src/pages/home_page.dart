import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title:  Text('Components'),
        ),

        body: _lista(),
      );
  }

  Widget _lista() {


    //print(menuProvider.opciones);
    /*menuProvider.cargarData().then((opciones){
      print('_lista');
      print(opciones);      
    });*/

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot){

        //print('builder');
        //print(snapshot.data);
        return ListView(
          children:_listaItems(snapshot.data,context),
        );
      },
    );


    /*return ListView(
      children: _listaItems(),
    );*/
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {


  final List<Widget> opciones = [];


  data.forEach((opt){
    
    final widgetTemp = ListTile(
      title: Text(opt['texto']),
      leading: getIcon(opt['icon']),
      trailing: Icon(Icons.ac_unit, color: Colors.blue),
      onTap:(){

        Navigator.pushNamed(context, opt['ruta']);
        /*final route = MaterialPageRoute(
          builder: (context) => AlertPage()
          
        );
        Navigator.push(context, route);*/

      },
    );

    opciones..add(widgetTemp)
            ..add(Divider());
  
  
  });

  return opciones;


    /*return[
      ListTile(title: Text('Hola Mundo!')),
      Divider(),
      ListTile(title: Text('Hola Mundo!')),
      Divider(),
      ListTile(title: Text('Hola Mundo!')),
      Divider(),
    ];*/
  }
}