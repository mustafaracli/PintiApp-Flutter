import 'dart:ui';

import 'package:flutter/material.dart';

class sp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amberAccent[400],
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 70)),
            Image.asset(
              "lib/assets/images/ekle.png",
              scale: 1,
            ),
            Text(
              'Harcama eklemek',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'için tıkla',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset(
              "lib/assets/images/ekle+.png",
              width: 250,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Doldur ve Kaydet',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }
}
