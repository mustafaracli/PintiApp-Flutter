import 'package:expences/homepage.dart';
import 'package:expences/load&Splash/Splash/sp1.dart';
import 'package:expences/load&Splash/Splash/sp2.dart';
import 'package:expences/load&Splash/Splash/sp3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class spController extends StatefulWidget {
  const spController({super.key});

  @override
  State<spController> createState() => _spControllerState();
}

class _spControllerState extends State<spController> {
  PageController _controller = PageController();

  bool lastpage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                lastpage = (index == 2);
              });
            },
            children: [
              sp1(),
              sp2(),
              sp3(),
            ]),
        Container(
            alignment: Alignment(0, 0.80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text(
                    'Skip',
                  ),
                ),
                SmoothPageIndicator(controller: _controller, count: 3),
                lastpage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return homepage();
                              },
                            ),
                          );
                        },
                        child: Text('Başla'),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text('İleri'),
                      ),
              ],
            ))
      ],
    ));
  }
}
