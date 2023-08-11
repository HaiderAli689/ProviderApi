
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  List<Map<String, dynamic>> _allUsers =[

    {"name": 'Haider', "roll_no": 22889, 'age': 21},
    {"name": 'Ali', "roll_no": 22888, 'age': 21},
    {"name": 'Talha', "roll_no": 22222, 'age': 21},
    {"name": 'Boota', "roll_no": 22801, 'age': 20},
    {"name": 'Ahsan', "roll_no": 22143, 'age': 21},
  ];

  List<Map<String, dynamic>> _foundUsers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _foundUsers = _allUsers;
  }

  void _runFilter(String enteredKeywords){
    List<Map<String, dynamic>> results = [];
    if(enteredKeywords.isEmpty){
      results = _allUsers;
    }
    else{
      results = _allUsers.where((user) =>
          user['name'].toLowerCase().contains(enteredKeywords.toLowerCase())
      ).toList();
    }
    setState(() {
      _foundUsers = results;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(height: 20,),
            TextField(
              onChanged: (value) =>  _runFilter(value),
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: Icon(Icons.search)
              ),

            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemCount: _foundUsers.length,
                  itemBuilder: (context, index) => Card(
                    key: ValueKey(_foundUsers[index]['roll_no'].toString()),
                    color: Colors.blue,
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(_foundUsers[index]['name'].toString(), style: TextStyle(
                        fontSize: 24,
                        color: Colors.white
                      ),),
                      subtitle: Text(_foundUsers[index]['age'].toString(), style: TextStyle(
                          fontSize: 18,
                          color: Colors.white
                      ),),
                      trailing: Text(_foundUsers[index]['roll_no'].toString(), style: TextStyle(
                          fontSize: 24,
                          color: Colors.white
                      ),),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
