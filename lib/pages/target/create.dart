import 'package:flutter/material.dart';

class TargetCreate extends StatefulWidget {
  const TargetCreate({ Key? key }) : super(key: key);

  @override
  _TargetCreateState createState() => _TargetCreateState();
}

class _TargetCreateState extends State<TargetCreate> {

  TextEditingController txtName=new TextEditingController();
  TextEditingController txtAmount=new TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Container(
     
        child: SingleChildScrollView(
          child: Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,    //take full width
                children: [
                  Text("Add New Target",textScaleFactor: 1.6,),
                  SizedBox(height: 20.0,),
                  Text("Target Name"),
                  TextFormField(

                    controller: txtName,    //assign values to txtName when typing

                  ),
                  SizedBox(height: 20.0,),
                  Text("Target Amount"),
                  TextFormField(

                    controller: txtAmount,   //assign values to txtAmount when typing
                    keyboardType: TextInputType.number,  //get keyboard to type only numbers
                      
              
                  ),
                  SizedBox(height: 20.0,),
                  Text("Target Date"),
                  ElevatedButton(                  //button to choose a date
                    onPressed: (){

                  },
                   child: Text("Select a Date")
                   )
                ],
              ),
            ),
          ),
        ),
      
      
    );
  }
}