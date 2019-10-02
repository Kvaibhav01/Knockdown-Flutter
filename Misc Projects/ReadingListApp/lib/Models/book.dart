class Book{
  int _id;
  String _title;
  String _description;
  String _date;

  Book(this._title, this._date, [this._description]);

  Book.withId(this._id, this._title, this._date, [this._description]);

  int get id => _id;
  String get title => _title;
  String get description => _description;
  String get date => _date;

  set title(String newTitle){
    if(newTitle.length <=255){
      this._title = newTitle;
    }
  }

  set description(String newDescription){
    if(newDescription.length <=255){
      this._description = newDescription;
    }
  }

  set date(String newDate){
    this._date = newDate;
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();

    if(id!=null){
      map['id'] = _id;
    }

    map['title']  = _title;
    map['description'] = _description;
    map['date'] = _date;

    return map;
  }

  Book.fromMapObject(Map<String, dynamic> map){
    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._date = map['date'];
  }
}