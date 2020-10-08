import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height:30.0),
          _cardTipo2(),
          SizedBox(height:30.0),
          _cardTipo1(),
          SizedBox(height:30.0),
          _cardTipo2(),
          SizedBox(height:30.0),
        ]
      ),
    );
  }


  Widget _cardTipo1(){
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.phone_android, color: Colors.blue),
            title: Text('TITULO CARD'),
            subtitle: Text('card description'),
            ),
          Row(
            mainAxisAlignment:MainAxisAlignment.end,
            children: [
              FlatButton(
                onPressed: (){ },
                child: Text('Cancelar'),
              ),
              FlatButton(
                onPressed: (){ },
                child: Text('Ok'),
              )
            ],
          )
        ]
      ),
    );
  }


  Widget _cardTipo2(){


    final card =  Container(
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children:<Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: (200)),
            height: 300.0,
            fit:BoxFit.cover,
            image: NetworkImage('https://artofcreativephotography.com/wp-content/uploads/2019/03/David-Koester-Start-In-Die-Landschaftsfotografie-I.jpg'),
            ),
          /*Image(
            image: NetworkImage('https://artofcreativephotography.com/wp-content/uploads/2019/03/David-Koester-Start-In-Die-Landschaftsfotografie-I.jpg'),
          
          ),*/
          Container(
            child: Text('Texto Prueba'),
            padding: EdgeInsets.all(10.0),
          ),
        ],
      )
    );


    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(0.0, 0.0),
          )
        ],
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child:card,
      ),
    );
  }
}