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
             title: Text("Print",
             style: TextStyle(color: Colors.green),
             ),
             subtitle: Text("print(Insert your message in double quotations here)",
             style: TextStyle(color: Colors.green),
             ),

           ),
           ListTile(
             
             title: Text("Comment",
             style: TextStyle(color: Colors.green),
             ),
              subtitle: Text('# this is how you comment \nSubtitle line 3',
              style: TextStyle(color: Colors.green),
              ),
           ),
            ListTile(
             
             title: Text("Variables",
             style: TextStyle(color: Colors.green),
             ),
              subtitle: Text("variable x = value;",
              style: TextStyle(color: Colors.green),
              ),
           ),
            ListTile(
             
             title: Text("Numbers",
             style: TextStyle(color: Colors.green),
             ),
              subtitle: Text('variable x = value (int); variable y = value2(float)',
              style: TextStyle(color: Colors.green),
              ),
           ),
           ListTile(
             
             title: Text("Convert into to float",
             style: TextStyle(color: Colors.green),
             ),
              subtitle: Text('float(x)',
              style: TextStyle(color: Colors.green),
              ),
           ),
           ListTile(
             
             title: Text("Strings",
             style: TextStyle(color: Colors.green),
             ),
              subtitle: Text(
                'Get characters at a certain position: A= "Hello World!"; print(a[1])',
                'Slicing: B = “Hello World”; print(b[2:5])',
                'Length: A = “Hello World”; print(len(a))',
                'Lower: A = “Hello World”; print(a.lower())',
                'Upper: A = “Hello World”; print(a.upper())',
                'Replace: A = “Hello World”; print(a.replace(“H”, “J”))',
                'Split: A = “Hello, World”; print(a.split(“,”))',
              style: TextStyle(color: Colors.green),
              ),
           ),
           ListTile(
             
             title: Text("String Concatenation",
             style: TextStyle(color: Colors.green),
             ),
              subtitle: Text(
              'To concatenate, or combine, two strings: a = "Hello",b = "World", c = a + b; print(c), HelloWorld',
              'Insert numbers into strings: age = 36, txt = "My name is John, and I am {}"; print(txt.format(age)), Result = My name is John, and I am 36 ',
              '',
              '',
              style: TextStyle(color: Colors.green),
              ),
           ),
           ListTile(
             
             title: Text("Boolean Values",
             style: TextStyle(color: Colors.green),
             ),
              subtitle: Text('print(bool("Hello")); print(bool(15))',
              style: TextStyle(color: Colors.green),
              ),
           ),
           ListTile(
             
             title: Text("Operators",
             style: TextStyle(color: Colors.green),
             ),
              subtitle: Text(
                'Addition: "+"; x + y',
                'Subtraction: "-"; x - y',
                'Multiplication: "*"; x * y',
                'Division: "/"; x / y',
                'Modulus: "%", x % y',
                'Exponentiation: "**"; x ** y',
                'Floor Division: "//"; x // y',
              style: TextStyle(color: Colors.green),
              ),
           ),
           ListTile(
             
             title: Text("Comparison Operators",
             style: TextStyle(color: Colors.green),
             ),
              subtitle: Text(
                'Equal: "=="; x == y',
                'Not Equal: "!="; x != y',
                'Greater Than: ">"; x > y',
                'Less Than: "<"; x < y',
                'Greater than or equal to: ">="; x >= y',
                'Less than or equal to: "<="; x < = y',
              style: TextStyle(color: Colors.green),
              ),
           ),
           ListTile(
             
             title: Text("Logical Operators",
             style: TextStyle(color: Colors.green),
             ),
              subtitle: Text(
                '',
                '',
                '',
                '',
                '',
                '',
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


