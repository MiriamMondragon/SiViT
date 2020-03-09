import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

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
      home: InicioApp(),
    );
  }
}

class InicioApp extends StatefulWidget {
  @override
  _InicioApp createState() => new _InicioApp();
}

class Bienvenida extends StatefulWidget {
  @override
  _Bienvenida createState() => new _Bienvenida();
}

class InicioSesion extends StatefulWidget {
  @override
  _InicioSesion createState() => new _InicioSesion();
}

class MenuInicial extends StatefulWidget {
  @override
  _MenuInicial createState() => new _MenuInicial();
}


class _InicioApp extends State<InicioApp> {
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
          new MaterialPageRoute(builder: (context) => new Bienvenida()));
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


class _Bienvenida extends State<Bienvenida> {
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
                  MaterialPageRoute(builder: (context) => InicioSesion())
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


class _InicioSesion extends State<InicioSesion> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset:  false,
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
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text("Ingresar", 
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.left),
            SizedBox(height: 40),
            new Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
              child: Text('Número de Identidad:                            ', 
              style: TextStyle(fontSize: 20, color: Colors.white), textAlign: TextAlign.left),
            ),
            SizedBox(height: 10),
            new Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextFormField(
                decoration: new InputDecoration(
                  prefixText: '     ',
                  hintText: 'Ejemplo: 0801-1992-12121', hintStyle: TextStyle(fontStyle: FontStyle.italic),
                  filled: true,
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                  )
                ),
                validator: (val) {
                  if(val.length == 0) {
                    return "Su No. Identidad es obligatorio";
                  }else {
                    return "Uwu";
                  }
                },
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontFamily: "Poppins"),
              )
            ),

            SizedBox(height: 20),

            new Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
              child: Text('Número de Licencia:                            ', 
              style: TextStyle(fontSize: 20, color: Colors.white), textAlign: TextAlign.left),
            ),
            SizedBox(height: 10),
            new Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextFormField(
                decoration: new InputDecoration(
                  prefixText: '     ',
                  hintText: 'Ejemplo: 17-325252', hintStyle: TextStyle(fontStyle: FontStyle.italic),
                  filled: true,
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                  )
                ),
                validator: (val) {
                  if(val.length == 0) {
                    return "Su No. Licencia es obligatorio";
                  }else {
                    return "Uwu";
                  }
                },
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontFamily: "Poppins"),
              )
            ),

            SizedBox(height: 20),

            new Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
              child: Text('Placa Vehicular:                            ', 
              style: TextStyle(fontSize: 20, color: Colors.white), textAlign: TextAlign.left),
            ),
            SizedBox(height: 10),
            new Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextFormField(
                decoration: new InputDecoration(
                  prefixText: '     ',
                  hintText: 'Ejemplo: PEH 9457', hintStyle: TextStyle(fontStyle: FontStyle.italic),
                  helperText: 'En caso de no poseer un vehiculo propio puede dejar este campo en blanco', 
                  helperMaxLines: 2,
                  helperStyle: TextStyle(fontSize: 15, color: Colors.white),
                  filled: true,
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                  )
                ),
                validator: (val) {
                  if(val.length == 0) {
                    return "Su placa no es obligatoria";
                  }else {
                    return "Uwu";
                  }
                },
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontFamily: "Poppins"),
              )
            ),

            //SizedBox(height: 20),

            new ButtonBar(
            buttonPadding: const EdgeInsets.all(15.00),
            mainAxisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Ingresar',
                  style: TextStyle(fontSize: 25, color: Colors.white)),
                color: Colors.orange[300],
                onPressed: () { 
                  Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MenuInicial()),
                  (Route<dynamic> route) => false,
                );}
              ),
            ]
          )

          ]
        )
      ),
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
