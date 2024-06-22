//import 'package:appthuan/Writedata.dart';
import 'package:appthuan/pages/Chart1.dart';
import 'package:appthuan/pages/ReadData.dart';
//import 'package:appthuan/Readdata.dart';
import 'package:appthuan/pages/Read.dart';
import 'package:appthuan/body/naviigation_drawer.dart';
import 'package:appthuan/pages/home1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home1.dart';
import 'Read.dart';
//============================================================mới ==============================================================
import 'package:flutter/material.dart';
import 'package:appthuan/body/drawer_item.dart';
import 'package:appthuan/pages/people.dart';

//import 'naviigation_drawer.dart';
//=======================================================================================cũ mà hay=============================================
class home1 extends StatefulWidget {
  const home1({Key? key}) : super(key: key);
 
  @override
  State<home1> createState() => _home1();
}
 




class _home1 extends State<home1> {
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


























// import 'package:appthuan/dbHelper/mongodb.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:flutter/material.dart';
// //import 'insert_data.dart';

// class home1 extends StatefulWidget {
//   const home1({Key? key}) : super(key: key);

//   @override
//   State<home1> createState() => _home1State();
// }

// class _home1State extends State<home1> {
//    @override

//    Widget build(BuildContext context) {
//   //   final fb = FirebaseDatabase.instance;
//   //   final ref = fb.ref().child('hengio');
//   //   var l;
//   //   var g;
//   //   var x4;

//      return Scaffold(
//      // body: const SafeArea(child: null,
//     //     child: FutureBuilder(
//     //       future: MongoDatabase.getData(),
//     //       builder: (context, AsyncSnapshot snapshot) {
//     //         if (snapshot.connectionState == ConnectionState.waiting){
//     //           return Center(child: CircularProgressIndicator(),);
//     //         } else {
//     //           if (snapshot.hasData){
//     //             var totalData = snapshot.data.length;
//     //             //print("total data + , toString");
//     //             return ListView.builder(
//     //               itemCount: snapshot.data.length ,
//     //               itemBuilder: (context, index){
                    
//     //             },);
//     //           } else {
//     //             return Center(child: Text("no data available"),);
//     //           }
//     //         }
//     //       }
//     //     )
//     //   ),

//      // ),
//     // widget displayCard(MongoDbModel data)



//   //     floatingActionButton: FloatingActionButton(
//   //       backgroundColor: Color.fromARGB(230, 28, 66, 122),
//   //       onPressed: () {
//   //         Navigator.pushReplacement(
//   //           context,
//   //           MaterialPageRoute(
//   //             builder: (_) => InsertData(),
//   //           ),
//   //         );
//   //       },
//   //       child: Icon(
//   //         Icons.add,
//   //       ),
//   //     ),
//   //     appBar: AppBar(
//   //       title: Text(
//   //         '',
//   //         style: TextStyle(
//   //           fontSize: 30,
//   //         ),
//   //       ),
//   //       backgroundColor: Color.fromARGB(230, 28, 66, 122),
//   //     ),
//   //     body: FirebaseAnimatedList(
//   //       query: ref,
//   //       shrinkWrap: true,
//   //       itemBuilder: (context, snapshot, animation, index) {
//   //         var v =
//   //             snapshot.value.toString(); // {subtitle: webfun, title: subscribe}

//   //         g = v.replaceAll(
//   //             // webfun, subscribe
//   //             RegExp(r'[\{\}]'),
//   //             '');
//   //         g.trim();

//   //         l = g.split(','); // [webfun,  subscribe}]

//   //         return GestureDetector(
//   //           onTap: () {
//   //             var c = snapshot.value.toString();
//   //             print(c);
//   //           },
//   //           child: Container(
//   //             child: Padding(
//   //                 padding: const EdgeInsets.all(8.0),
//   //                 child: ListTile(
//   //                   shape: RoundedRectangleBorder(
//   //                     side: BorderSide(color: Color.fromARGB(248, 0, 0, 0)),
//   //                     borderRadius: BorderRadius.circular(80),
//   //                   ),
//   //                   tileColor: Color.fromARGB(255, 250, 252, 252),
//   //                   leading: CircleAvatar(
//   //                     backgroundColor: Color.fromARGB(255, 6, 101, 34),
//   //                     child: Icon(
//   //                       Icons.light_mode_outlined,
//   //                     ),
//   //                   ),
//   //                   trailing: IconButton(
//   //                     icon: Icon(
//   //                       Icons.delete,
//   //                       color: Colors.red[900],
//   //                     ),
//   //                     onPressed: () {
//   //                       ref.child(snapshot.key!).remove();
//   //                     },
//   //                   ),
//   //                   title: Column(
//   //                       crossAxisAlignment: CrossAxisAlignment.start,
//   //                       children: [
//   //                         Text(
//   //                           l[2],
//   //                           // 'dd',
//   //                           style: TextStyle(
//   //                             fontSize: 25,
//   //                             fontWeight: FontWeight.bold,
//   //                             color: Color.fromARGB(255, 188, 188, 180),
//   //                           ),
//   //                         ),
//   //                         Text(
//   //                           l[3],
//   //                           // 'dd',
//   //                           style: TextStyle(
//   //                             fontSize: 25,
//   //                             fontWeight: FontWeight.bold,
//   //                             color: Color.fromARGB(255, 6, 6, 6),
//   //                           ),
//   //                         ),
//   //                         Text(
//   //                           l[1],
//   //                           // 'dd',
//   //                           style: TextStyle(
//   //                             fontSize: 25,
//   //                             fontWeight: FontWeight.bold,
//   //                             color: Color.fromARGB(255, 188, 188, 180),
//   //                           ),
//   //                         ),
//   //                         Text(
//   //                           l[0],
//   //                           // 'dd',
//   //                           style: TextStyle(
//   //                             fontSize: 25,
//   //                             fontWeight: FontWeight.bold,
//   //                             color: Color.fromARGB(255, 6, 6, 6),
//   //                           ),
//   //                         ),
//   //                       ]),
//   //                 )),
//   //           ),
//   //         );
//   //       },
//   //     ),
//      );
//    }
// }
