import 'package:flutter/material.dart';
import 'package:appthuan/models_mongo/user.dart';

class UserCard extends StatelessWidget {
  UserCard({required this.user, required this.onTapDelete, required this.onTapEdit});
  final User user;
  final void Function() onTapEdit;
final void Function() onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      
      color: Colors.white,
      child: ListTile(
        leading: Text(
          'Thres: ${user.thres}',
          style: Theme.of(context).textTheme.headline6,
        ),
        title: Text(
            'Topic: ${user.topic}',
            style: TextStyle(
              fontSize: 18, // Kích thước chữ là 18
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'tempH: ${user.tempH}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold, 
                  color: Color.fromARGB(255, 231, 132, 67),// Kích thước chữ là 16
                ),
              ),
              Text(
                'tempL: ${user.tempL}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 150, 195), // Kích thước chữ là 16
                ),
              ),

              Text(
                'humiH: ${user.humiH}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 231, 132, 67), // Kích thước chữ là 16
                ),
              ),

              Text(
                'humiL: ${user.humiL}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 150, 195), // Kích thước chữ là 16
                ),
              ),

              // Text(
              //   'createdA: ${user.createdAt}',
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //     color: Color.fromARGB(255, 0, 0, 0), // Kích thước chữ là 16
              //   ),
              // ),

              // Text(
              //   'updateddAt: ${user.updateddAt}',
              //   style: TextStyle(
              //     fontSize: 18,
              //     //fontWeight: FontWeight.bold,
              //     color: Color.fromARGB(255, 0, 0, 0), // Kích thước chữ là 16
              //   ),
              // ),

             

            ],
          ),
        trailing: Icon(
                  Icons.notification_important,
                  size: 50, 
                  color: Color.fromARGB(255, 172, 22, 11),// Kích thước biểu tượng là 30
                ),
  
      ),
    );
  }
}