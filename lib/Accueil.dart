import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meteoproject/Recherche.dart';
import 'package:meteoproject/Infoville.dart';

class Accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mes Villes',
      home: MyHomePage(),
      routes: {
        '/recherche': (context) => Recherche(),
        '/infoville': (context) => Infoville(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mes Villes',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, '/recherche');
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          children: [
            buildRectangle(context, 'Paris, France', '20°', 'Ensoleillé',
                'images/sunlight.svg'),
            SizedBox(height: 10),
            buildRectangle(context, 'Berlin, Allemagne', '15°', 'Pluie',
                'images/rain-drops-3.svg'),
            SizedBox(height: 10),
            buildRectangle(context, 'Amsterdam, Pays-Bas', '20°', 'Ensoleillé',
                'images/sunlight.svg'),
          ],
        ),
      ),
    );
  }

  Widget buildRectangle(BuildContext context, String city, String temperature,
      String description, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/infoville');
      },
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    city,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    temperature,
                    style: TextStyle(fontSize: 36, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            SvgPicture.asset(
              imagePath,
              width: 50,
              height: 50,
              color: Colors.deepPurpleAccent,
            ),
          ],
        ),
      ),
    );
  }
}
