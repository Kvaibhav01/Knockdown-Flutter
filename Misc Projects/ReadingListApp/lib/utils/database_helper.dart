import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:girlscript_finaltask/Models/book.dart';

class DatabaseHelper{
  static DatabaseHelper _databaseHelper; //singleton database helper
  static Database _database;
  String bookTable = 'book_table';
  String colId= 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colDate = 'date';

  DatabaseHelper._createInstance(); //named constructor to create instance of database helper

  factory DatabaseHelper(){

    if(_databaseHelper==null) {
      _databaseHelper = DatabaseHelper._createInstance(); //this is executed only once, singleton object
    }

    return _databaseHelper;
  }

  Future<Database> get database async{

    if(_database == null){
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async{
    //get the directory path for both android and ios to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'books.db';

    //open/create database at a given path
    var booksDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return booksDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $bookTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT,'
        '$colDescription TEXT, $colDate TEXT)');
  }

  //fetch operation: get all book objects from database
  Future<List<Map<String, dynamic>>> getBooksMapList() async{
    Database db = await this.database;

    var result = await db.rawQuery('SELECT * FROM $bookTable');
    return result;
  }
  //insert operation: insert a new book object to database
  Future<int> insertBook(Book book) async{
    Database db = await this.database;
    var result = await db.insert(bookTable, book.toMap());
    return result;
  }

  //update operation: update a book object and save it to database
  Future<int> updateBook(Book book) async{
    var db = await this.database;
    var result =  await db.update(bookTable, book.toMap(), where: '$colId = ?', whereArgs: [book.id]);
    return result;
  }

  //delete operation : delete a book object from database
  Future<int> deleteBook(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $bookTable WHERE $colId = $id');
    return result;
  }

  //get number of book objects in database
  Future<int> getCount() async{
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $bookTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  //get the map list and convert it to book list
  Future<List<Book>> getBookList() async{
    var bookMapList = await getBooksMapList(); //get map list from database
    int count = bookMapList.length; //count the no. of map entries in db table

    List<Book> bookList = List<Book>();

    for(int i=0;i< count; i++){
      bookList.add(Book.fromMapObject(bookMapList[i]));
    }

    return bookList;
  }
}