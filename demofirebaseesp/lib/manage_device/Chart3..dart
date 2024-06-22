import 'package:appthuan/pages/Read.dart';
import 'package:appthuan/manage_device/ct2.dart';
import 'package:flutter/material.dart';
//import 'package:syncfusion_flutter_charts/charts.dart';
//import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:flutter_charts/flutter_charts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fl_chart/fl_chart.dart';

import 'ct.dart';
import 'ct3.dart';
//import 'package:fl_line_chart_example/widget/line_titles.dart';
//import 'package:charts_flutter/flutter.dart' as charts;

class Chart3 extends StatefulWidget {
  //const Chart1({super.key});
  const Chart3({Key? key}) : super(key: key);
  @override
  State<Chart3> createState() => _ChartScreenState1();
}

class _ChartScreenState1 extends State<Chart3> {
  final ref = FirebaseDatabase.instance.ref('myapp');
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA3;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 130,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Color.fromARGB(255, 255, 255, 255),
              border: Border.all(
              color: Color.fromARGB(255, 0, 0, 0), // Màu đường viền
              width: 2.0, // Độ dày đường viền
            ),
              boxShadow: [
                BoxShadow(color: Color.fromARGB(255, 255, 255, 255).withAlpha(100), blurRadius: 10.0),
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
                      post["Component"],
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      post["Quantity"],
                      style: const TextStyle(fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      post["Price"],
                      style: const TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 0, 0, 0),
                          ),
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
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "GATE WIFI",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 24, 132, 199),
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
                opacity: closeTopContainer ? 0 : 1,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer ? 0 : categoryHeight,
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
                            transform: Matrix4.identity()..scale(scale, scale),
                            alignment: Alignment.bottomCenter,
                            child: Align(
                                heightFactor: 0.9,
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
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;
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
                width: 500,
                margin: EdgeInsets.only(right: 20),
                height: 360,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  border: Border.all(
                    color: Color.fromARGB(255, 255, 255, 255), // Màu viền
                    width: 5.0,)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  
                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     
                    children: <Widget>[
                       Image.asset('assets/images/3d.png'),
                        SizedBox(
                        height: 10,
                      ),
                      Center(
                      child: Text(
                        "IMAGE 3D",
                        style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 4, 4, 4),
                            fontWeight: FontWeight.bold),
                      ),)
                    ],
                  ),
                ),
              ),
              Container(
                width: 500,
                margin: EdgeInsets.only(right: 20),
                height: 360,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  border: Border.all(
                    color: Color.fromARGB(255, 255, 255, 255), // Màu viền
                    width: 5.0, // Độ dày viền
                  ),
                ),
                    
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset('assets/images/real1.jpg'),
                         SizedBox(
                          height: 10,
                        ),
                        Center(
                        child: Text(
                          "ACTUAL IMAGE",
                          style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold),
                        ),)
                       
                        
                      ],
                    ),
                  ),
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
