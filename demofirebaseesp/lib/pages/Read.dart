import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
//import 'package:fl_chart/fl_chart.dart';
//import 'ChartTemp.dart';
//import 'ChartHumi.dart';

//================================================phần mới ==========================================================


class Read extends StatefulWidget {
//const Read({super.key});
const Read({Key? key}) : super(key: key);
@override
State<Read> createState() => _ReadDataState();
}


class _ReadDataState extends State<Read> {

final ref = FirebaseDatabase.instance.ref('myapp');
@override
Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    backgroundColor: Color.fromARGB(255, 6, 132, 178) ,
    title: const Text("GATE 4G",
    style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,), 
    
  ),),
  body: Column(
    children: [
      Expanded(
        child: FirebaseAnimatedList(
          query: ref,
          itemBuilder:  (context, snapshot, animation, index) {






            return Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Color.fromARGB(2230, 16, 47, 92), // Màu sắc viền
                  width: 2.0, // Độ dày viền
                ),
                borderRadius: BorderRadius.circular(8.0), // Bo tròn góc viền
              ),
              color: Color.fromARGB(248, 255, 255, 255),
              child: ListTile(                
                leading: Icon(
                  Icons.device_thermostat,
                  size: 40, 
                  color: Color.fromARGB(255, 174, 9, 9),// Kích thước biểu tượng là 30                 
                ),              
                title: Text('Device:${snapshot.child('gateway2').child('device').value.toString()}  Time:${snapshot.child('gateway2').child('time').value.toString()}',
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),
                subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('Temperature: ${snapshot.child('gateway2').child('data1').value.toString()} *C',
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromARGB(255, 231, 132, 67),
                  ), ),
                Text('Humidity: ${snapshot.child('gateway2').child('data2').value.toString()} %',
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromARGB(255, 0, 150, 195),
                  ),),
                ]
                ),
                trailing: Icon(
                                Icons.four_g_mobiledata,
                                color: Color.fromARGB(230, 28, 66, 122),
                                size: 40,
                              ),
              ),
            );

















          }
        )
      )
    ],
  ),
);

}
}
















//=======================================================phân cũ==================================================================
//class ReadData extends StatefulWidget {
//   const ReadData({super.key});

//   @override
// State<ReadData> createState() => _ReadDataState();
// }

// class _ReadDataState extends State<ReadData> {
//   String HT = '';
//   String HM = '';
  //final database = FirebaseDatabase.instance.ref();
//   @override
//   void iniState() {
//     super.initState();
//     _HienthiTemp();
//     _HienthiHumi();
//   }

//   _HienthiTemp() {
//     database.child('Nhietdo').onValue.listen((DatabaseEvent event) {
//       final Temp = event.snapshot.value;
//       setState(() {
//         HT = 'Nhiệt Độ : $Temp';
//       });
//       print(HT);
//     });
//     return HT;
//   }

//   _HienthiHumi() {
//     database.child('Doam').onValue.listen((DatabaseEvent event) {
//       final Humi = event.snapshot.value;
//       setState(() {
//         HM = 'Độ Ẩm: $Humi';
//       });
//       print(HM);
//     });
//     return HM;
//   }

//   @override
//   Widget build(BuildContext context) {
  

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Hiển Thị Dữ Liệu',
//           style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
//         ),
//         backgroundColor: Color.fromARGB(255, 194, 216, 28),
//       ),
//       body: Column(children: [
//         SizedBox(
//             child: Container(
//                 width: double.infinity,
//                 height: 80.0,
//                 decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 223, 243, 75),
//                     borderRadius: BorderRadius.all(Radius.circular(30.0))),
//                 child: Center(
//                     child: Text(
//                   'Dữ Liệu Đo DHT22',
//                   style: TextStyle(
//                       fontSize: 25.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//                 )))),
//         Padding(
//             padding: const EdgeInsets.only(top: 15.0),
//             child: SizedBox(
//               height: 200.0,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Expanded(
//                       flex: 2,
//                       child: Container(
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                               color: Color.fromARGB(255, 42, 227, 159),
//                               borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(30.0),
//                                   topRight: Radius.circular(30.0),
//                                   bottomLeft: Radius.circular(30.0),
//                                   bottomRight: Radius.circular(30.0))),
//                           child: Padding(
//                             padding: EdgeInsets.all(30.0),
//                             child: Column(
//                               children: <Widget>[
//                                 Expanded(
//                                     flex: 2,
//                                     child: Container(
//                                         width: double.infinity,
//                                         decoration: BoxDecoration(
//                                             color: Color.fromARGB(255, 224, 122, 13),
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(20))),
//                                         child: SizedBox(
//                                           width: 400,
//                                           height: 50,
//                                           child: Center(
//                                             child: Text(
//                                               _HienthiTemp(),
//                                               textAlign: TextAlign.center,
//                                               style: TextStyle(
//                                                 color: Color.fromARGB(
//                                                     255, 255, 255, 255),
//                                                 fontSize: 35,
//                                                 fontWeight: FontWeight.w400,
//                                               ),
//                                             ),
//                                           ),
//                                         ))),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Expanded(
//                                   flex: 2,
//                                   child: Container(
//                                       width: double.infinity,
//                                       decoration: BoxDecoration(
//                                           color: Color.fromARGB(255, 21, 119, 14),
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(20))),
//                                       child: SizedBox(
//                                           width: 400,
//                                           height: 50,
//                                           child: Center(
//                                               child: Text(_HienthiHumi(),
//                                                   textAlign: TextAlign.center,
//                                                   style: TextStyle(
//                                                     color: Color.fromARGB(
//                                                         255, 255, 255, 255),
//                                                     fontSize: 35,
//                                                     fontWeight: FontWeight.w400,
//                                                   ))))),
//                                 )
//                               ],
//                             ),
//                           )))
//                 ],
//               ),
//             )),
      /*SizedBox(
          width: 500,
          height: 50,
          child: Center(
              child: Expanded(
                  flex: 2,
                  child: Container(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => TEMPERATURE())));
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 205, 74, 228)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ))),
                          child: Text(
                            'ĐỒ THỊ NHIỆT ĐỘ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )))))),
      SizedBox(
          width: 500,
          height: 50,
          child: Center(
              child: Expanded(
                  flex: 2,
                  child: Container(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => HUMILITY())));
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 205, 74, 228)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ))),
                          child: Text(
                            'ĐỒ THỊ ĐỘ ẨM',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ))))))*/
//       ]),
//     );
//   }
// }
