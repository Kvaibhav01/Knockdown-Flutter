import 'package:flutter/material.dart';
import 'book_detail.dart';
import 'dart:async';
import 'package:girlscript_finaltask/Models/book.dart';
import 'package:girlscript_finaltask/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class ReadingList extends StatefulWidget{


  @override
  ReadingListState createState() => ReadingListState();
}

class ReadingListState extends State<ReadingList>{

  DatabaseHelper  databaseHelper = DatabaseHelper();
  List<Book> bookList;
  int count = 0;


  @override
  Widget build(BuildContext context) {

    if(bookList == null){
      bookList  = List<Book>();
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Reading List'),
      ),
      body: getReadingListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          debugPrint('FAB Clicked');
          navigateToBookDetail(Book('', ''), 'Add Book');
        },
        tooltip: 'Add Book',
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getReadingListView(){
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position){
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.bubble_chart),
            ),
            title: Text(this.bookList[position].title, style: titleStyle),
            subtitle: Text(this.bookList[position].description),

            trailing: GestureDetector(
              child: Icon(Icons.delete, color: Colors.grey),
              onTap: (){
                _delete(context, bookList[position]);
              }
            ),

            onTap: (){
              debugPrint("ListTile Tapped");
              navigateToBookDetail(this.bookList[position], 'Edit Book');
            },
          )
        );
      },
    );
  }

  void _delete(BuildContext context, Book book) async{
    int result = await databaseHelper.deleteBook(book.id);
    if(result!=0){
      _showSnackBar(context, 'Book deleted successfully');
      updateListView();
    }
  }

  _showSnackBar(BuildContext context, String message){
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToBookDetail(Book book, String title) async{
    bool result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context){
              return BookDetail(book, title);
            }
        )
    );
    if(result == true){
      updateListView();
    }
  }

  void updateListView(){
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database){

      Future<List<Book>> bookListFuture = databaseHelper.getBookList();
      bookListFuture.then((bookList){
        setState((){
          this.bookList = bookList;
          this.count = bookList.length;
        });
      });
    });
  }
}

