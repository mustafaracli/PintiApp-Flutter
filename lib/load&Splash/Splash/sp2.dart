import 'dart:ui';

import 'package:flutter/material.dart';

class sp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amberAccent[400],
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 70)),
            Image.asset(
              "lib/assets/images/graph.png",
              scale: 1.2,
            ),
            Text(
              'Hangi gün ne kadar harcama yaptığını öğrenmek için üstüne tıkla',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset(
              "lib/assets/images/toplam.png",
              width: 250,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Toplam harcamanı buradan görebilirsin",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }
}
