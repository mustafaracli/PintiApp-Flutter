import 'package:expences/homepage.dart';
import 'package:expences/load&Splash/splashControl.dart';
import 'package:flutter/material.dart';

class loadSc extends StatefulWidget {
  const loadSc({super.key});

  @override
  State<loadSc> createState() => _loadScState();
}

class _loadScState extends State<loadSc> {
  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(
        Duration(
          seconds: 3,
        ), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => spController()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amberAccent[400],
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 300,
              ),
              Image.asset(
                "lib/assets/images/logo.png",
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 150,
              ),
              Image.asset(
                "lib/assets/images/pinti.png",
                width: 150,
                height: 150,
              ),
            ],
          ),
        ));
  }
}
