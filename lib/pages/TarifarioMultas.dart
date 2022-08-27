// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:proyecto_final/main.dart';
import 'package:proyecto_final/pages/Navbar.dart';

class TarifarioMultas extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  TarifarioMultas({Key? key}) : super(key: key);

  @override
  State<TarifarioMultas> createState() => _TarifarioMultasState();
}

class _TarifarioMultasState extends State<TarifarioMultas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Navbar(),
        appBar: AppBar(
          title: Text('Tarifario'),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: expansion(),
        ));
  }
}

class expansion extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  expansion({Key? key}) : super(key: key);

  @override
  State<expansion> createState() => _expansionState();
}

class _expansionState extends State<expansion> {
  List<Car> cars = [
    Car(1, "No cruzar por los puentes para peatones",
        "Ley 241 art. 101- literal A	1,000.00", false),
    Car(2, "Conducir un vehículo con exceso de pasajero	",
        "Ley 241 art. 104	1,000.00", false),
    Car(3, "Transportar más de dos pasajero en el asiento delantero",
        "Ley 241 art. 105-Literal A	1,000.00", false),
    Car(4, "No tener marbete de revistas autorizadas",
        "Ley 241 art. 110-Literal D	1,000.00", false),
    Car(5, "Transportar bultos que impidan la fácil retrovisión al conductor",
        "Ley 241 art. 120-Literal A	1,000.00", false),
    Car(6, "Cristales Tintados", "Ley 241 art. 120- literal A y 156	1,000.00",
        false),
    Car(
        7,
        "No detener la marcha cuando un vehículo escolar está montando o desmontando pasajero",
        "Ley 241 art. 122	1,000.00",
        false),
    Car(8, "Tirar desperdicios en la vía publica",
        "	Ley 241 art. 130-Literal A	1,000.00", false),
    Car(
        9,
        "Pararse en la calzada para ofrecer ventas de productos de cualquier clase",
        "Ley 241 art. 130-Literal H	1,000.00",
        false),
    Car(
        10,
        "Circular en oposición a las órdenes y señales del agente de transito",
        "Ley 241art. 133-Literal B	1,000.00",
        false),
    Car(11, "Transitar sin Casco", "Ley 241 art. 135-Literal C	1,000.00",
        false),
    Car(12, "Transitar sin marbetes de placas o vencidas",
        "Ley 241 art. 13-Literal A	1,000.00", false),
    Car(13, "Transitar sin marbetes de placas o vencidas",
        "Ley 241 art. 13-Literal A	1,000.00", false),
    Car(14, "Transitar con luces apagadas", "Ley 241 art. 143	1,000.00", false),
    Car(15, "Transitar con las luces altas en calles alumbradas",
        "Ley 241 art. 144-Literal C	1,000.00", false),
    Car(16, "No llevar luz roja en parte posterior",
        "	Ley 241 art. 145	1,000.00", false),
    Car(17, "No tener luces direccionales",
        "Ley 241 art. 146-Literal A	1,000.00", false),
    Car(18, "Transitar en vehículo con guías a la derecha",
        "Ley 114-99 art. 5	1,000.00", false),
    Car(19, "No tener parabrisas", "Ley 241 art. 157	1,000.00", false),
    Car(20, "No espejo retrovisor", "Ley 241 art. 158	1,000.00", false),
  ];
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
        expansionCallback: (panelIndex, isExpand) {
          setState(() {
            cars[panelIndex].isExpanded = !isExpand;
          });
        },
        children: cars.map((car) {
          return ExpansionPanelRadio(
              value: car.id,
              headerBuilder: (bc, status) {
                return Container(
                  child: Container(
                      padding: EdgeInsets.all(10), child: Text(car.titulo)),
                );
              },
              body: Container(
                  color: Colors.grey,
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Text(car.descripcion)));
        }).toList());
  }
}

class Car {
  int id;
  String titulo = "";
  String descripcion = "";
  bool isExpanded;
  Car(this.id, this.titulo, this.descripcion, this.isExpanded);
}
