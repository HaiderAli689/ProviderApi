


import 'package:flutter/material.dart';
import 'package:learning/favourite/favoritr_provider.dart';
import 'package:learning/favourite/selected_favorite.dart';
import 'package:learning/users.dart';
import 'package:provider/provider.dart';

class FavoriteDcreen extends StatelessWidget {
  FavoriteDcreen({/* required this.firstName, required this.lastName,*/Key? key, required this.user,}) : super(key: key);

   Users user;

  /*String firstName;
  String lastName;
*/
  @override
  Widget build(BuildContext context) {

    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite screen'),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SelectedFavoriteItems(user: user,)));
            },
              child: Icon(Icons.favorite)),
          SizedBox(width: 24,),
        ],
      ),
      body:Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 20,
                itemBuilder: (context, index){
                return Consumer<FavoriteProvider>(builder: (context, value, child){
                  return ListTile(
                    onTap: (){
                      if(value.selectItems.contains(index)){
                        value.removeItems(index);
                      }else{
                        value.addItems(index);
                      }
                    },
                    title: Text(user.name.toString()),
                    subtitle:Text(user.email.toString()) ,
                    trailing: value.selectItems.contains(index) ? Icon(Icons.favorite)  : Icon(Icons.favorite_outline),
                  );
                });
                }),
          )

        ],
      ) ,
    );
  }
}
