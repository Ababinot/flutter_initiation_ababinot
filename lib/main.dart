
import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Découverte de flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Découverte de flutter'),

    );
  }
}
class DeBox extends StatelessWidget {
    DeBox({Key? key, this.faceDe, this.description, this.valeur, this.image}) 
      : super(key: key); 
   final String? faceDe; 
   final String? description; 
   final int? valeur; 
   final String? image; 
    Widget build(BuildContext context) {
          return Container(
            padding: EdgeInsets.all(2), height: 120,  child: Card( 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, children:    <Widget>[
                      Image.asset("images/" +image!), Expanded(
                        child: Container(
                            padding: EdgeInsets.all(5), child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                                  children: <Widget>[ 
                                  
                                  Text(this.faceDe!, style: TextStyle(fontWeight: 
                                    FontWeight.bold)), Text(this.description!), 
                                  Text("Valeur: " + this.valeur.toString()), 
                              ], 
                            )
                        )
                      )
                  ]
                )
            )
          );
      }
    }


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int index = 0;
  int currentPageIndex=0;
  int _random = 0;
  int _random1 = 0;
  int _saisieUser = 0;
 
  
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  void randomCounter() {
    setState(() {
      if(_counter>=1){
        var intValue1 = Random().nextInt(_counter);
         _random = intValue1;

         var intValue = Random().nextInt(_counter);
         _random1 = intValue;

      }
      
     
    });
    
  }

void _showToast(BuildContext context, String _message) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
	  SnackBar(
      content: Text(_message),        
	  ),
	);
}

  void valider() {
    setState(() {
      int rep = _random + _random1;
      if(_saisieUser==rep){
        _showToast(context, 'bonne réponse : '+ rep.toString());
      }

      else{
         _showToast(context, 'mauvaise réponse la réponse était: '+ rep.toString());
      }
      
    });
    
  }
   void _decrementCounter() {
     setState(() {
        // This call to setState tells the Flutter framework that something has
        // changed in this State, which causes it to rerun the build method below
        // so that the display can reflect the updated values. If we changed
        // _counter without calling setState(), then the build method would not be
        // called again, and so nothing would appear to happen.
       _counter--;
    });
  }
  void _crementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(

        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),

      ),
      body: <Widget>[
              Container(   
                
                child: ListView(
                    children: <Widget>[
                    
                    
                          Image.asset('images/img2.png',width:300, height:300,fit:BoxFit.scaleDown),

                          Align(
                            alignment:Alignment.center, 
                            child: const Text( 'Nombre : ',
                          ),),
                          Align(alignment:Alignment.center, child:Text(
                            '$_counter',
                            style: Theme.of(context).textTheme.headline4,
                          ),),
                    ],
                ),
              ),
              
              Container(
              
                color: Colors.green,
                
                
                child : ListView(children: <Widget>[
                  Align(alignment:Alignment.center, child:Text(
                            '$_random + $_random1',
                            style: Theme.of(context).textTheme.headline4,
                        ),),
                  Align(alignment: Alignment.center,
                  child:TextButton(style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.grey
                    ),
                
                    onPressed: randomCounter,
                    child: const Text('Générer un nombre aléatoire'),
                    ),),
                    TextField (
                        
                        keyboardType: TextInputType.number,
                        maxLength: 25,
                          style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          
                          fontWeight: FontWeight.bold,
                         ),
                        decoration: const InputDecoration(
                          labelText: 'Entrer la solution',
                          hintText: 'Entrer un nombre',
                        border: OutlineInputBorder()),
                        onChanged: (value) { 
                          setState(() {
                             if(int.tryParse(value)!= null){
                                _saisieUser = int.parse(value);
                             }
                          });
                          
                        
                       }

                    ),

                    Align(
                      alignment: Alignment.center,
                      child:TextButton(style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.grey
                      ),
                      
                      onPressed: valider,
                      child: const Text('Valider'),
                    ),),
                    

                ],),
                
                 
               
          
              ),
               Container(
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: ListView(
                    shrinkWrap: true, padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0), 
                    children: <Widget> [
                      DeBox(
                          faceDe: "1", 
                          description: "La face 1 du dé", 
                          valeur: 1, 
                          image: "1.png"
                      ),
                      DeBox(
                          faceDe: "2", 
                          description: "La face 2 du dé", 
                          valeur: 2, 
                          image: "2.png"
                      ),
                      DeBox(
                          faceDe: "3", 
                          description: "La face 3 du dé", 
                          valeur: 3, 
                          image: "3.png"
                      ),
                      DeBox(
                          faceDe: "4", 
                          description: "La face 4 du dé", 
                          valeur: 4, 
                          image: "4.png"
                      ),
                      DeBox(
                          faceDe: "5", 
                          description: "La face 5 du dé", 
                          valeur: 5, 
                          image: "5.png"
                      ),  
                      DeBox(
                          faceDe: "6", 
                          description: "La face 6 du dé", 
                          valeur: 6, 
                          image: "6.png"
                      ),          
                    ],

                  )
               ),
              
            ][currentPageIndex],
          
        
      
      

      
        floatingActionButton: Stack(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left:31),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  onPressed: _decrementCounter,
                  child: Icon(Icons.exposure_minus_1),),
              ),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: _incrementCounter,
                child: Icon(Icons.add),),
            ),

            Padding(padding: EdgeInsets.only(left:31),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FloatingActionButton(
                  onPressed: _crementCounter,
                  child: Icon(Icons.exposure_zero),),
              ),
            ),
          ],
        ),

        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex=index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Acceuil',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.menu),
              icon: Icon(Icons.skip_next),
              label: 'Page Suivante',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.casino),
              icon: Icon(Icons.gamepad),
              label: 'Parametres',
              
            ),
          ],
        ),
    );
  }
}
