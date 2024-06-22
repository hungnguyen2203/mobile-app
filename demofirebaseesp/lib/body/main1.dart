//import 'package:appthuan/Writedata.dart';
import 'package:appthuan/pages/Chart1.dart';
import 'package:appthuan/pages/ReadData.dart';
//import 'package:appthuan/Readdata.dart';
import 'package:appthuan/pages/Read.dart';
import 'package:appthuan/pages/home1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// import 'home1.dart';
// import 'Read.dart';
//============================================================mới ==============================================================
import 'package:flutter/material.dart';
import 'package:appthuan/body/drawer_item.dart';
import 'package:appthuan/pages/people.dart';

import 'naviigation_drawer.dart';
//=======================================================================================cũ mà hay=============================================
class main1 extends StatefulWidget {
  const main1({Key? key}) : super(key: key);
 
  @override
  State<main1> createState() => _Main1();
}
 




class _Main1 extends State<main1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 6, 132, 178),
      ),
      body: Builder(
        builder: (context) {
          return Center(
            child: Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/iot.jpg'), // Đường dẫn tới tệp ảnh nền
        fit: BoxFit.cover, // Cách ảnh được căn chỉnh trong container
      ),
    ),
   
            // child: SizedBox(
            //   height: 50,
            //   width: MediaQuery.of(context).size.width - 100,
            //   child: ElevatedButton.icon(
            //     style: ElevatedButton.styleFrom(
            //       primary: Color.fromARGB(255, 252, 252, 252),
            //     ),
            //     onPressed: () {
            //       Scaffold.of(context).openDrawer();
            //     },
            //     icon: const Icon(Icons.open_in_new, color: Colors.white),
            //     label: const Text(
            //       'Open Navigation Drawer',
            //       style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            //     ),
            //   ),
            // ),
            )
          );
        }
      )
    );
  }
}
