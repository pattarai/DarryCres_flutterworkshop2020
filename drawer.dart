import 'package:flutter/material.dart';
import 'package:veroni2/login.dart';
import 'package:veroni2/snackbar_demo.dart';

import 'stackdemo.dart';

class DrawerItem {
String title;
IconData icon;

DrawerItem(this.title, this.icon);
}

class HomeScreen extends StatefulWidget {
HomeScreen(){}

var drawerItems = [
new DrawerItem("Login", Icons.vpn_key),
new DrawerItem("Stack", Icons.layers),
new DrawerItem("Snackbar", Icons.space_bar),
];

@override
State<StatefulWidget> createState() {
return new HomeScreenState();
}
}

class HomeScreenState extends State<HomeScreen> {
BuildContext _ctx;
final scaffoldKey = new GlobalKey<ScaffoldState>();

int _selectedDrawerIndex = 0;

_getDrawerItemWidget(int pos) {
switch (pos) {
case 0:
return LoginPage();
break;
case 1:
return StackDemo();
break;
case 2:
return SnackbarDemo();
break;
default:
return new Text("Error");
break;
}
}


_onSelectItem(int index) {
setState(() => _selectedDrawerIndex = index);
Navigator.of(context).pop(); // close the drawer
}

@override
Widget build(BuildContext context) {
_ctx = context;
var drawerOptions = <Widget>[];

for (var i = 0; i < widget.drawerItems.length; i++) {
var d = widget.drawerItems[i];
if (i == 7) {
drawerOptions.add(
const Divider(height: 1.0, color: Colors.grey),
);
}
drawerOptions.add(new ListTile(
leading: new Icon(d.icon),
title: new Text(
d.title,
style: TextStyle(fontFamily: "Poppins"),
),
selected: i == _selectedDrawerIndex,
onTap: () => _onSelectItem(i),
));
}
return new Scaffold(
key: scaffoldKey,
appBar: new AppBar(
// here we display the title corresponding to the fragment
// you can instead choose to have a static title
title: new Text(
widget.drawerItems[_selectedDrawerIndex].title,
),
),
drawer: new Drawer(
child: SingleChildScrollView(
child: new Column(
children: <Widget>[
new UserAccountsDrawerHeader(
accountName: new Text("Darry Crescenta"),
accountEmail: new Text("@darrycres"),
currentAccountPicture: CircleAvatar(
radius: 60.0,
backgroundColor: const Color(0xFF778899),
backgroundImage: NetworkImage("https://www.holex.com/wp-content/uploads/bb-plugin/cache/sourcing-experts-holex-flower-landscape.jpg"), // for Network image
),
decoration: new BoxDecoration(
color: Color(0xFF222437),
),
),
new Column(children: drawerOptions)
],
),
),
),
body: _getDrawerItemWidget(_selectedDrawerIndex),
);
}
}