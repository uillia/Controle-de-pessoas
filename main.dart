import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "contador de pessoas", 
  home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoas = 0;
  String infoText = "Pode entrar!!";
  
  void _changepessoas(int n) {
    setState(() { //informa a mudança no widget 
      _pessoas += n;

      if(_pessoas<0){
        infoText="Opção invalida";
        _pessoas= 0;
      }
      else{
        infoText = "Pode entrar!!";
        if(_pessoas>=10){
          infoText = "Lotado!!!";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(//coloa um widget de fundo (nesse caso a imagem)
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "pessoas: $_pessoas ",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    onPressed: () {
                      _changepessoas(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    onPressed: () {
                      _changepessoas(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(
              "$infoText ",
              style:
                  TextStyle(
                    color: Colors.white,
                    fontSize: 30, 
                    fontStyle: FontStyle.italic),
            )
          ],
        )
      ],
    );
  }
}
