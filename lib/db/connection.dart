import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sql.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Connection{
  // 2 function one return instanse and another one create database

  Future<Database> setDatabase() async{
    var directory =await getApplicationDocumentsDirectory();
    var path=join(directory.path,'contact');
    var database=await openDatabase(path,version: 1,onCreate: _createtable);
    return database;
  }

  Future<void> _createtable(Database database,int version) async{
    String sql="CREATE TABLE record ("
        "id INTEGER PRIMARY KEY,"
        "firstname TEXT,"
        "lastname TEXT ,"
        "mobile TEXT,"
        "email TEXT,"
        "address TEXT)";

    await database.execute(sql);
  }
}