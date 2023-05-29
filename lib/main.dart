
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meteoproject/accueil.dart';
import 'package:meteoproject/Recherche.dart';
import 'package:meteoproject/infoville.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Steam',
      //home: infoville(),
      //home:Recherche(),
      home:Accueil(),

    );
  }
}