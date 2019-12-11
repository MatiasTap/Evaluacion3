import 'package:flutter/material.dart';
import 'package:onehand/paginas/menu_venta.dart';
import 'package:onehand/paginas/menu_tarifa.dart';
import './page.dart';

class MenuPagina extends StatefulWidget {
  static Route<dynamic> route(String mensaje) {
    return MaterialPageRoute(
      builder: (context) => MenuPagina(mensaje: mensaje),
    );
  }

  final String mensaje;

  const MenuPagina({Key key, @required this.mensaje}) : super(key: key);

  @override
  _MenuPagina createState() => new _MenuPagina();
}

class _MenuPagina extends State<MenuPagina> {
  String currentProfilePic = "assets/onehand.png";
  String otherProfilePic = "assets/fondo.png";

  void switchAccounts() {
    String picBackup = currentProfilePic;
    this.setState(() {
      currentProfilePic = otherProfilePic;
      otherProfilePic = picBackup;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Menu Principal"),
          backgroundColor: Colors.orangeAccent,
        ),
        //pantalla desplegable
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountEmail: new Text("mtapiar5@alumnos.ceduc.cl"),
                accountName: new Text("Matias Tapia"),
                currentAccountPicture: new GestureDetector(
                  child: new CircleAvatar(
                    backgroundImage: new AssetImage(currentProfilePic),
                  ),
                  onTap: () => print("Cambio cuenta"),
                ),
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new AssetImage("assets/fondo.jpg"),
                        fit: BoxFit.fill)),
              ),
              //Seleccion de pestañas
              new ListTile(
                  title: new Text("Tarifas"),
                  trailing: new Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuTarifa()),
                    );
                  }),
              new ListTile(
                  title: new Text("Ventas"),
                  trailing: new Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuVentas()),
                    );
                  }),
              new Divider(),
              new ListTile(
                title: new Text("Salir"),
                trailing: new Icon(Icons.cancel),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
        //pantalla principal MAPA
        body: new Principal());
  }
}

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 25,
          child: Container(
            child: RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              color: Colors.redAccent,
              child: Column(
                children: <Widget>[
                  Text(
                    "Ventas",
                    style: TextStyle(fontSize: 50),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.attach_money,
                        size: 50,
                      ),
                      Text(
                        "152.562",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuTarifa()),
                     );
              },
            ),
            // decoration: BoxDecoration(
            //   shape: BoxShape.circle,
            //   color: Colors.blue,
            // ),
            padding: EdgeInsets.all(40.0),
            margin: EdgeInsets.all(10.0),
          ),
        ),
        Positioned(
          top: 250,
          child: Container(
            child: RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              color: Colors.blue,
              child: Column(
                children: <Widget>[
                  Text(
                    "Atenciones",
                    style: TextStyle(fontSize: 50),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.attach_money,
                        size: 50,
                      ),
                      Text(
                        "73.659",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuVentas()),
                     );
              },
            ),
            // decoration: BoxDecoration(
            //   shape: BoxShape.circle,
            //   color: Colors.blue,
            // ),
            padding: EdgeInsets.all(75.0),
          ),
        ),
      ],
    );
  }

  // final
}
