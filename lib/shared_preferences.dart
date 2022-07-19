import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './Screen2.dart';

class app extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _appState();
  }
}

class _appState extends State<app> {
  // Editing controller
  TextEditingController controller=new TextEditingController();
  String name ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller:controller ,
              decoration: InputDecoration(
                border:  OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>Screen2(
                   controller.text
                  )));
              Save(controller.text);
              },
                child: Text('Save')),
          ],
        ),
      ),
    );
  }



   void Save( String text) async{
    var sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setString('Key_name', text);

   }


   }

