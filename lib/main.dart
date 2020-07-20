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
              subtitle: Text('# this is how you comment',
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
             
             title: Text("Boolean Values",
             style: TextStyle(color: Colors.green),
             ),
              subtitle: Text('print(bool("Hello")); print(bool(15))',
              style: TextStyle(color: Colors.green),
              ),
           ),
           ListTile(
             
             title: Text("Print List",
             style: TextStyle(color: Colors.green),
             ),
              subtitle: Text(
                'Thislist = [“apple”,”banana”,”cherry”]; print(this list)',
              style: TextStyle(color: Colors.green),
              ),
           ),
           ListTile(
             
             title: Text("Access List Items",
             style: TextStyle(color: Colors.green),
             ),
              subtitle: Text(
                'Thislist = [“apple”,”banana”,”cherry”]; print(this list[1])',
              style: TextStyle(color: Colors.green),
              ),
           ),
           ListTile(
             
             title: Text("Negative Indexing",
             style: TextStyle(color: Colors.green),
             ),
              subtitle: Text(
                'Negative indexing means beginning from the end: Thislist = [“apple”,”banana”,”cherry”]; print(this list[-1])',
              style: TextStyle(color: Colors.green),
              ),
           ),
           ListTile(
             
             title: Text("Range of Indexes",
             style: TextStyle(color: Colors.green),
             ),
              subtitle: Text(
                'thislist = ["apple", "banana", "cherry", "orange", "kiwi", "melon", "mango"]: print(thislist[2:5]); banana, cherry, orange, kiwi, melon',
              style: TextStyle(color: Colors.green),
              ),
           ),
           ListTile(
             
             title: Text("Change Item Value",
             style: TextStyle(color: Colors.green),
             ),
              subtitle: Text(
                'thislist = ["apple", "banana", "cherry"]; thislist[1] = "blackcurrant"; print(thislist); blackcurrant, banana, cherry',
              style: TextStyle(color: Colors.green),
              ),
           ),
           ListTile(
             
             title: Text("List Length",
             style: TextStyle(color: Colors.green),
             ),
              subtitle: Text(
                'thislist = ["apple", "banana", "cherry"]; print(len(thislist)); Equals 3',
              style: TextStyle(color: Colors.green),
              ),
           ),
           ListTile(
             
             title: Text("Add to List",
             style: TextStyle(color: Colors.green),
             ),
              subtitle: Text(
                'thislist = ["apple", "banana", "cherry"]; thislist.append("orange"); print(thislist); apple, banana, cherry, orange',
              style: TextStyle(color: Colors.green),
              ),
           ),
           ListTile(
             
             title: Text("Insert item to List",
             style: TextStyle(color: Colors.green),
             ),
              subtitle: Text(
                'thislist = ["apple", "banana", "cherry"]; thislist.insert(1, "orange"); print(thislist); orange, apple, banana, cherry',
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
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Header Tag",
            style: TextStyle(color: Colors.green),
            ),
            subtitle: Text("<h(1-6)>; size in descending order from 1-6")
          ),
          ListTile(
            title: Text("Paragraph Tag",
            style: TextStyle(color: Colors.green),
            ),
            subtitle: Text("<p> will create a paragraph on the document")
          ),
          ListTile(
            title: Text("Div Tag",
            style: TextStyle(color: Colors.green),
            ),
            subtitle: Text("<div> will create a container for all paragraphs or header tags, letting you organize work")
          ),
           ListTile(
            title: Text("Formatting Text",
            style: TextStyle(color: Colors.green),
            ),
            subtitle: Text("<b> for bold text; <strong> for important text; <i> for italic text; <em> for emphasized text; <small> for smaller text; <del> for deleted text; <ins> for inserted text; <Sub> for subscript text; <sup> for superscript text")
          ),
           ListTile(
            title: Text("Comment tags",
            style: TextStyle(color: Colors.green),
            ),
            subtitle: Text("<!-- Insert Tage Here -->")
          ),
          ListTile(
            title: Text("Block and Inline",
            style: TextStyle(color: Colors.green),
            ),
            subtitle: Text("a <div> tag is a block element that will create a new line; a <span> tag will only take up as much space as it needs on a pre-existing line")
          ),
        ],
      ),
    );
  }
}





class JavascriptRoute extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Javascript"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("OnClick Funtion",
            style: TextStyle(color: Colors.green),
            ),
            subtitle: Text("<button onclick = 'X command'>X label</button>")
          ),
          ListTile(
            title: Text("Changing a HTML image",
            style: TextStyle(color: Colors.green),
            ),
            subtitle: Text("using the onclick command, you can input onclick = 'document.getElementbyId('myImage').src = 'newSource'")
          ),
          ListTile(
            title: Text("Hide an HTML element",
            style: TextStyle(color: Colors.green),
            ),
            subtitle: Text("document.getElementById('demo').style.display= 'none'")
          ),
          ListTile(
            title: Text("Changing the Display Style of an HTML element",
            style: TextStyle(color: Colors.green),
            ),
            subtitle: Text("document.getElementById('demo').style.display = 'block' or 'inline'")
          ),
          ListTile(
            title: Text("Functions",
            style: TextStyle(color: Colors.green),
            ),
            subtitle: Text("A Javascript function is a block of code that can perform tasks. Ex: function myFunction(x,y){return x*y;}; return(myFunction(4,3)/ this will print the number 12)")
          ),
          ListTile(
            title: Text("Window.alert",
            style: TextStyle(color: Colors.green),
            ),
            subtitle: Text("To send an alert to the user and/or player, you can input either window.alert(X number, phrase, or boolean), or you can type the same phrase without the window keyword")
          ),
        ],
      ),
    );
  }
}



class JavaRoute extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Java"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Print a message",
            style: TextStyle(color: Colors.green),
            ),
            subtitle: Text("public class (file name){public static void main(String[] arg){System.out.println(phrase here);}}")
          ),
          ListTile(
            title: Text("The Main Method",
            style: TextStyle(color: Colors.green),
            ),
            subtitle: Text("Any code inside the main() method will be excecuted: public static void main(String[] args){insert code}")
          ),
          ListTile(
            title: Text("Variables",
            style: TextStyle(color: Colors.green),
            ),
            subtitle: Text("String: Stores Text; int: stores integers; float: floating numbers with decimals; char: stores single characters ie 'a' or 'B'; boolean: stores values that are either true or false")
          ),
          ListTile(
            title: Text("Operators",
            style: TextStyle(color: Colors.green),
            ),
            subtitle: Text("Addition: '+'; Subtraction: '-'; Multiplication: '*'; Division: '/'; Modulus: '%' Returns the division remainder; Increment: '++' Increases the value of a variable by 1; Decrement: '--' Decreases the value of a variable by 1")
          ),
          ListTile(
            title: Text("Locate where an element of a String",
            style: TextStyle(color: Colors.green),
            ),
            subtitle: Text("System.out.println(tx.stringName(soughtOutElement); this will count the amount of characters before the start of the element, counting numbers and letters, spaces are not included")
          ),
          ListTile(
            title: Text("Math.max",
            style: TextStyle(color: Colors.green),
            ),
            subtitle: Text("Using Math.max, you can identify the highest value between x and y: Math.man(5,10) returns 10")
          ),
        ],
      ),
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


