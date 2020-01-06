import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "Todo App with Re-orderable Lists & Swipe Cards",
    home: App(),
  ));
}

List<String> items = ["Item 1 - I will stick to the new position!", "Item 2 - I will stick to the new position!", "Item 3 - I will stick to the new position!"];

class App extends StatefulWidget{
  @override
  AppState createState() {
    return AppState();
  }
}

class AppState extends State<App>{  
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("First Empty Half Baked App"),
      ),
      body: ReorderableListView(
        children: <Widget>[
          for(final value in items)
            Text(
              value,
              key: Key(value),
              style: TextStyle(
                fontSize: 22.0
              ),
              )
        ],
        onReorder: (OldIndex, NewIndex){
          setState(() {
            if(OldIndex < NewIndex){
              NewIndex -= 1;
            }
            var getReplacedWidget = items.removeAt(OldIndex);
            items.insert(NewIndex, getReplacedWidget);
          });
        },
      ),
    );
  }
}

