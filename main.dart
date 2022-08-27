// ignore_for_file: deprecated_member_use, prefer_const_constructors, duplicate_ignore, camel_case_types, unused_import, prefer_const_literals_to_create_immutables, dead_code

// ignore: avoid_web_libraries_in_flutter, unused_import

import 'package:proyecto_final/login/home.dart';
import 'package:proyecto_final/login/register-login.dart';
import 'package:proyecto_final/login/widgetree.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/pages/Navbar.dart';
import 'package:proyecto_final/pages/multa.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //firebase Initial
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCcmOFINaC-3HZkQtnwYnHFuJq3COPMTR4",
      appId: "XXX",
      messagingSenderId: "XXX",
      projectId: "proyectofinal-f0dbf",
    ),
  );
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(brightness: Brightness.light, primaryColor: Colors.green),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: duplicate_ignore
    return Scaffold(
      drawer: Navbar(),
      // ignore: prefer_const_constructors
      appBar: AppBar(
        title: Text('Inicio'),
        backgroundColor: Colors.green,
      ),
      body: Card(
        elevation: 5,
        shadowColor: Colors.black,
        color: Colors.greenAccent[100],
        child: SizedBox(
            width: 470,
            height: 900,
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  Image(
                    image: NetworkImage(
                        "https://3.bp.blogspot.com/--ZezS2L698Q/WEBMET1deeI/AAAAAAADLtQ/OKEPiDLoxeQgcMMf4FuElJUmYrF6nSUUwCLcB/s1600/3000milamets.jpg"),
                    width: 400, //NetworkIm
                  ),
                  SizedBox(
                    child: Card(
                        color: Colors.white,
                        child: SizedBox(
                          width: 300,
                          height: 25,
                          child: Center(
                              child: Text(
                            'Los amets se tiran a las calles',
                            style: TextStyle(fontSize: 20),
                          )),
                        )),
                  ),
                  SizedBox(
                      width: 470,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Image(
                              image: NetworkImage(
                                  "https://i0.wp.com/ensegundos.do/wp-content/uploads/2013/03/Amet.jpg?resize=577%2C375&ssl=1"),
                              width: 400, //NetworkIm
                            ),
                            SizedBox(
                              child: Card(
                                  color: Colors.white,
                                  child: SizedBox(
                                    width: 400,
                                    height: 25,
                                    child: Center(
                                        child: Text(
                                      'Medidas de concientización para peatones',
                                      style: TextStyle(fontSize: 20),
                                    )),
                                  )),
                            ),
                            SizedBox(
                                width: 470,
                                height: 100,
                                child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(children: [
                                      Image(
                                        image: NetworkImage(
                                            "https://eldia.com.do/wp-content/uploads/2014/05/10_Nacionales_28_2p01.jpg"),
                                        width: 420, //NetworkIm
                                      ),
                                      SizedBox(
                                        child: Card(
                                            color: Colors.white,
                                            child: SizedBox(
                                              width: 400,
                                              height: 25,
                                              child: Center(
                                                  child: Text(
                                                'Matan Oficial',
                                                style: TextStyle(fontSize: 20),
                                              )),
                                            )),
                                      )
                                    ])))
                          ],
                        ),
                      )),
                ]))),
      ),
    );
  }
}
