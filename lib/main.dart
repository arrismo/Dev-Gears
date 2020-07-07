import 'dart:ui';
import 'package:flutter/material.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new HomeScreen());
  }
}
    
class DataSearch extends SearchDelegate<String>{
final languages = [
  "Python",
"HTML",
  "Java",
  "Javascript",
  "C",
  "C++",
  "C#"


  
  
];

final recentLanguages = [
  
  "Java ", 
  "Python"



];

  @override
  List<Widget> buildActions(BuildContext context){
    return [ 
      IconButton(icon: Icon(Icons.clear), onPressed: () {
        query = "";
      })

    ];
  }

  @override
  Widget buildLeading(BuildContext context){
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,


    ), 
    
    onPressed: () {
      close(context,null);
    }
    );
  }



  @override
  Widget buildResults(BuildContext context){

    if (query.startsWith("P")) {
             Navigator.push(context, new MaterialPageRoute(builder: (context) => new PythonRoute())
            );

    }

    if (query.endsWith("script") && query.startsWith("Java")) {
             Navigator.push(context, new MaterialPageRoute(builder: (context) => new JavascriptRoute())
            );
    }

    if (query.startsWith("Java") && ! query.endsWith("script"))  {
             Navigator.push(context, new MaterialPageRoute(builder: (context) => new JavaRoute())
            );

    }

    if(query.startsWith("H")){
      Navigator.push(context, new MaterialPageRoute(builder: (context) => new HTMlRoute())
      );
  }




    if (query.startsWith("C")) {
             Navigator.push(context, new MaterialPageRoute(builder: (context) => new CRoute())
            );

    }


    if(query.contains("#")){
      Navigator.push(context, new MaterialPageRoute(builder: (context) => new CSharpRoute())
      );
    }


    if(query.contains("++")){
      Navigator.push(context, new MaterialPageRoute(builder: (context) => new CPlusRoute())
      );
  }


  

  } // ending tag for build results function

  @override

  Widget buildSuggestions(BuildContext context){
    final suggestionlanguages = query.isEmpty
    ?recentLanguages
    :languages.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
           buildResults(context);
        },
      title: RichText(
        text: TextSpan(
          text: suggestionlanguages[index].substring(0,query.length),
          style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: suggestionlanguages[index].substring(query.length),
                style: TextStyle(color: Colors.grey))
            ]),
           ),
        ),
    itemCount: suggestionlanguages.length,
  );
 }
}


class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Dev Gears"),
        actions: <Widget>[IconButton(icon: Icon(Icons.search), onPressed: () {
          showSearch(context: context, delegate: DataSearch());
        } )
        ],
      ),

      body: ListView(
        children: <Widget>[
          ListTile(
          title: Text('Python'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new PythonRoute())
            );
          },
      ),
          ListTile(
          title: Text('HTML'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new HTMlRoute())
            );
          },
       ),

           ListTile(
          title: Text('Javascript'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new JavascriptRoute())
            );
          },
       ),

      ListTile(
          title: Text('Java'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new JavaRoute())
            );
          },
       ),


      ListTile(
          title: Text('C'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new CRoute())
            );
          },
       ),

       ListTile(
          title: Text('C++'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new CPlusRoute())
            );
          },
       ),

       ListTile(
          title: Text('C#'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new CSharpRoute())
            );
          },
       ),
        ],)
    );
  }
}



       
// navigation for 
class PythonRoute extends StatelessWidget{
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Python "),
       ),

       body: ListView(
         children: <Widget>[
           ListTile(
             
             title: Text("Comment",
             style: TextStyle(color: Colors.green),
             ),
              subtitle: Text('# this is how you comment \nSubtitle line 3',
              style: TextStyle(color: Colors.green),
              ),
           ),
         ],
       ),
     );
}
}




class HTMlRoute extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTML"),
      )
    );
  }
}





class JavascriptRoute extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Javascript"),
      )
    );
  }
}



class JavaRoute extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Java"),
      )
    );
  }
}

class CRoute extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("C"),
      )
    );
  }
}

class CPlusRoute extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("C++"),
      )
    );
  }
}

class CSharpRoute extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("C#"),
      )
    );
  }
}


