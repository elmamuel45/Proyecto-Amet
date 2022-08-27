// ignore_for_file: prefer_const_constructors, duplicate_ignore, non_constant_identifier_names, deprecated_member_use, avoid_print, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:alert/alert.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_final/main.dart';
import 'package:proyecto_final/pages/Navbar.dart';

// ignore: camel_case_types
class multa extends StatefulWidget {
  const multa({Key? key}) : super(key: key);
  // ignore: library_private_types_in_public_api, annotate_overrides
  _multaState createState() => _multaState();
}

// ignore: camel_case_types
class _multaState extends State<multa> {
  // ignore: non_constant_identifier_names
  String MultaTelefono = "";
  // ignore: non_constant_identifier_names
  String MultaNombre = "";
  // ignore: non_constant_identifier_names
  String MultaCedula = "";
  String MultaFecha = "";
  String MultaPlaca = "";
  String MultaMotivo = "";
  String MultaHora = "";

//modales
  // ignore: unused_element
  void ModalBuscarMulta() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(16.0)),
                  TextFormField(
                      maxLength: 7,
                      decoration: InputDecoration(
                        labelText: "MultaPlaca",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                      ),
                      onChanged: (String MultaPlaca) {
                        getMultaPlaca(MultaPlaca);
                      }),
                  RaisedButton(
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0)),
                      // ignore: sort_child_properties_last
                      child: Text('Buscar'),
                      textColor: Colors.white,
                      onPressed: () {
                        DocumentReference documentReference = FirebaseFirestore
                            .instance
                            .collection("dtMultas")
                            .doc(MultaPlaca);
                        // ignore: avoid_print
                        documentReference.get().then(
                          (datasnapshot) {
                            // ignore: avoid_print
                            print(datasnapshot.get("MultaNombre"));
                            print(datasnapshot.get("MultaCedula"));
                            print(datasnapshot.get("MultaPlaca"));
                            print(datasnapshot.get("MultaFecha"));
                            print(datasnapshot.get("MultaMotivo"));

                            final String MultaNombreB =
                                datasnapshot.get([MultaNombre]);
                            return ListTile(
                              onTap: () {},
                              title: Text('dwdw'),
                            );
                          },
                        );
                      })
                ],
              ),
            ));
  }

  void Modal_VerMultas() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(16.0)),
                  Row(children: <Widget>[
                    Expanded(
                      child: Text(
                        'Nomre',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Cedula',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Placa',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Motivo',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ]),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("dtMultas")
                        .snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot documentSnapshot =
                                snapshot.data.docs[index];
                            return Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(documentSnapshot["MultaNombre"]),
                                ),
                                Expanded(
                                  child: Text(documentSnapshot["MultaCedula"]),
                                ),
                                Expanded(
                                  child: Text(documentSnapshot["MultaPlaca"]),
                                ),
                                Expanded(
                                  child: Text(documentSnapshot["MultaMotivo"]),
                                )
                              ],
                            );
                          },
                        );
                      }
                      return (Text(''));
                    },
                  ),
                ],
              ),
            ));
  }

  void ModalEliminarMulta() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(16.0)),
                  TextFormField(
                      maxLength: 7,
                      decoration: InputDecoration(
                        labelText: "MultaPlaca",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                      ),
                      onChanged: (String MultaPlaca) {
                        getMultaPlaca(MultaPlaca);
                      }),
                  RaisedButton(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)),
                    // ignore: sort_child_properties_last
                    child: Text('Eliminar'),
                    textColor: Colors.white,
                    onPressed: () {
                      EliminarMulta();
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MyApp()));
                      Alert(message: 'Multa Eliminada').show();
                    },
                  ),
                ],
              ),
            ));
  }

  getMultaPlaca(placa) {
    // ignore: unnecessary_this
    this.MultaPlaca = placa;
  }

  getMultaMotivo(motivo) {
    // ignore: unnecessary_this
    this.MultaMotivo = motivo;
  }

  getMultaHora(hora) {
    // ignore: unnecessary_this
    this.MultaHora = hora;
  }

  getMultaFecha(fecha) {
    // ignore: unnecessary_this
    this.MultaFecha = fecha;
  }

  getMultaNombre(nombre) {
    // ignore: unnecessary_this
    this.MultaNombre = nombre;
  }

  getMultaMultaCedula(MultaCedula) {
    // ignore: unnecessary_this
    this.MultaCedula = MultaCedula;
  }

  getMultaTelefono(telefono) {
    // ignore: unnecessary_this
    this.MultaTelefono = telefono;
  }

  //Metodo Agregar
  AgregarMulta() {
    // ignore: avoid_print
    print("Agregado");
    // ignore: unused_local_variable
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("dtMultas").doc(MultaPlaca);

    //creando mapa
    // ignore: unused_local_variable
    Map<String, dynamic> Multas = {
      "MultaNombre": MultaNombre,
      "MultaCedula": MultaCedula,
      "MultaTelefono": MultaTelefono,
      "MultaPlaca": MultaPlaca,
      "MultaMotivo": MultaMotivo,
      "MultaHora": MultaHora,
      "MultaFecha": MultaFecha,
    };

    documentReference.set(Multas).whenComplete(() {});
  }

  BuscarMulta() {
    // ignore: avoid_print, unused_local_variable
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("dtMultas").doc(MultaPlaca);
    // ignore: avoid_print
    print("Buscar");
    documentReference.get().then((datasnapshot) {
      // ignore: avoid_print
      print(datasnapshot.get("MultaNombre"));
      print(datasnapshot.get("MultaCedula"));
      print(datasnapshot.get("MultaPlaca"));
      print(datasnapshot.get("MultaFecha"));
      print(datasnapshot.get("MultaMotivo"));
      return Row(
        children: <Widget>[
          Expanded(
            child: Text(datasnapshot.get("MultaCedula")),
          )
        ],
      );
    });
  }

  ActualizarMulta() {
    // ignore: avoid_print
    print("Actualizado");
    // ignore: avoid_print
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("dtMultas").doc(MultaPlaca);

    //creando mapa
    // ignore: unused_local_variable
    Map<String, dynamic> Multas = {
      "MultaNombre": MultaNombre,
      "MultaCedula": MultaCedula,
      "MultaTelefono": MultaTelefono,
      "MultaPlaca": MultaPlaca,
      "MultaMotivo": MultaMotivo,
      "MultaHora": MultaHora,
      "MultaFecha": MultaFecha,
    };

    documentReference.set(Multas).whenComplete(() {});
  }

  EliminarMulta() {
    // ignore: avoid_print
    print("Eliminado");
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("dtMultas").doc(MultaPlaca);
    documentReference.delete().whenComplete(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Navbar(),
        // ignore: duplicate_ignore, duplicate_ignore
        appBar: AppBar(
          backgroundColor: Colors.green,
          // ignore: prefer_const_constructors
          title: Text("imponer Multa"),
        ),
        body: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(16.0)),
            //TexField
            TextFormField(
                maxLength: 100,
                decoration: InputDecoration(
                  labelText: "MultaNombre",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                onChanged: (String MultaNombre) {
                  getMultaNombre(MultaNombre);
                }),
            TextFormField(
                maxLength: 11,
                decoration: InputDecoration(
                  labelText: "MultaCedula",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                onChanged: (String MultaCedula) {
                  getMultaMultaCedula(MultaCedula);
                }),
            Padding(padding: EdgeInsets.only(bottom: 8.0)),
            TextFormField(
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: "MultaTelefono",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                onChanged: (String MultaTelefono) {
                  getMultaTelefono(MultaTelefono);
                }),
            TextFormField(
                maxLength: 7,
                decoration: InputDecoration(
                  labelText: "MultaPlaca",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                onChanged: (String MultaPlaca) {
                  getMultaPlaca(MultaPlaca);
                }),
            TextFormField(
                maxLength: 100,
                decoration: InputDecoration(
                  labelText: "MultaMotivo",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                onChanged: (String MultaMotivo) {
                  getMultaMotivo(MultaMotivo);
                }),
            TextFormField(
                maxLength: 100,
                decoration: InputDecoration(
                  labelText: "MultaHora",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                onChanged: (String MultaHora) {
                  getMultaHora(MultaHora);
                }),
            TextFormField(
                maxLength: 100,
                decoration: InputDecoration(
                  labelText: "MultaFecha",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                onChanged: (String MultaFecha) {
                  getMultaFecha(MultaFecha);
                }),

            Row(
              //Botones
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: deprecated_member_use
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  // ignore: sort_child_properties_last
                  child: Text('Agregar'),
                  textColor: Colors.white,
                  onPressed: () {
                    AgregarMulta();
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => multa()));

                    Alert(message: 'Multa Agregada').show();
                  },
                ),
                RaisedButton(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  // ignore: sort_child_properties_last
                  child: Text('Actualizar'),
                  textColor: Colors.white,
                  onPressed: () {
                    ActualizarMulta();
                  },
                ),
                RaisedButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  // ignore: sort_child_properties_last
                  child: Text('Eliminar'),
                  textColor: Colors.white,
                  onPressed: () {
                    ModalEliminarMulta();
                  },
                ),
                RaisedButton(
                  color: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  // ignore: sort_child_properties_last
                  child: Text('Buscar'),
                  textColor: Colors.white,
                  onPressed: () {
                    ModalBuscarMulta();
                    /*BuscarMulta();*/
                  },
                ),
                RaisedButton(
                  color: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  // ignore: sort_child_properties_last
                  child: Text('Ver Multas'),
                  textColor: Colors.white,
                  onPressed: () {
                    Modal_VerMultas();
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
