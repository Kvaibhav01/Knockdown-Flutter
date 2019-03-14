class Todo{
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  // CONSTRUCTORS
  Todo (this._title, this._priority, this._date, [this._description]);
  Todo.withId(this._id, this._title, this._priority, this._date, [this._description]);

  // GETTERS
  int get id => _id;
  String get title => _title;
  String get description => _description;
  int get priority => _priority;
  String get date => _date;

  // SETTERS
  set title (String newTitle) {
    if (newTitle.length <= 255) {
      _title = newTitle;
    }
  }
  set description (String newDescription) {
    if (newDescription.length <= 255) {
      _description = newDescription;
    }
  }
  set priority (int newPriority) {
    if (newPriority >0 && newPriority<=3) {
      _priority = newPriority;
    }
  }
  set date(String newDate) {
    _date = newDate;
  }

  //? USE MAP WHICH TAKES 'STRING' AS KEY AND 'DYNAMIC' AS VALUE
  Map <String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map["title"] = _title;
    map["description"] = _description;
    map["priority"] = _priority;
    map["date"] = _date;
    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }

  //?USE NAMED CONSTRUCTOR WHICH WILL TAKE IN AN OBJECT AND TRANSFORM IT IN A TO-DO. OPPOSITE OF MAP.
  Todo.fromObject(dynamic o) {
    this._id = o["id"];
    this._title = o["title"];
    this._description = o["description"];
    this._priority = o["priority"];
    this._date = o["date"];
  }
}