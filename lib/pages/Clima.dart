// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables, unused_local_variable, must_be_immutable, unnecessary_this, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_final/pages/Navbar.dart';
import 'package:http/http.dart' as http;

class Clima extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Clima({Key? key}) : super(key: key);

  @override
  State<Clima> createState() => _ClimaState();
}

class _ClimaState extends State<Clima> {
  var temp;
  var description;
  var currently;
  var humedity;
  var windSpeed;

  Future getWheater() async {
    http.Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=18.451555&lon=-69.945796&appid=e757a1d8c9af2626ec023be1185edc21"));
    var resultados = jsonDecode(response.body);

    setState(() {
      this.temp = resultados['main']['temp'];
      this.description = resultados['weather'][0]['description'];
      this.currently = resultados['weather'][0]['main'];
      this.humedity = resultados['main']['humidity'];
      this.windSpeed = resultados['wind']['speed'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getWheater();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Text('Clima'),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            color: Colors.cyan,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'Clima en Santo Domingo',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  temp != null ? temp.toString() + "\u00B0" : 'Loading',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    currently != null ? currently.toString() : 'Loading',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(20.0),
            child: ListView(
              children: <Widget>[
                ListTile(
                  // ignore: deprecated_member_use
                  leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                  title: Text('Temperatura'),
                  trailing: Text(
                      temp != null ? temp.toString() + "\u00B0" : 'Loading'),
                ),
                ListTile(
                  // ignore: deprecated_member_use
                  leading: FaIcon(FontAwesomeIcons.cloud),
                  title: Text('Clima'),
                  trailing: Text(
                      description != null ? description.toString() : 'Loading'),
                ),
                ListTile(
                  // ignore: deprecated_member_use
                  leading: FaIcon(FontAwesomeIcons.sun),
                  title: Text('Humedad'),
                  trailing:
                      Text(humedity != null ? humedity.toString() : 'Loading'),
                ),
                ListTile(
                  // ignore: deprecated_member_use
                  leading: FaIcon(FontAwesomeIcons.wind),
                  title: Text('velocidad del viento'),
                  trailing: Text(
                      windSpeed != null ? windSpeed.toString() : 'Loading'),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
