import 'dart:ui';

import 'package:expences/homepage.dart';

import 'package:flutter/material.dart';

class sp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amberAccent[400],
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 120)),
            Image.asset(
              "lib/assets/images/delete.png",
              scale: 1,
            ),
            Text(
              'İstediğin harcamayı silemek için sola çekmen yeterli',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            TextButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => homepage())),
              child: Text(
                "Hadi Başlayalım",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.amber,
                    fontWeight: FontWeight.w700,
                    backgroundColor: Colors.black),
              ),
            )
          ],
        ));
  }
}
