


import 'package:flutter/material.dart';
import 'package:gs_demo/features/auth_management/provider/auth_providers.dart';
import 'package:gs_demo/features/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final usersProvider = Provider.of<UsersProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Users")),
      body:  Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: usersProvider.users.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
          itemCount: usersProvider.users.length,
              itemBuilder: (context, index) {
                final user = usersProvider.users[index];
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(user.profileUrl),
                      ),
                      SizedBox(width: 12,),
                      Expanded(child: Text(user.name,style: TextStyle(fontSize: 18),))
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
        onPressed: () => auth.logout(),
        child: Text("Logout"),
      ),
    );
  }
}