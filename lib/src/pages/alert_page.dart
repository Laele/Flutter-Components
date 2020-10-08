import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Alert Button'),
          color: Colors.red,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlert(context),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: Icon(Icons.add_location),
        ),
      
    );
  }
}


void _mostrarAlert(BuildContext context){

  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context){
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: Text('Titulo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Este es el contenido de la caja de la alerta'),
            FlutterLogo(size: 100.0),
          ],
        ),
        actions: <Widget>[
          FlatButton(onPressed: () => Navigator.of(context).pop(), child: Text('Back')),
          FlatButton(onPressed: (){ }, child: Text('Ok')),
        ]
      );
    }
  );
}