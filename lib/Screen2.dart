import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screen2 extends StatefulWidget {
  const Screen2(String text, {Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  TextEditingController controller = new TextEditingController();
  String name = '';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 20),
            ),

            ElevatedButton(onPressed: () {
              Retrive();
            }, child: Text('Retrive')),

            ElevatedButton(onPressed:() {
              Delete();
            }, child: Text('Delete'))
          ],
        ),
      ),
    );
  }


  void Retrive() async {
    var sharedPreference = await SharedPreferences.getInstance();
    var text = sharedPreference.getString('Key_name');
    setState(() {
      this.name = text ?? '';
    });
  }

    void Delete() async {
      var sharedPreference = await SharedPreferences.getInstance();
      sharedPreference.remove('Key_name');
    }



}