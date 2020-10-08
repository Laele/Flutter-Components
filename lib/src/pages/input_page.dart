import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';

  String _opcionSeleccionada = "Volar";

  List<String> _poderes = ['Volar','Rayos X', 'Super Fuerza','Super Aliento'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 2.0),
        children: <Widget>[
          Divider(),
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
          Divider(),
        ]
      ),
      
    );
  }

  _crearInput() {


    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: _wordsCounter(),
        hintText: 'Nombre Personal',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),

      onChanged: (valor){
        _nombre = valor;
        setState(() {
          
        });

      },     
    );
  }

  Widget _crearPersona() {
    return Column(
      children: [
        ListTile(
          title: Text('Nombe es: $_nombre'),
          subtitle:  Text('Email: $_email'),
          trailing: Text(_opcionSeleccionada),
        ),
        ListTile(
          title: Text('Contraseña: $_password'),
        ),
      ],
    );
  }

 Text _wordsCounter() {
    if(_nombre == ''){
      return Text('Letras 0');
    }else{
      return Text('Letras: ${_nombre.length}');
    }
    //return Text('hola');
  }

  Widget _crearEmail() {

    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Email Personal',
        labelText: 'Email',
        helperText: 'Tu cuenta de email :)',
        suffixIcon: Icon(Icons.email),
        icon: Icon(Icons.airplay),
      ),

      onChanged: (valor){
        _email = valor;
        setState(() {
          
        });

      },     
    );
  }

  Widget _crearPassword() {

    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Contraseña',
        labelText: 'Aqui va tu contraseña o:',
        helperText: 'contra',
        suffixIcon: Icon(Icons.vpn_key),
        icon: Icon(Icons.airplay),
      ),

      onChanged: (valor){
        _password = valor;
        setState(() {
          
        });

      },     
    );
  }

  Widget _crearFecha(BuildContext context) {

    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'tu cumple :3 o:',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },     
    );
  }

  void _selectDate(BuildContext contex) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es','ES'),
    );

    if(picked != null){

      _fecha = picked.toString();
      _inputFieldDateController.text = _fecha;
      setState(() {
        
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown(){

    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;

  }

  Widget _crearDropdown() {

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 7.0),
        Expanded(
            child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt){
              _opcionSeleccionada = opt;
                setState(() {
                  
                });
            }
          ),
        ),
      ],
    );
  }

}