import 'package:flutter/material.dart';
import 'package:myapp/models/user/user_model.dart';


class UsersScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(
      id:1,
      name: "Ali Hassan Ali",
      phone: "01098344748",
    ),
    UserModel(
      id:2,
      name: "Ahmad Hassan Ali",
      phone: "01065661166",
    ),
    UserModel(
      id:3,
      name: "Mostafa Hassan Ali",
      phone: "01158461416",
    ),
    UserModel(
      id:1,
      name: "Ali Hassan Ali",
      phone: "01098344748",
    ),
    UserModel(
      id:2,
      name: "Ahmad Hassan Ali",
      phone: "01065661166",
    ),
    UserModel(
      id:3,
      name: "Mostafa Hassan Ali",
      phone: "01158461416",
    ),
    UserModel(
      id:1,
      name: "Ali Hassan Ali",
      phone: "01098344748",
    ),
    UserModel(
      id:2,
      name: "Ahmad Hassan Ali",
      phone: "01065661166",
    ),
    UserModel(
      id:3,
      name: "Mostafa Hassan Ali",
      phone: "01158461416",
    ),
    UserModel(
      id:1,
      name: "Ali Hassan Ali",
      phone: "01098344748",
    ),
    UserModel(
      id:2,
      name: "Ahmad Hassan Ali",
      phone: "01065661166",
    ),
    UserModel(
      id:3,
      name: "Mostafa Hassan Ali",
      phone: "01158461416",
    ),
    UserModel(
      id:1,
      name: "Ali Hassan Ali",
      phone: "01098344748",
    ),
    UserModel(
      id:2,
      name: "Ahmad Hassan Ali",
      phone: "01065661166",
    ),
    UserModel(
      id:3,
      name: "Mostafa Hassan Ali",
      phone: "01158461416",
    ),
    UserModel(
      id:1,
      name: "Ali Hassan Ali",
      phone: "01098344748",
    ),
    UserModel(
      id:2,
      name: "Ahmad Hassan Ali",
      phone: "01065661166",
    ),
    UserModel(
      id:3,
      name: "Mostafa Hassan Ali",
      phone: "01158461416",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ''
          'Users',
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => buildUserItems(users[index]),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20.0,
          ),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount: users.length,
      ),
    );
  }

  Widget buildUserItems(UserModel users) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              child: Text(
                '${users.id}',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${users.name}',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${users.phone}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            )
          ],
        ),
      );
// 1. bulid item
//2. bulid list
// 3. add item to list
}
