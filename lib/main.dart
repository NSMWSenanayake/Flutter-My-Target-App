import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mytarget/pages/target/create.dart';
import 'package:mytarget/tabs/ChartPage.dart';
import 'package:mytarget/tabs/HistoryPage.dart';
import 'package:mytarget/tabs/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){

    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'MyTarget',
      home: Root(),
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
    );
  }
}

class Root extends StatefulWidget {
  const Root({ Key? key }) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {


  int index=0;

  List<Widget> tabs=[];


  late Widget page;
  bool pageAssigned=false;


  @override
  Widget build(BuildContext context) {

    tabs.add(HomePage());
    tabs.add(ChartPage());
    tabs.add(HistoryPage());




    return Scaffold(
      appBar: AppBar(
        title: Text("My Target"),
      ),
      floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: (){
        setState(() {

          page = TargetCreate();
          pageAssigned=true;

        });
      },
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
               const DrawerHeader(
               decoration: BoxDecoration(
               color: Colors.amber,
              ),
              child: Text('Drawer Header'),
            ),


                ListTile(
                title: const Text('Collection History'),
                onTap: () {
                // Update the state of the app.
                // ...
               },
             ),


             ListTile(
             title: const Text('My Profile'),
             onTap: () {
             // Update the state of the app.
             // ...
            },
          ),


            ListTile(
                title: const Text('Log out'),
                onTap: () {
                // Update the state of the app.
                // ...
               },
             ),

      

          ],
        ),
      ),

     // body: HomePage(),

      body: pageAssigned? page: tabs[index],           //take page if page is assigned, otherwise take tab if page is not assigned. 

      bottomNavigationBar: BottomNavigationBar(


        currentIndex: index,
        onTap: (i){
          setState(() {
            index=i;
            pageAssigned=false;
          });
        },



        items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("HOME")
          ),

           BottomNavigationBarItem(
          icon: Icon(Icons.pie_chart),
          title: Text("CHARTS")
          ),

           BottomNavigationBarItem(
          icon: Icon(Icons.history), 
          title: Text("HISTORY")
          )
      ]
      
      ),
    );
  }
}