import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

const mongoURL =
    "mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+1.6.1";
const collectionName = "users";

class MongoDb {
  static dataconnect() async {
    var db = await Db.create(mongoURL);
    await db.open();
    inspect(db);
    var collection = db.collection(collectionName);
    print(collection);
  }
}
