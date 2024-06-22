

import 'package:mongo_dart/mongo_dart.dart';

class User1 {
  final ObjectId id;
  final String name;
  final String gmail;
  final bool admin;
  //inal String low;

  const User1({required this.id, required this.name, required this.gmail, required this.admin});

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'gmail': gmail,
      'admin': admin ? 'true':'false',
     // 'admin': admin
    };
  }

  User1.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        id = map['_id'],
        gmail = map['gmail'],
        admin = map['admin'];

  void createPdf() {}
       // low = map['low'];
}
