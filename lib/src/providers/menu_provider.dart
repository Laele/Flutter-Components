import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';


class _MenuProvider{


  List<dynamic> opciones = [];


  _MenuProvider(){
    cargarData();
  }

  Future cargarData() async {

    final resp = await rootBundle.loadString('data/menu_opts.json');

    Map dataMap = json.decode(resp);
    //print(dataMap['nombreApp']);
    opciones = dataMap['rutas'];

    return opciones;
  }
}

final menuProvider = new _MenuProvider();