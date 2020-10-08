import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        )
      )
    );
  }

  Widget _crearSlider() {


    return Slider(
      activeColor: Colors.orangeAccent,
      label: 'Tamaño de la imagen',
      //divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged:(_bloquearCheck) ? null: (valor){
        _valorSlider = valor;
        setState(() {
          
        });
      },
      
    );
  }

  Widget _crearImagen() {


    return Image(
      image: NetworkImage('https://www.cheats.co/blog/wp-content/uploads/2013/11/10-AmlR440.jpg'),
      width: _valorSlider,
      fit:BoxFit.contain,
    );
  }

  Widget _checkBox() {

    /*return Checkbox(
      value: _bloquearCheck,
      onChanged: (valor){
        _bloquearCheck = valor;
        setState(() {
          
        });
      },
    );*/

    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _bloquearCheck,
      onChanged: (valor){
        _bloquearCheck = valor;
        setState(() {
          
        });
      },

    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear slider'),
      value: _bloquearCheck,
      onChanged: (valor){
        _bloquearCheck = valor;
        setState(() {
          
        });
      },

    );
  }
}