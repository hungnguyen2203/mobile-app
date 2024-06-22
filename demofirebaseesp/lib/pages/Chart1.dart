import 'package:appthuan/pages/Read.dart';
import 'package:flutter/material.dart';
//import 'package:syncfusion_flutter_charts/charts.dart';
//import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:flutter_charts/flutter_charts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fl_chart/fl_chart.dart';

import '../manage_device/Chart2.dart';
import '../manage_device/Chart3..dart';
import '../manage_device/Chart4.dart';
import '../manage_device/ct.dart';

// import 'Chart2.dart';
// import 'Chart3..dart';
// import 'Chart4.dart';
// import 'ct.dart';
//import 'package:fl_line_chart_example/widget/line_titles.dart';
//import 'package:charts_flutter/flutter.dart' as charts;

class Chart1 extends StatefulWidget {
  //const Chart1({super.key});
  const Chart1({Key? key}) : super(key: key);
  @override
  State<Chart1> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<Chart1> {
  final ref = FirebaseDatabase.instance.ref('myapp');
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Color.fromARGB(255, 255, 255, 255), boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
          ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["Device"],
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      post["Status"],
                      style: const TextStyle(fontSize: 17, color: Color.fromARGB(255, 230, 29, 29),fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      post["Name"],
                      style: const TextStyle(fontSize: 17, color: Color.fromARGB(255, 143, 137, 137)),
                    )
                  ],
                ),
                Image.asset(
                  "assets/images/${post["image"]}",
                 // height: double.infinity,
                  fit: BoxFit.contain,
                )
              ],
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {

      double value = controller.offset/119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height*0.30;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "MANAGEMENT",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 6, 132, 178),
          // leading: Icon(
          //   Icons.menu,
          //   color: Colors.black,
          // ),
          actions: <Widget>[
            // IconButton(
            //   icon: Icon(Icons.search, color: Color.fromARGB(255, 153, 68, 68)),
            //   onPressed: () {},
            // ),
            // IconButton(
            //   icon: Icon(Icons.person, color: Colors.black),
            //   onPressed: () {},
            // )
          ],
        ),
        body: Container(
          height: size.height,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // Text(
                  //   "Loyality Cards",
                  //   style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
                  // ),
                  // Text(
                  //   "Menu",
                  //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                  // ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: closeTopContainer?0:1,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer?0:categoryHeight,
                    child: categoriesScroller),
              ),
              Expanded(
                  child: ListView.builder(
                    controller: controller,
                      itemCount: itemsData.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        double scale = 1.0;
                        if (topContainer > 0.5) {
                          scale = index + 0.5 - topContainer;
                          if (scale < 0) {
                            scale = 0;
                          } else if (scale > 1) {
                            scale = 1;
                          }
                        }
                        return Opacity(
                          opacity: scale,
                          child: Transform(
                            transform:  Matrix4.identity()..scale(scale,scale),
                           alignment: Alignment.bottomCenter,
                            child: Align(
                                heightFactor: 0.8,
                                alignment: Alignment.topCenter,
                                child: itemsData[index]),
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.orange.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0)),
                border: Border.all(
                    color: Color.fromARGB(255, 196, 97, 10), // Màu viền
                    width: 5.0,)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "NODE",
                        style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "3 devices",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                     Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Chart2()),
                                  );
                                },
                                child: Icon(
                                  Icons.device_thermostat,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  size: 80,
                                ),
                              ),
                            ),
                       
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.blue.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0)),
                border: Border.all(
                    color: Color.fromARGB(255, 1, 73, 198), // Màu viền
                    width: 5.0,)),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "GATE WIFI",
                          style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "2 gate",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                         Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Chart3()),
                                  );
                                },
                                child: Icon(
                                  Icons.wifi,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  size: 80,
                                ),
                              ),
                            ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Color.fromARGB(255, 14, 149, 77), borderRadius: BorderRadius.all(Radius.circular(20.0)),
                border: Border.all(
                    color: Color.fromARGB(255, 6, 125, 36), // Màu viền
                    width: 5.0,)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "GATE 4G",
                        style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "1 gate",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ), 
                       Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Chart4()),
                                  );
                                },
                                child: Icon(
                                  Icons.four_g_mobiledata,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  size: 80,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }}

