

import 'package:flutter/material.dart';

import 'display_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  TextEditingController _enterdFirstName = TextEditingController();
  TextEditingController _enterdLastName = TextEditingController();
  String _displayFirstName= '';
  String _displayLastName  = '';

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _enterdFirstName.dispose();
    _enterdLastName.dispose();
  }

  void _submit(){
    setState(() {
      _displayFirstName = _enterdFirstName.text;
      _displayLastName = _enterdLastName.text;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Text display testig"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32,),
            Text(_displayFirstName, style: TextStyle(
              fontSize: 24
            ),),SizedBox(height: 32,),
            Text(_displayLastName, style: TextStyle(
              fontSize: 24
            ),),
            SizedBox(height: 32,),
            TextFormField(
              controller: _enterdFirstName,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Enter something",

              ),
              onSaved: (text){
                setState(() {
                  _displayFirstName = text!;
                });
              },
            ),
            SizedBox(height: 32,),
            TextFormField(
              controller: _enterdLastName,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Enter something",

              ),
              onSaved: (text){
                setState(() {
                  _displayLastName = text!;
                });
              },
            ),
            SizedBox(height: 12,),
            Center(
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    DisplayDcreen(firstName: _enterdFirstName.text, lastName: _enterdLastName.text,)));
              },
                  child: Text("Saved")),
            )
          ],
        ),
      ),
    );
  }
}
