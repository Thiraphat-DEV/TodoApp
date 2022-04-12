import 'package:appflut/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // datePicker
import 'package:appflut/util/database_helper.dart';

class todoDetail extends StatefulWidget {
  final String appBarTitle;
  final Todo todo;

  todoDetail(this.todo, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return todoDetailState(this.todo, this.appBarTitle);
  }
}

class todoDetailState extends State<todoDetail> {
        static var _priorities = ['High', 'Low'];
        DatabaseHelper helper = DatabaseHelper();

        String appBartitle;
        Todo todo;

        TextEditingController titleController = TextEditingController();
        TextEditingController descriptionController = TextEditingController();

        todoDetailState(this.todo, this.appBartitle);

        @override
      Widget build(BuildContext context) {
         TextStyle? textStyle = Theme.of(context).textTheme.titleLarge;
          double textScale = 1.5;
         titleController.text = todo.title;
        descriptionController.text = todo.descript;

        return WillPopScope(
            //change Screen
          onWillPop: () async {
            MoveTolastScreen();
            return false; //intial state of MovetoScreen no Change Screen
          },
        child: Scaffold(
          appBar: AppBar(
            title: Text(appBartitle),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,

              ),
              onPressed: () {
                MoveTolastScreen();
              },
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: DropdownButton(
                    items: _priorities.map((String dropdown) {
                       return DropdownMenuItem(child: Text(dropdown), value: dropdown,);
                    }).toList(),
                    style: textStyle,
                    value: getPriorityAsString(todo.priority),
                    onChanged: (valueSelected) {
                      setState(() {
                        debugPrint('USER SELECTED $valueSelected'); // show of change State
                        updatePriorityAsInt(valueSelected); // update State
                      });
                    },
                  ),
                ),
                
                // Element 2
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),//change of many
                  
                  child: TextField(
                    controller: titleController,
                    style: textStyle,
                    onChanged: (valueChange) {
                      debugPrint('Change of Title in TextField $valueChange');
                      updateTitle();
                    },
                    decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      )
                    ),
                  ),
                ),

                //Element 3
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0), //manual set border
                  child: TextField(
                    controller: descriptionController,
                    style: textStyle,
                    onChanged: (valueChange) {
                      debugPrint('Changed Description in TextField');
                      updateDescription();
                    },
                    decoration: InputDecoration(
                      labelText: "DESCRIPTION",
                      labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),
                //Element 4
                Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text("Save",
                        textScaleFactor: textScale, //scale of Button
                        ),
                        onPressed: () {
                          setState(() {
                            debugPrint("Save Successed");
                            SaveState();
                          });
                        },
                        
                      ),
                      ),
                      Container(width: 5.0,),
                      Expanded(child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorDark,
                        child: Text(
                          'DELETE',
                          textScaleFactor: textScale,
                        ),
                        onPressed: () {
                          setState(() { // delete
                            debugPrint('DELETE SUCCESSED');
                            DeleteState();
                          });
                        },
                      ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        );
  }

  //CRUD STATE
  void updateTitle() {
    todo.title = titleController.text;
  }
  void updateDescription() {
    todo.descript = descriptionController.text;
 }
 void DeleteState()  async {
    MoveTolastScreen();

    if(todo.id == null ) {
      _showDialog('STATUS','NO DELETED OF TODOLIST');
      return;
    }

    int total =  await helper.deleteTodoList(todo.id);
    if(total != 0) {
      _showDialog('STATUS', 'DELETE DATA TO SUCCESSED');
      Icons.clean_hands_rounded;
    }else {
      _showDialog('STATUS', 'FAILED OF DELETE DATA' );
       Icons.dangerous_rounded;
    }

 }
 void SaveState() async  {
    MoveTolastScreen();

    todo.date = DateFormat.yMMMd().format(DateTime.now());
    int total;

    // ignore: unnecessary_null_comparison
    if(todo.id != null) {
      total = await helper.updateTodoList(todo);
    }else {
      total = await helper.insertTodoList(todo);
    }

    if(total != 0) {
      _showDialog('STATUS', 'SAVE DATA TO SUCCESSED');
      Icons.clean_hands_rounded;
    }else {
      _showDialog('STATUS', 'FAILED TO SAVEDATA');
      Icons.dangerous_sharp;
    }
 }
// after showDialog follow to save and delete
 void _showDialog(String title, String msg) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(msg),

    );
    showDialog(
      context: context,
      builder: (_) => alertDialog
    );
 }
//MOVE SCREEN
void MoveTolastScreen() {
  Navigator.pop(context, true);
}

//updatePriority getString
void updatePriorityAsInt(String values) {
  switch(values) {
    case 'High':
      todo.priority = 1;
      break;
    case 'Low':
      todo.priority = 2;
      break;
  }
}
// get String
 String getPriorityAsString(int values) {
          String priorityCheck;
          switch(values) {
            case 1:
              priorityCheck = _priorities[0]; //High
            break;
            case 2:
              priorityCheck = _priorities[1]; //Low
            break;
            default: priorityCheck = _priorities[0];
          }
          return priorityCheck;
}

}
