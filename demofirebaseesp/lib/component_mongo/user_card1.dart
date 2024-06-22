import 'package:flutter/material.dart';
import 'package:appthuan/models_mongo/user1.dart';

class UserCard1 extends StatelessWidget {
  UserCard1({required this.user1, required this.onTapDelete, required this.onTapEdit});
  final User1 user1;
  final void Function() onTapEdit;
final void Function() onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40), // Điều chỉnh độ cong góc bo
        ),
      child: ListTile(
        leading: Icon(
                  Icons.person,
                  size: 50, 
                  color: Color.fromARGB(255, 9, 152, 174),// Kích thước biểu tượng là 30
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
            'Name: ${user1.name}',
            style: TextStyle(
              fontSize: 18, // Kích thước chữ là 18
            ),
          ),
              Text(
                'Mail:\n${user1.gmail}',
                style: TextStyle(
                  fontSize: 18, // Kích thước chữ là 16
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
          
        trailing: 
                Text(
          'Admin:\n ${user1.admin}',
          style: TextStyle(
                  fontSize: 16, 
                  color: Color.fromARGB(255, 185, 195, 0),
                   fontWeight: FontWeight.bold,// Kích thước chữ là 16
                ),
        ),
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