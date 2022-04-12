class Todo {
  int _id;
  String _title;
  String _descript;
  int _priority;
  String _date;

  Todo(this._title,this._date, this._priority,this._descript );
  Todo.withId(this._id, this._title, this._date,this._priority, this._descript);

  int get id => _id;
  String get title => _title;
  String get date => _date;
  int get priority => _priority;
  String get descript => _descript;

  set title(String newTitle) {
    _title = newTitle;
  }

  set date(String newDate) {
    _date = newDate;
  }

  set priority(int newpriority) {
    if(newpriority >=1 && newpriority <=3) {
      _priority = newpriority;
    }
  }

  set descript(String newDescript) {
    _descript = newDescript;
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();

    if(id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['date'] = _date;
    map['priority'] = _priority;
    map['descript'] = _descript;

    return map;
  }
  Todo.fromMapObject(Map<String, dynamic> map) {
    _id = map['id'];
    _title = map['title'];
    _descript= map['descript'];
    _priority= map['priority'];
    _date= map['date'];
  }


}