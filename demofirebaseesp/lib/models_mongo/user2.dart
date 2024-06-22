

import 'package:mongo_dart/mongo_dart.dart';

class User2 {
  final ObjectId iid;
  final String? id;
  final String? temperature;
  final String? humidity;
  final String? date;
  final String? time;
 
  //inal String low;

  const User2({required this.iid, required this.id,required this.temperature, required this.humidity, required this.date, required this.time});

  Map<String, dynamic> toMap() {
    return {
      '_id': iid,
      'id': id,
      'temperature': temperature,
      'humidity': humidity,
      'date': humidity,
      'time': time,
      
     // 'admin': admin
    };
  }

  User2.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        iid = map['_id'],
        
        temperature = map['temperature'],
        humidity = map['humidity'],
        date = map['date'],
        time = map['time'];
  
       // low = map['low'];
}
