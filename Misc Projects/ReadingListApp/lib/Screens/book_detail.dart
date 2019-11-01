import 'package:flutter/material.dart';
import 'package:girlscript_finaltask/Models/book.dart';
import 'package:girlscript_finaltask/utils/database_helper.dart';
import 'package:intl/intl.dart';

class BookDetail extends StatefulWidget{

  final String appBarTitle;
  final Book book;

  BookDetail(this.book, this.appBarTitle);
  @override
  BookDetailState createState() => BookDetailState(this.book, this.appBarTitle);
}

class BookDetailState extends State<BookDetail>{

  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle;
  Book book;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  BookDetailState(this.book, this.appBarTitle);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;

    titleController.text = book.title;
    descriptionController.text = book.description;

    return WillPopScope(

      onWillPop: (){
        moveToLastScreen();
      },

      child: Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            moveToLastScreen();
          },
        )
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[

            //First Element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: titleController,
                style: textStyle,
                onChanged: (value){
                  debugPrint('Something happned in title!');
                  updateTitle();
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )
                )
              ),
            ),

            //Second Element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                  controller: descriptionController,
                  style: textStyle,
                  onChanged: (value){
                    debugPrint('Something happned in Description!');
                    updateDescription();
                  },
                  decoration: InputDecoration(
                      labelText: 'Author',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                  )
              ),
            ),

            //third element in column, has two buttons in a row
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Colors.white,
                      elevation: 7.0,
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                      child: Text(
                        'Save',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: (){
                        setState((){
                          debugPrint('Pressing the save button');
                          _save();
                        });
                      }
                    )
                  ),

                  Container( width: 5.0),
                  Expanded(
                      child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Colors.white,
                          elevation: 7.0,
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                          child: Text(
                            'Delete',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: (){
                            setState((){
                              debugPrint('Pressing the delete button');
                              _delete();
                            });
                          }
                      )
                  )
                ],
              )
            )

          ],
        ),
      )
    ));
  }

  void moveToLastScreen(){
    Navigator.pop(context, true);
  }

  //update the title of book object
  void updateTitle(){
    book.title = titleController.text;
  }

  //update the author of book object
  void updateDescription(){
    book.description = descriptionController.text;
  }

  //save data to database
  void _save() async{

    moveToLastScreen();

    book.date = DateFormat.yMMMd().format(DateTime.now());

    int result;
    if(book.id!=null){  //update operation
      result = await helper.updateBook(book);
    }else{ //insert operation
      result = await helper.insertBook(book);
    }

    if(result!=0){ //success
      _showAlertDialog('Status', 'Book Saved Successfully');
    }else{ //faliure
      _showAlertDialog('Status', 'Problem saving book');
    }
  }

  void _delete() async{

    moveToLastScreen();
    //Case1: if user is trying to delete the new book
    if(book.id==null){
      _showAlertDialog('Status', 'No book was deleted');
      return;
    }

    //case2: if user is trying to delete old book
    int result = await helper.deleteBook(book.id);
    if(result != 0){
      _showAlertDialog('Status', 'Book deleted Successfully');
    }else{
      _showAlertDialog('Staus', 'Error occurred while deleting book');
    }
  }

  void _showAlertDialog(String title, String message){
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
      context: context,
      builder: (_) => alertDialog
    );
  }

}