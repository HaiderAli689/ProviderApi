

import 'package:flutter/material.dart';
import 'package:learning/users.dart';

class DisplayDcreen extends StatelessWidget {
   DisplayDcreen({/* required this.firstName, required this.lastName,*/Key? key, required this.user}) : super(key: key);

   Users user;
  /*String firstName;
  String lastName;
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Text'),
      ),
      body:Column(
        children: [
          SizedBox(height: 100,),
          Text(user.email.toString()),
          Text(user.username.toString()),
        ],
      ) ,
    );
  }
}
