


import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users")),
      body:  Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(''),
                      ),
                      SizedBox(width: 12,),
                      Expanded(child: Text('name',style: TextStyle(fontSize: 18),))
                    ],
                  ),
                );
              },
          separatorBuilder: (context,index){
                return Divider();
          },
            ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: (){

        },
        child: Text("Logout"),
      ),
    );
  }
}