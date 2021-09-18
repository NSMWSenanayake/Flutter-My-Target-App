import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   final Stream<QuerySnapshot> _targetStream = FirebaseFirestore.instance.collection('targets').snapshots();

  @override
  Widget build(BuildContext context) {

  //  return Container(
  //    child: Text("Home Page"),
  //  );

  return
  SingleChildScrollView(
   child: StreamBuilder<QuerySnapshot>(
      stream: _targetStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){


        if (snapshot.hasError) {
          return Text('Something went wrong');       //when it goes to database and retreive data, display message if there is something wrong
        }

        if (snapshot.connectionState == ConnectionState.waiting) {       //otherwise loading message will display 
          return Text("Loading... ");
        }


        return new ExpansionPanelList(
          children: snapshot.data!.docs.map(
            (DocumentSnapshot document) {
              dynamic doc = document.data();
        //   Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return ExpansionPanel(
            //  title: Text(doc['name']),
            //  subtitle: Text(doc['amount'].toString()),
           headerBuilder: (BuildContext context,bool isExpanded){
             return Container(
               padding: EdgeInsets.all(10.0 ),
               child: Text(doc["name"],textScaleFactor: 1.5,),
               );
           },
           body: Container(
             padding: EdgeInsets.all(10.0),
             child: Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("Amount: "+doc["amount"].toString(),textScaleFactor: 1.1,),
                     Text("Date: "+doc["date"].toDate().toString().split(" ")[0],textScaleFactor: 1.1,),
                   ],
                 ),
                 Divider(),     
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                   Text(doc["contribution_total"].toString()+" / "+doc["amount"].toString()),
                   IconButton(
                       icon: Icon(Icons.attach_money),
                       splashColor: Colors.green,   // when touch the dolar simbol green color comes
                       highlightColor: Colors.greenAccent,
                       color: Colors.green,
                       onPressed: (){

                       },
                     )

                   
                 ],
                 ),

                 LinearProgressIndicator(
                   valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
                   value: doc["contribution_total"]/ doc["amount"],
                   //value: 0.5,
                 )

               ],
             ),
            // Text(doc["amount"].toString()),
           ),
           isExpanded: true
           
           
            );
          }
          ).toList(),

        );



      }
    
  )
  );

  }
}