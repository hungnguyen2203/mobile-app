import 'package:appthuan/component_mongo/user_card.dart';
import 'package:flutter/material.dart';
import 'package:appthuan/pages/add_user_page.dart';
import 'package:appthuan/database_mongo/database.dart';
import 'package:appthuan/models_mongo/user1.dart';
import 'package:appthuan/component_mongo/user_card1.dart';
import 'package:appthuan/models_mongo/user1.dart';
import 'package:flutter/material.dart';


import 'dart:io';



class People extends StatefulWidget {
  People({Key? key}) : super(key: key);

  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> {
   List<dynamic> userList = [];
  @override
  void initState() {
    super.initState();
  }
   

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MongoDatabase.getDocuments1(),
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
                    "USERS",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                body: ListView.builder(
                  
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UserCard1(
                        user1: User1.fromMap(snapshot.data![index]),
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
                                arguments: User1.fromMap(snapshot.data![index]),
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
