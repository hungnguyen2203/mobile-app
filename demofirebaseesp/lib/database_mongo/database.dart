import 'package:mongo_dart/mongo_dart.dart';
import 'package:appthuan/models_mongo/user.dart';

import 'constants.dart';

class MongoDatabase {
  static var db, userCollection,userCollection1,userCollection2;

  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    userCollection = db.collection(USER_COLLECTION);
    userCollection1 = db.collection(USER_COLLECTION1);
    userCollection2 = db.collection(USER_COLLECTION2);
  }

  static Future<List<Map<String, dynamic>>> getDocuments() async {
    try {
      final users = await userCollection.find().toList();
      return users;
    } catch (e) {
      print(e);
      return Future.value();
    }
  }
   static Future<List<Map<String, dynamic>>> getDocuments1() async {
    try {
      final users1 = await userCollection1.find().toList();
      return users1;
    } catch (e) {
      print(e);
      return Future.value();
    }
  }
  static Future<List<Map<String, dynamic>>> getDocuments2() async {
    try {
      final users2 = await userCollection2.find().toList();
      return users2;
    } catch (e) {
      print(e);
      return Future.value();
    }
  }

  static insert(User user) async {
    await userCollection.insertAll([user.toMap()]);
  }

  // static update(User user) async {
  //   var u = await userCollection.findOne({"_id": user.id});
  //   u["topic"] = user.topic;
  //   u["thres"] = user.thres;
  //   u["high"] = user.high;
  //   u["low"] = user.low;
  //   await userCollection.save(u);
  // }

  static delete(User user) async {
    await userCollection.remove(where.id(user.id));
  }
}
