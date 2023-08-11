
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputDisplayScreen extends StatefulWidget {
  @override
  _InputDisplayScreenState createState() => _InputDisplayScreenState();
}

class _InputDisplayScreenState extends State<InputDisplayScreen> {
  TextEditingController _textEditingController = TextEditingController();
  String _displayedText = '';

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _onSubmit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String inputText = _textEditingController.text;
    setState(() {
      _displayedText = inputText;
    });
    await prefs.setString('savedText', inputText);
    print(_displayedText);
  }

  void _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedText = prefs.getString('savedText') ?? '';
    setState(() {
      _displayedText = savedText;
      _textEditingController.text = savedText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input & Display Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Enter your text here',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onSubmit,
              child: Text('Save'),
            ),
            SizedBox(height: 20),
            Text(
              'Displayed Text:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              _displayedText,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}