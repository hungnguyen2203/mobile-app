import 'package:flutter/material.dart';
import 'package:appthuan/models_mongo/user1.dart';

import '../models_mongo/user2.dart';

class UserCard2 extends StatelessWidget {
  UserCard2({required this.user2, required this.onTapDelete, required this.onTapEdit});
  final User2 user2;
  final void Function() onTapEdit;
final void Function() onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
        color: Color.fromARGB(255, 9, 152, 174), // Màu viền
        width: 2, // Độ dày viền
      ),// Điều chỉnh độ cong góc bo
        ),
      child: ListTile(
        trailing: Container(
            alignment: Alignment.center,
            width: 14, // Điều chỉnh kích thước của Container
            child: Icon(
              Icons.report,
              size: 40, // Điều chỉnh kích thước của Icon
              color: Color.fromARGB(255, 9, 152, 174),
            ),
          ),
        // title: Text(
        //     'Name: ${user1.name}',
        //     style: TextStyle(
        //       fontSize: 18, // Kích thước chữ là 18
        //     ),
        //   ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
            'Temp: ${user2.temperature}',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 150, 195), // Kích thước chữ là 18
            ),
          ),
              Text(
                'Humi:${user2.humidity}',
                style: TextStyle(
                  fontSize: 15,
                   fontWeight: FontWeight.bold, 
                  color: Color.fromARGB(255, 231, 132, 67), // Kích thước chữ là 16
                ),
              ),
              Text(
                'Time:\n${user2.time}',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0), // Kích thước chữ là 16
                ),
              ),
              Text(
                'Date:\n${user2.date}',
                style: TextStyle(
                  fontSize: 15, 
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),// Kích thước chữ là 16
                ),
              ),
              Text(
                'ID:\n${user2.id}',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 143, 149), // Kích thước chữ là 16
                ),
              ),
              
              // Text(
              //   'Low: ${user1.low}',
              //   style: TextStyle(
              //     fontSize: 16, // Kích thước chữ là 16
              //   ),
              // ),
            ],
          ),
          
        // trailing: 
        //         Text(
        //   'Admin:\n ${user1.admin}',
        //   style: TextStyle(
        //           fontSize: 16, 
        //           color: Color.fromARGB(255, 185, 195, 0),
        //            fontWeight: FontWeight.bold,// Kích thước chữ là 16
        //         ),
        // ),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     GestureDetector(
        //       child: Icon(Icons.edit),
        //       onTap: onTapEdit,
        //     ),
        //     GestureDetector(
        //       child: Icon(Icons.delete),
        //       onTap: onTapDelete,
        //     ),
        //   ],
        // ),
      ),
    );
  }
}