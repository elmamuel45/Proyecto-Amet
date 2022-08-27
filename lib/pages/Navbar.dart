// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:proyecto_final/main.dart';
import 'package:proyecto_final/pages/Clima.dart';
import 'package:proyecto_final/pages/multa.dart';

import 'TarifarioMultas.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Manuuel Medina y Angel Matos'),
            accountEmail: Text('20198125@itla.edu.do y 20209186@itla.edu.do'),
          ),
          ListTile(
            leading: Icon(Icons.house),
            title: Text('Inicio'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyApp()));
            },
          ),
          ListTile(
            leading: Icon(Icons.fact_check_outlined),
            title: Text('Multas'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => multa()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.assessment_outlined,
            ),
            title: Text('Tarifario'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TarifarioMultas()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.thunderstorm_outlined,
            ),
            title: Text('Clima'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Clima()));
            },
          )
        ],
      ),
    );
  }
}
