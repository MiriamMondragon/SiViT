import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bienvenido a SiViT',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          primaryTextTheme: TextTheme(
              title: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ))),
      home: Bienvenida(),
    );
  }
}

class Bienvenida extends StatefulWidget {
  @override
  _Bienvenida createState() => new _Bienvenida();
}

class _Bienvenida extends State<Bienvenida> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new MenuInicial()));
          print("Menu Inicial");
    } else {
      prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new PaginaInicio()));
          print("Pagina Inicio");
    }
  }
  @override
  void initState() {
    super.initState();
    new Timer(new Duration(seconds: 5), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue[300], 
        ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Image.asset("assets/SiViT_Logo.png", height: 300, width: 300),
          SizedBox(height: 5),
        ]
      ),
    ));
  }
}

class PaginaInicio extends StatefulWidget {
  @override
  _PaginaInicio createState() => new _PaginaInicio();
}

class MenuInicial extends StatefulWidget {
  @override
  _MenuInicial createState() => new _MenuInicial();
}


class _PaginaInicio extends State<PaginaInicio> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Degradado_Azul.jpg"),
            fit: BoxFit.fill
            )
        ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Bienvenido a SiViT", 
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
          Text(
            "Sistema de Vialidad y Transporte", 
            style: TextStyle(fontSize: 20, color: Colors.white)),
          SizedBox(height: 20),
          Image.asset("assets/SiViT_Logo.png", height: 100, width: 100),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "Aquí podrás tener acceso a información útil sobre tu vehículo, realizar pago de multas, renovación de licencia y mucho más",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
            SizedBox(height: 40),
          ButtonBar(
            buttonPadding: const EdgeInsets.all(15.00),
            mainAxisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Empecemos',
                  style: TextStyle(fontSize: 25, color: Colors.white)),
                color: Colors.orange[300],
                onPressed: () { 
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuInicial())
                );}
              ),
            ]
          )
          ]
        )
      )
    );
  }
}


class _MenuInicial extends State<MenuInicial> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Bienvenido a SiViT'),
          centerTitle: true,
        ),
        drawer: MenuLateral(),
        body: Center(
          child: Text(
            'Hello There',
            style: TextStyle(
              fontSize: 32,
              color: Colors.blue,
            ),
          ),
        ),
      );
  }
}


class MenuLateral extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Drawer(
        child: ListView(
      children: <Widget>[
        new SizedBox(
            height: 80,
            child: Align(
                alignment: Alignment.center,
                child: new UserAccountsDrawerHeader(
                    accountName: Text('Miriam'),
                    accountEmail: Text('PEH-1234')
                )
            )
        ),
      ],
    ));
  }
}
