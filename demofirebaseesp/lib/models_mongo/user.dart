

import 'package:mongo_dart/mongo_dart.dart';

class User {
  final ObjectId id;
  final String topic;
  final String thres;
  final String tempH;
  final String tempL;
  final String humiH;
  final String humiL;
  // final Date createdAt;
  // final Date upDateddAt;
  


  const User({required this.id, required this.topic, required this.thres, required this.tempH, required this.tempL,required this.humiH, required this.humiL,
               });
              
               

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'topic': topic,
      'thres': thres,
      'tempH': tempH,
      'tempL': tempL,
      'humiH': humiH,
      'humiL': humiL,
      // 'createdAt': createdAt,
      // 'updateddAt': updateddAt,
    };
  }

  User.fromMap(Map<String, dynamic> map)
      : topic = map['topic'],
        id = map['_id'],
        thres = map['thres'],
        tempH = map['tempH'],
        tempL = map['tempL'],
        humiH = map['humiH'],
        humiL = map['humiL'];
        // createdAt = map['createdAt'],
        // updateddAt = map['updateddAt'];
       
}
