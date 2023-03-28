import 'package:flutter/material.dart';
import 'package:demoapp/sub/FrostedGlass.dart';
import 'package:demoapp/sub/DropDown.dart';
import 'package:demoapp/sub/Temperature.dart';
import 'package:demoapp/sub/Humidity.dart';
import 'package:demoapp/mainscreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  get myScrollController => null;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  //margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 1.0),
                  width: double.infinity,
                  height: height * 0.15,
                  color: Colors.grey[300],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(25, 60, 25, 0.2),
                        width: width * 0.36,
                        height: height * 0.05,
                        //color: Colors.grey[300],

                        child: Center(child: DropdownButtonApp()),
                      ),
                      Container(
                        height: height * 0.1,
                        width: width * 0.36,
                        color: Colors.grey[300],
                        margin: const EdgeInsets.fromLTRB(25, 12, 25, 0),
                        padding: const EdgeInsets.fromLTRB(60.0, 0.2, 0.0, 0.2),
                        child: const Image(
                          image: AssetImage('images/cloud.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                  height: height * 0.55,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(25, 0.2, 0, 0.2),
                        width: width * 0.36,
                        height: height * 0.42,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1, 1),
                                blurRadius: 15,
                                //spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4, -4),
                                blurRadius: 15,
                                spreadRadius: 1,
                              ),
                            ]),
                        child: const Center(
                            child: TemperatureGraph(
                          theChild: null,
                          theHeight: null,
                          theWidth: null,
                        )),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(25.0, 0.2, 25, 0.2),
                        width: width * 0.36,
                        height: height * 0.42,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1, 1),
                                blurRadius: 15,
                                //spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4, -4),
                                blurRadius: 15,
                                spreadRadius: 1,
                              ),
                            ]),
                        child: const Center(
                            child: HumidityGraph(
                          theChild: null,
                          theHeight: null,
                          theWidth: null,
                        )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.3,
              minChildSize: 0.3,
              maxChildSize: 0.8,
              builder: (BuildContext context, myScrollController) {
                return ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(60.0)),
                  child: Container(
                    color: Colors.white.withOpacity(0.9),
                    child: ListView(
                      controller: myScrollController,
                      children: [
                        Container(
                          height: height * 0.12,
                          color: Colors.white10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(15.0, 50, 15, 0),
                                width: 130.0,
                                height: height * 0.03,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(4),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(1, 1),
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                      ),
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(-4, -4),
                                        blurRadius: 15,
                                        spreadRadius: 1,
                                      ),
                                    ]),
                                child: const Center(
                                  child: Text(
                                    'STATUS SHEET',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      height: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(5.0, 50, 25, 0),
                                width: 150.0,
                                height: height * 0.03,
                                child: const Center(
                                  child: Text(
                                    '',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 20,
                                      height: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: height * 0.08,
                          color: Colors.white10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(15.0, 20, 15, 0),
                                width: 150.0,
                                height: height * 0.03,
                                child: const Center(
                                  child: Text(
                                    'Mister',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 20,
                                      height: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(5.0, 20, 25, 0),
                                width: 150.0,
                                height: height * 0.03,
                                child: const Center(
                                  child: Text(
                                    'Pump',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Montserrat',
                                      fontSize: 20,
                                      height: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: height * 0.2,
                          width: width,
                          color: Colors.white10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // ignore: prefer_const_constructors
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(15.0, 0, 15, 0.2),
                                width: 150.0,
                                height: 150.0,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 151, 206, 89),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(1, 1),
                                        blurRadius: 15,
                                        //spreadRadius: 1,
                                      ),
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(-4, -4),
                                        blurRadius: 15,
                                        spreadRadius: 1,
                                      ),
                                    ]),
                                child: Container(
                                  margin: const EdgeInsets.all(20),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('images/sprinkler.png'),
                                      //fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(5.0, 0, 25, 0.2),
                                width: 150.0,
                                height: 150.0,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(1, 1),
                                        blurRadius: 10,
                                        //spreadRadius: 1,
                                      ),
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(-4, -4),
                                        blurRadius: 15,
                                        spreadRadius: 1,
                                      ),
                                    ]),
                                child: Container(
                                  margin: const EdgeInsets.all(20),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('images/motor.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: const FrostedGlassBox(
                                    theChild: null,
                                    theHeight: null,
                                    theWidth: null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: height * 0.08,
                          color: Colors.white10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(15.0, 20, 15, 0),
                                width: 150.0,
                                height: height * 0.03,
                                child: const Center(
                                  child: Text(
                                    'Cooler',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 20,
                                      height: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(5.0, 20, 25, 0),
                                width: 150.0,
                                height: height * 0.03,
                                child: const Center(
                                  child: Text(
                                    'Exhaust',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Montserrat',
                                      fontSize: 20,
                                      height: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: height * 0.2,
                          width: width,
                          color: Colors.white10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // ignore: prefer_const_constructors
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(15.0, 0, 15, 0.2),
                                width: 150.0,
                                height: 150.0,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 151, 206, 89),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(1, 1),
                                        blurRadius: 15,
                                        //spreadRadius: 1,
                                      ),
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(-4, -4),
                                        blurRadius: 15,
                                        spreadRadius: 1,
                                      ),
                                    ]),
                                child: Container(
                                  margin: const EdgeInsets.all(20),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'images/air-conditioner.png'),
                                      //fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(5.0, 0, 25, 0.2),
                                width: 150.0,
                                height: 150.0,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(1, 1),
                                        blurRadius: 10,
                                        //spreadRadius: 1,
                                      ),
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(-4, -4),
                                        blurRadius: 15,
                                        spreadRadius: 1,
                                      ),
                                    ]),
                                child: Container(
                                  margin: const EdgeInsets.all(20),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('images/fan.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: const FrostedGlassBox(
                                    theChild: null,
                                    theHeight: null,
                                    theWidth: null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 500,
                          color: Colors.lightBlue,
                          child: Center(child: MainScreen()),
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
