import 'package:flutter/material.dart';

import '../bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  final UserProfile userProfile;

  HomeScreen({required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Id Card'),
      ),
      body: SafeArea(
        child: Card(
          margin: EdgeInsets.all(20),
          color: Colors.grey.shade100,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.blue,
                    // backgroundImage: AssetImage('images/my_pic.jfif'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${userProfile.fullName}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    width: 150,
                    child: Divider(),
                  ),
                  buildCard(Icons.numbers, "Ward No : ${userProfile.wardNumber}"),
                  buildCard(Icons.location_city, "City : ${userProfile.city}"),
                  buildCard(Icons.person, "Info : ${userProfile.profileInfo}"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Card buildCard(IconData iconData, String text) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: ListTile(
        leading: Icon(
          iconData,
          size: 15,
          // color: Colors.teal,
        ),
        title: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            // color: Colors.teal.shade900,
            // fontFamily: 'SourceSansPro',
          ),
        ),
      ),
    );
  }
}
