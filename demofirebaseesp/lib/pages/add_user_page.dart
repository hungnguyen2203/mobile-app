import 'package:appthuan/component_mongo/user_card.dart';
import 'package:appthuan/component_mongo/user_card2.dart';
import 'package:appthuan/models_mongo/user2.dart';
import 'package:flutter/material.dart';
import 'package:appthuan/pages/add_user_page.dart';
import 'package:appthuan/database_mongo/database.dart';
import 'package:appthuan/models_mongo/user1.dart';
import 'package:appthuan/component_mongo/user_card1.dart';
import 'package:appthuan/models_mongo/user1.dart';
import 'package:flutter/material.dart';


import 'dart:io';



class AddUserPage extends StatefulWidget {
  AddUserPage({Key? key}) : super(key: key);

  @override
  _AddUserPage createState() => _AddUserPage();
}

class _AddUserPage extends State<AddUserPage> {
  //--------------------------------------------
 
  //--------------------------------------------
  @override
  void initState() {
    super.initState();
   
  }
   

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MongoDatabase.getDocuments2(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.white,
              child: const LinearProgressIndicator(
                backgroundColor: Colors.black,
              ),
            );
          } else {
            if (snapshot.hasError) {
              return Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    'Something went wrong, try again.',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              );
            } else {
              return Scaffold(
                
                appBar: AppBar(
                  backgroundColor: Color.fromARGB(255, 6, 132, 178),
                  title: const Text(
                    "REPORT",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                body: 
                //ListView.builder(
                GridView.builder(
      shrinkWrap: true, // Đảm bảo lưới co dãn theo nội dung của nó
      physics: ScrollPhysics(), // Không cho phép cuộn trong lưới
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Số cột trong lưới
        mainAxisSpacing: 8.0, // Khoảng cách giữa các hàng
        crossAxisSpacing: 8.0, // Khoảng cách giữa các cột
      ),
                                        
                  itemBuilder: (context, index) {
//=================================================
      


            
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UserCard2(
                        user2: User2.fromMap(snapshot.data![index]),
                        onTapDelete: () async {
                         // _deleteUser(User1.fromMap(snapshot.data![index]));
                        },
                        onTapEdit: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return AddUserPage();
                              },
                              settings: RouteSettings(
                                arguments: User2.fromMap(snapshot.data![index]),
                              ),
                            ),
                          ).then((value) => setState(() {}));
                        },
                      ),
                    );
                  },
                  itemCount: snapshot.data?.length,
                ),
                // floatingActionButton: FloatingActionButton(
                //   onPressed: () {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (BuildContext context) {
                //       return AddUserPage();
                //     })).then((value) => setState(() {}));
                //   },
                //   child: Icon(Icons.add),
                // ),
                 
              );
            }
          }
        });
  }

  // _deleteUser(User1 user1) async {
  //   await MongoDatabase.delete(user1);
  //   setState(() {});
  // }
}
