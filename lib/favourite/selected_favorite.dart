
import 'package:flutter/material.dart';
import 'package:learning/users.dart';
import 'package:provider/provider.dart';

import 'favoritr_provider.dart';

class SelectedFavoriteItems extends StatelessWidget {
   SelectedFavoriteItems({required this.user,Key? key}) : super(key: key);

  Users user;

  @override
  Widget build(BuildContext context) {

    var favoriteProvider = Provider.of<FavoriteProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Items screen'),
      ),
      body:Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favoriteProvider.selectItems.length,
                itemBuilder: (context, index){
                  return Consumer<FavoriteProvider>(builder: (context, value, child){
                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: Card(
                        color: Colors.blue.shade200,
                        child: ListTile(
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
                        ),
                      ),
                    );
                  });
                }),
          )

        ],
      ) ,
    );
  }
}
