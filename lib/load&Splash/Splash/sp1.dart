import 'dart:ui';

import 'package:flutter/material.dart';

class sp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amberAccent[400],
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 50)),
              Image.asset(
                "lib/assets/images/ekle.png",
                scale: 1,
              ),
              Text(
                'Harcama eklemek',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'için tıkla',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Image.asset(
                "lib/assets/images/ekle+.png",
                width: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Doldur ve Kaydet',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ));
  }
}
