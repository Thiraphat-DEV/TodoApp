/**
    void main() {
    runApp(simpleDia());


    }


    class simpleDia extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
    body: Home(),
    ),

    );
    }
    }

    class Home extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    Future _showDia() async {
    switch(await showDialog(
    context:context,
    builder: (BuildContext inContext) {
    return SimpleDialog(
    title: Text("Simple Dialog"),
    children: <Widget>[
    SimpleDialogOption(
    onPressed: () {
    Navigator.pop(inContext, 'HEY');
    },
    child: Text("YES"),
    ),
    SimpleDialogOption(
    onPressed: () {
    Navigator.pop(inContext, "NOT SHOWDIALOG");
    },
    child: Text('NO'),
    )
    ],
    );
    }
    )) {
    case 'HEY': {
    print('YES SHOWDIALOG');
    break;
    }
    case 'NOT SHOWDIALOG': {
    print("NO SHOWDIALOG ");
    break;
    }
    }
    return Scaffold(
    body: Center(
    child: RaisedButton(

    child: Text('SHOW DIALOG'),
    onPressed: _showDia,
    ),
    ),
    );
    }
    }
    }
 **/
/**k
    void main() {
    runApp(Datepicker());
    }


    class Datepicker extends StatelessWidget {
    Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
    body: Home(),
    ),
    );
    }
    }
    // ? = optional Chaining is checkValue of parameter Type
    class Home extends StatelessWidget {
    Future<void> _selectDate(BuildContext inContext) async {
    DateTime? selectedDate =  await showDatePicker(
    context: inContext,
    initialDate:DateTime.now(),
    firstDate: DateTime(2021),
    lastDate:DateTime(2021)
    );
    print(selectedDate);


    }

    Future<void> _selectTime(BuildContext inContext) async {
    TimeOfDay? selectedTime = await showTimePicker(context: inContext, initialTime:TimeOfDay.now());
    print(selectedTime);
    }

    @override
    Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

    body: Center(
    child: Column(
    children: <Widget>[
    RaisedButton(
    onPressed: ()  {
    _selectDate(context);
    },
    child: Text("date Picker Selected"),
    ),
    RaisedButton(onPressed: () {
    _selectTime(context);
    }, child: Text("TIME Picker Selected"),)
    ],
    ),
    ),
    );
    }
    }
 **/
/**

    void main() {
    runApp(Navbar());
    }
    class Navbar extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return MaterialApp(
    home:DefaultTabController(
    length: 3,
    child: Scaffold(
    appBar: AppBar(
    title: Text("Navbar Thiraphat"),
    bottom: TabBar(
    tabs: [
    Tab(icon: Icon(Icons.announcement),),
    Tab(icon: Icon(Icons.person),),
    Tab(icon: Icon(Icons.cloud),),
    ],

    ),

    ),
    body: TabBarView(
    children: <Widget>[
    Center(child: Text("Thiraphat"),),
    Center(child: Text("Chanyaphak"),),
    Center(child: Text("Sommay"),),
    ],
    ),
    ),
    ) ,
    );
    }
    }
 **/
/**
    void main() {
    runApp(RoutesApp());
    }

    class RoutesApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return MaterialApp(

    title: "Hello AppRoutes",
    home: MyStateRoute(),
    );
    }
    }

    class MyStateRoute extends StatefulWidget {
    @override
    _MyStateRoute createState() => _MyStateRoute();
    }

    class _MyStateRoute extends State<MyStateRoute> {
    int idx = 0;
    static const TextStyle optionStyle = TextStyle(
    fontSize: 20,
    fontFamily: 'cursive',
    fontWeight: FontWeight.bold
    );
    static const List<Widget> _widgetStyle = <Widget>[
    Text(  'HOME', style: optionStyle, ),
    Text(  'About', style: optionStyle, ),
    Text(  'CONTACT', style: optionStyle, ),
    ];


    void onTaped(int index) {

    setState(() {
    idx = index;
    });

    }


    @override
    Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: Text("navbar Thiraphat"),
    ),
    body: Center(
    child: _widgetStyle.elementAt(idx),
    ),
    bottomNavigationBar: BottomNavigationBar(
    items:<BottomNavigationBarItem>[

    BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',

    ),

    BottomNavigationBarItem(icon: Icon(Icons.school),
    label: 'About'
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: "Contact",
    ),


    ],

    currentIndex: idx,
    selectedItemColor: Colors.pink,
    onTap: onTaped,
    ),
    );
    }
    }
 **/
/**
    void main() {
    runApp(AppDivided());
    }

    class AppDivided extends StatelessWidget {
    Widget build(BuildContext context)  {
    return MaterialApp(
    title: 'Divided App',
    home: Scaffold(
    body: Center(
    child: Card(
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
    Text("Hello"),
    Divider(),
    Text("Hello1"),
    Divider(),
    Text("Hello2"),
    Divider(),
    ],
    ),
    )

    )

    ),

    );
    }
    } **/
/**
    void main() {
    runApp(AdvanceAppbar());
    }

    class AdvanceAppbar  extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
    appBar:  AppBar(
    title: Text("Thiraphat Nav"),
    leading: IconButton(
    icon: Icon(Icons.menu),
    onPressed: () {
    drawer: Drawer(
    child: Column(
    children: <Widget>[
    Text("Home"),
    Text('About'),
    Text('Contact')
    ],
    ),
    );
    },
    ),
    actions: <Widget>[
    IconButton(
    onPressed: () {

    },
    icon: Icon(Icons.search)
    ),
    IconButton(
    onPressed: () {
    },
    icon: Icon(Icons.more_vert),
    )
    ],
    flexibleSpace: Container(
    child: Center(
    child: Icon(
    Icons.photo_camera,

    size: 70.0,
    color: Colors.green,
    ),
    ),
    )
    ),

    bottomSheet: (
    PreferredSize(
    preferredSize: const Size(double.infinity, kToolbarHeight),
    child: Container(
    color: Colors.amberAccent,
    height: 50.0,
    child: Center(
    child: Text('Hello Thiraphat'),
    ),
    ),
    )
    ),
    ),
    );
    }
    }
 **/










/**
    void main() {
    runApp(CheckBoxApp());
    }

    class CheckBoxApp extends StatelessWidget {
    @override
    Widget build(BuildContext context){
    return MaterialApp(
    home: Scaffold(
    body: SafeArea(
    child: Center(
    child: CheckBoxWidget(),
    )
    ),
    )
    );
    }
    }

    class CheckBoxWidget extends StatefulWidget {
    @override

    CheckBoxWidgetClass createState() => new CheckBoxWidgetClass();
    }

    class CheckBoxWidgetClass extends State {
    bool Checked = false;
    String resultString = 'not select checkBox';

    void toggleChecked(bool value) {
    if(!Checked) {
    setState(() {
    Checked = true;
    resultString = 'SELECTED CHECK BOX';
    });
    }else {
    setState(() {
    Checked = false;
    resultString = "Not CHECKEDBOX";
    });
    }
    }

    @override
    Widget build(BuildContext context) {
    return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Transform.scale(
    scale: 2,
    child: Checkbox(
    value: Checked,
    onChanged: (value){
    toggleChecked(value!);
    },
    activeColor: Colors.blue,
    checkColor: Colors.green,
    tristate: false,
    )
    ),
    Text('$resultString', style: TextStyle(fontFamily: 'cursive', fontSize: 40),)
    ],
    );
    }
    }
 **/
/**1
 *
    void main () {
    runApp(AppFiled());
    }

    class AppFiled extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
    appBar: AppBar(
    title: Text("Hello AppField"),
    ),
    body: Center(
    child: TextField(
    obscureText: true,
    decoration: InputDecoration(
    labelText: "Enter Password",
    icon: Icon(Icons.lock),
    ),
    keyboardType: TextInputType.emailAddress,
    InputFormatters: [
    BlacklistingTextInputFormatter(RegExp('[0-9]')),
    LengthLimitingTextInputFormatter(20)
    ]
    ),
    )
    ),

    );
    }
    }
 **/
/**
    void main() {
    runApp(snackBar());
    }

    class snackBar extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
    appBar: AppBar(
    title: Text("SnackBar"),
    ),
    body: SnackBarPage(),
    )
    );
    }
    }

    class SnackBarPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Center(
    child: RaisedButton(
    color: Colors.pink,
    textColor: Colors.amber,
    child: Text("ShowText"),
    onPressed: ()  {
    final snackBar = SnackBar(
    content: Text("Hello SnackBar"),
    action: SnackBarAction(
    label: 'undo',
    onPressed: () {},
    ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
    },
    ),
    );
    }
    }
 **/
/**
    void main(){
    runApp(AppContainer());
    }
 **/
/**
    class AppContainer extends StatelessWidget { //no change ui
    @override
    Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
    home: Container(
    child:Center(
    child: Container(
    width: 200.0,
    height: 200.0,
    child: RaisedButton(
    color: Colors.red,
    child: Text("Click ME"),
    onPressed: ()=> {},
    ),
    ),
    )
    )
    );
    }
    }
 **/
/**
    // StatelessWidget -> สร้างเเบบไหนได้เเบบนั้นจะไม่มีการเปลี่ยน UI ่
    void main() {
    runApp(new MyApp());
    }

    class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return MaterialApp(
    title: "App",
    home: Scaffold(
    appBar: AppBar(
    title: Text("App Bar"),
    ),
    body: Center(
    child: Column(
    children: <Widget>[
    ild: DecoratedBox(
    decoration: BoxDecoration(color: Colors.amber.shade600),
    child: Padding(
    padding: EdgeInsets.all(8.0, ),
    child: Text('Thiraphat'),
    )
    ],
    ),

    ),
    ),
    )
    );
    }
    }
 **/

/**
    //StatefulWidget -> uiจะทำการวาด widget ใหม่เมือหน้า ui เปลี่ยน
    /**
    void main() {
    runApp(MaterialApp(title: "Hello State Thiraphat", home: FavoriteApp()));
    }

    class FavoriteApp extends StatefulWidget {
    @override
    State<StatefulWidget> createState() {
    return _FavoriteAppState();
    }
    }

    class _FavoriteAppState extends State<FavoriteApp> {
    String nameFav = "";

    @override
    Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: Text("State Ful App"),
    ),
    body: Container(
    child: Column(
    children: <Widget>[
    TextField(
    onSubmitted: (String userInput) => {
    setState(() => {
    nameFav = userInput
    })
    },
    ),
    Padding(
    padding: EdgeInsets.all(30.0),
    child: Text(
    "Hello name: $nameFav",
    style: TextStyle(fontFamily: 'cursive', fontSize: 25.0),
    ),
    ),
    ],
    )));
    }
    }
 **/